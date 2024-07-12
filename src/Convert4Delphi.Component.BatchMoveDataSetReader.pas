unit Convert4Delphi.Component.BatchMoveDataSetReader;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces.Components,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.Client;

Type

  TBatchMoveDataSetReader = class(TInterfacedObject, iBatchMoveDataSetReader)
    private
      FBatchMoveDataSetReader: TFDBatchMoveDataSetReader;
    public
      Constructor Create(AQuery: TFDQuery);
      Destructor Destroy; Override;
      class function New(AQuery: TFDQuery): iBatchMoveDataSetReader;
      function Component: TFDBatchMoveDataSetReader;
  end;

implementation

{ TBatchMoveDataSetReader }

function TBatchMoveDataSetReader.Component: TFDBatchMoveDataSetReader;
begin
  Result := FBatchMoveDataSetReader;
end;

Constructor TBatchMoveDataSetReader.Create(AQuery: TFDQuery);
begin
  FBatchMoveDataSetReader := TFDBatchMoveDataSetReader.Create(nil);
  FBatchMoveDataSetReader.DataSet := AQuery;
end;

destructor TBatchMoveDataSetReader.Destroy;
begin
  FreeAndNil(FBatchMoveDataSetReader);
  inherited;
end;

class function TBatchMoveDataSetReader.New(AQuery: TFDQuery): iBatchMoveDataSetReader;
begin
  Result := Self.Create(AQuery);
end;

end.

