unit Convert4Delphi.Component.BatchMoveSQLReader;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces.Components,
  FireDAC.Comp.BatchMove.SQL, FireDAC.Comp.Client;

Type

  TBatchMoveSQLReader = class(TInterfacedObject, iBatchMoveSQLReader)
    private
      FBatchMoveSQLReader: TFDBatchMoveSQLReader;
    public
      Constructor Create(AConexao: TFDConnection; ATableName: String);
      Destructor Destroy; Override;
      class function New(AConexao: TFDConnection; ATableName: String): iBatchMoveSQLReader;
      function Component: TFDBatchMoveSQLReader;
  end;

implementation

{ TBatchMoveSQLReader }

function TBatchMoveSQLReader.Component: TFDBatchMoveSQLReader;
begin
  Result := FBatchMoveSQLReader;
end;

Constructor TBatchMoveSQLReader.Create(AConexao: TFDConnection; ATableName: String);
begin
  FBatchMoveSQLReader := TFDBatchMoveSQLReader.Create(nil);
  FBatchMoveSQLReader.Connection := AConexao;
  FBatchMoveSQLReader.TableName := ATableName;
end;

destructor TBatchMoveSQLReader.Destroy;
begin
  FreeAndNil(FBatchMoveSQLReader);
  inherited;
end;

class function TBatchMoveSQLReader.New(AConexao: TFDConnection; ATableName: String): iBatchMoveSQLReader;
begin
  Result := Self.Create(AConexao, ATableName);
end;

end.

