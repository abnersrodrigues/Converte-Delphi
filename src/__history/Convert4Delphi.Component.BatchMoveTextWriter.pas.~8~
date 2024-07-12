unit Convert4Delphi.Component.BatchMoveTextWriter;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces.Components,
  FireDAC.Comp.BatchMove.Text;

Type

  TBatchMoveTextWriter = class(TInterfacedObject, iBatchMoveTextWriter)
    private
      FBatchMoveTextWriter: TFDBatchMoveTextWriter;
    public
      Constructor Create(ADest: String);
      Destructor Destroy; Override;
      class function New(ADest: String): iBatchMoveTextWriter;
      function Component: TFDBatchMoveTextWriter;
  end;

implementation

uses
  FireDAC.Stan.Intf;

{ TBatchMoveTextWriter }

function TBatchMoveTextWriter.Component: TFDBatchMoveTextWriter;
begin
  Result := FBatchMoveTextWriter;
end;

Constructor TBatchMoveTextWriter.Create(ADest: String);
begin
  FBatchMoveTextWriter                        := TFDBatchMoveTextWriter.Create(nil);
  FBatchMoveTextWriter.Encoding               := TFDEncoding.ecANSI;
  FBatchMoveTextWriter.DataDef.Delimiter      := '"';
  FBatchMoveTextWriter.DataDef.Separator      := ';';
  FBatchMoveTextWriter.DataDef.WithFieldNames := true;
  FBatchMoveTextWriter.FileName               := ADest;
end;

destructor TBatchMoveTextWriter.Destroy;
begin
  FreeAndNil(FBatchMoveTextWriter);
  inherited;
end;

class function TBatchMoveTextWriter.New(ADest: String): iBatchMoveTextWriter;
begin
  Result := Self.Create(ADest);
end;

end.
