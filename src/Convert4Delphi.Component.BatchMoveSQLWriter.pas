unit Convert4Delphi.Component.BatchMoveSQLWriter;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces.Components,
  FireDAC.Comp.BatchMove.SQL, FireDAC.Comp.Client;

Type

  TBatchMoveSQLWriter = class(TInterfacedObject, iBatchMoveSQLWriter)
    private
      FBatchMoveSQLWriter: TFDBatchMoveSQLWriter;
    public
      Constructor Create(AConexao: TFDConnection; ATableName: String);
      Destructor Destroy; Override;
      class function New(AConexao: TFDConnection; ATableName: String): iBatchMoveSQLWriter;
      function Component: TFDBatchMoveSQLWriter;
  end;

implementation

{ TBatchMoveSQLWriter }

function TBatchMoveSQLWriter.Component: TFDBatchMoveSQLWriter;
begin
  Result := FBatchMoveSQLWriter;
end;

Constructor TBatchMoveSQLWriter.Create(AConexao: TFDConnection; ATableName: String);
begin
  FBatchMoveSQLWriter := TFDBatchMoveSQLWriter.Create(nil);
  FBatchMoveSQLWriter.Connection := AConexao;
  FBatchMoveSQLWriter.TableName := ATableName;
end;

destructor TBatchMoveSQLWriter.Destroy;
begin
  FreeAndNil(FBatchMoveSQLWriter);
  inherited;
end;

class function TBatchMoveSQLWriter.New(AConexao: TFDConnection; ATableName: String): iBatchMoveSQLWriter;
begin
  Result := Self.Create(AConexao, ATableName);
end;

end.

