unit Convert4Delphi.Importar;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces,
  FireDAC.Comp.Client, Convert4Delphi.Interfaces.Components;

Type

  TImport = class(TInterfacedObject, iImportar)
    private
      FBatchMove: iBatchMove;
      FBatchMoveDataSetWriter: iBatchMoveDataSetWriter;
      FBatchMoveTextReader: iBatchMoveTextReader;
    public
      Constructor Create(AQuery: TFDQuery; AOrig: String);
      Destructor Destroy; Override;
      class function New(AQuery: TFDQuery; AOrig: String): iImportar;
      function Executar: iImportar;
  end;

implementation

uses
  Convert4Delphi.Component.BatchMove,
  Convert4Delphi.Component.BatchMoveDataSetWriter,
  Convert4Delphi.Component.BatchMoveTextReader;

{ TImport }

Constructor TImport.Create(AQuery: TFDQuery; AOrig: String);
begin
  FBatchMove              := TBatchMove.New;
  FBatchMoveDataSetWriter := TBatchMoveDataSetWriter.New(AQuery);
  FBatchMoveTextReader    := TBatchMoveTextReader.New(AOrig);
end;

destructor TImport.Destroy;
begin

  inherited;
end;

function TImport.Executar: iImportar;
begin
  Result := Self;
  TBatchMove(FBatchMove).Component.Reader := TBatchMoveTextReader(FBatchMoveTextReader).Component;
  TBatchMove(FBatchMove).Component.Writer := TBatchMoveDataSetWriter(FBatchMoveDataSetWriter).Component;
  TBatchMove(FBatchMove).Component.Execute;
end;

class function TImport.New(AQuery: TFDQuery; AOrig: String): iImportar;
begin
  Result := Self.Create(AQuery, AOrig);
end;

end.

