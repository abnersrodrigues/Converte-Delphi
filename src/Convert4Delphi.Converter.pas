unit Convert4Delphi.Converter;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces,
  FireDAC.Comp.Client, Convert4Delphi.Interfaces.Components, FireDAC.Comp.UI,
  FireDAC.Comp.BatchMove.SQL;

Type

  TConverter = class(TInterfacedObject, iConverter)
    private
      FQry : TFDQuery;
      FBatchMove: iBatchMove;
      FBatchMoveSQLReader: iBatchMoveSQLReader;
      FBatchMoveSQLWriter: iBatchMoveSQLWriter;
      FGUIxWaitCursor: iGUIxWaitCursor;
      function CoutSelect(AConexaoFrom: TFDConnection; ATableNameFrom: String): Integer;
      procedure ValidaTabelaDestino(AConexaoFrom, AConexaoTo: TFDConnection; ATableNameFrom, ATableNameTo: String);
    public
      Constructor Create(AConexaoFrom, AConexaoTo: TFDConnection; ATableNameFrom, ATableNameTo: String);
      Destructor Destroy; Override;
      class function New(AConexaoFrom, AConexaoTo: TFDConnection; ATableNameFrom, ATableNameTo: String): iConverter;
      function Executar: iConverter;
  end;

Const
  AConsulta = 'select count(1) as linhas from %s';

implementation

uses
  Convert4Delphi.Component.BatchMove,
  Convert4Delphi.Component.GUIxWaitCursor,
  Convert4Delphi.Component.BatchMoveSQLReader,
  Convert4Delphi.Component.BatchMoveSQLWriter, FireDAC.Comp.BatchMove;

{ TConverter }

Constructor TConverter.Create(AConexaoFrom, AConexaoTo: TFDConnection; ATableNameFrom, ATableNameTo: String);
begin
  FBatchMove := TBatchMove.New;
  TBatchMove(FBatchMove).Component.CommitCount := CoutSelect(AConexaoFrom, ATableNameFrom);

  ValidaTabelaDestino(AConexaoFrom, AConexaoTo, ATableNameFrom, ATableNameTo);

  FGUIxWaitCursor := TGUIxWaitCursor.New(nil);
  FBatchMoveSQLReader := TBatchMoveSQLReader.New(AConexaoFrom, ATableNameFrom);
  FBatchMoveSQLWriter := TBatchMoveSQLWriter.New(AConexaoTo, ATableNameTo);
end;

destructor TConverter.Destroy;
begin

  inherited;
end;

function TConverter.Executar: iConverter;
begin
  Result := Self;
  TBatchMove(FBatchMove).Component.Reader := TBatchMoveSQLReader(FBatchMoveSQLReader).Component;
  TBatchMove(FBatchMove).Component.Writer := TBatchMoveSQLWriter(FBatchMoveSQLWriter).Component;
  TBatchMove(FBatchMove).Component.Execute;
end;

class function TConverter.New(AConexaoFrom, AConexaoTo: TFDConnection; ATableNameFrom, ATableNameTo: String): iConverter;
begin
  Result := Self.Create(AConexaoFrom, AConexaoTo, ATableNameFrom, ATableNameTo);
end;

function TConverter.CoutSelect(AConexaoFrom: TFDConnection; ATableNameFrom: String): Integer;
Begin
  Result := AConexaoFrom.ExecSQLScalar(Format(AConsulta, [ATableNameFrom]));
End;

procedure TConverter.ValidaTabelaDestino(AConexaoFrom, AConexaoTo: TFDConnection; ATableNameFrom, ATableNameTo: String);
Begin
  if AConexaoTo.DriverName = 'MSSQL' then
    begin
      FQry := TFDQuery.Create(nil);
      FQry.Connection := AConexaoTo;
      Try
        FQry.Close;
        FQry.SQL.Clear;
        FQry.SQL.Text := 'exec sp_columns '+ATableNameTo;
        FQry.Open;
        if FQry.RecordCount = 0 then
          Begin
            FQry.Close;
            FQry.SQL.Clear;
            // for�ando criar somente a estrutura //
            FQry.SQL.Text := 'select * into '+ATableNameTo+' from '+ATableNameFrom+' where 1 = 2';
            FQry.ExecSQL;
          End;
      Finally
        FreeAndNil(FQry);
      End;
    end;

End;

end.

