unit Convert4Delphi.Component.BatchMoveDataSetWriter;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces.Components,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.Client;

Type

  TBatchMoveDataSetWriter = class(TInterfacedObject, iBatchMoveDataSetWriter)
    private
      FBatchMoveDataSetWriter: TFDBatchMoveDataSetWriter;
    public
      Constructor Create(AQuery: TFDQuery);
      Destructor Destroy; Override;
      class function New(AQuery: TFDQuery): iBatchMoveDataSetWriter;
      function Component: TFDBatchMoveDataSetWriter;
  end;

implementation

{ TBatchMoveDataSetWriter }

function TBatchMoveDataSetWriter.Component: TFDBatchMoveDataSetWriter;
begin
  Result := FBatchMoveDataSetWriter;
end;

Constructor TBatchMoveDataSetWriter.Create(AQuery: TFDQuery);
begin
  FBatchMoveDataSetWriter := TFDBatchMoveDataSetWriter.Create(nil);
  FBatchMoveDataSetWriter.DataSet := AQuery;
end;

destructor TBatchMoveDataSetWriter.Destroy;
begin
  FreeAndNil(FBatchMoveDataSetWriter);
  inherited;
end;

class function TBatchMoveDataSetWriter.New(AQuery: TFDQuery): iBatchMoveDataSetWriter;
begin
  Result := Self.Create(AQuery);
end;

end.

