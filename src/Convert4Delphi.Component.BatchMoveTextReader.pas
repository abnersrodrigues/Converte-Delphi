unit Convert4Delphi.Component.BatchMoveTextReader;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces.Components,
  FireDAC.Comp.BatchMove.Text;

Type

  TBatchMoveTextReader = class(TInterfacedObject, iBatchMoveTextReader)
    private
      FBatchMoveTextReader: TFDBatchMoveTextReader;
    public
      Constructor Create(AOrig: String);
      Destructor Destroy; Override;
      class function New(AOrig: String): iBatchMoveTextReader;
      function Component: TFDBatchMoveTextReader;
  end;

implementation

uses
  FireDAC.Stan.Intf;

{ TBatchMoveTextReader }

function TBatchMoveTextReader.Component: TFDBatchMoveTextReader;
begin
  Result := FBatchMoveTextReader;
end;

Constructor TBatchMoveTextReader.Create(AOrig: String);
begin
  FBatchMoveTextReader                        := TFDBatchMoveTextReader.Create(nil);
  FBatchMoveTextReader.Encoding               := TFDEncoding.ecANSI;
  FBatchMoveTextReader.DataDef.Delimiter      := '"';
  FBatchMoveTextReader.DataDef.Separator      := ';';
  FBatchMoveTextReader.DataDef.WithFieldNames := true;
  FBatchMoveTextReader.FileName               := AOrig;
end;

destructor TBatchMoveTextReader.Destroy;
begin
  FreeAndNil(FBatchMoveTextReader);
  inherited;
end;

class function TBatchMoveTextReader.New(AOrig: String): iBatchMoveTextReader;
begin
  Result := Self.Create(AOrig);
end;

end.
