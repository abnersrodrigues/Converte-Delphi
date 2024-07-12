unit Convert4Delphi.Exportar;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces,
  FireDAC.Comp.Client, Convert4Delphi.Interfaces.Components;

Type

  TExportar = class(TInterfacedObject, iExportar)
    private
      FBatchMove: iBatchMove;
      FBatchMoveDataSetReader: iBatchMoveDataSetReader;
      FBatchMoveTextWriter: iBatchMoveTextWriter;
    public
      Constructor Create(AQuery: TFDQuery; ADest: String);
      Destructor Destroy; Override;
      class function New(AQuery: TFDQuery; ADest: String): iExportar;
      function Executar: iExportar;
  end;

implementation

uses
  Convert4Delphi.Component.BatchMoveTextWriter,
  Convert4Delphi.Component.BatchMoveDataSetReader,
  Convert4Delphi.Component.BatchMove;

{ TExportar }

Constructor TExportar.Create(AQuery: TFDQuery; ADest: String);
begin
  FBatchMove              := TBatchMove.New;

  FBatchMoveDataSetReader := TBatchMoveDataSetReader.New(AQuery);

  FBatchMoveTextWriter    := TBatchMoveTextWriter.New(ADest);
end;

destructor TExportar.Destroy;
begin

  inherited;
end;

function TExportar.Executar: iExportar;
begin
  Result := Self;
  TBatchMove(FBatchMove).Component.Reader := TBatchMoveDataSetReader(FBatchMoveDataSetReader).Component;
  TBatchMove(FBatchMove).Component.Writer := TBatchMoveTextWriter(FBatchMoveTextWriter).Component;
  TBatchMove(FBatchMove).Component.Execute;
end;

class function TExportar.New(AQuery: TFDQuery; ADest: String): iExportar;
begin
  Result := Self.Create(AQuery, ADest);
end;

end.

