unit Convert4Delphi.Component.BatchMove;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces.Components,
  FireDAC.Comp.BatchMove;

Type

  TBatchMove = class(TInterfacedObject, iBatchMove)
    private
      FBatchMove: TFDBatchMove;
    public
      Constructor Create;
      Destructor Destroy; Override;
      class function New: iBatchMove;
      function Component: TFDBatchMove;
  end;

implementation

{ TBatchMove }

function TBatchMove.Component: TFDBatchMove;
begin
  Result := FBatchMove;
end;

constructor TBatchMove.Create;
begin
  FBatchMove := TFDBatchMove.Create(nil);
end;

destructor TBatchMove.Destroy;
begin
  FreeAndNil(FBatchMove);
  inherited;
end;

class function TBatchMove.New: iBatchMove;
begin
  Result := Self.Create;
end;

end.

