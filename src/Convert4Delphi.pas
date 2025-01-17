unit Convert4Delphi;

interface

Uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, Convert4Delphi.Interfaces;

Type

  TConverter4Delphi = class(TInterfacedObject, iConvert4Delphi)
    Private

    Public
      Constructor Create;
      Destructor Destroy; Override;
      class function New: iConvert4Delphi;

      function Exportar(AQuery: TFDQuery; ADest: String): iConvert4Delphi;
      function Importar(AQuery: TFDQuery; AOrig: String):  iConvert4Delphi;
      function TabelaTabela(AConexaoFrom, AConexaoTo: TFDConnection; ATableNameFrom, ATableNameTo: String): iConvert4Delphi;
  end;

implementation

uses
  Convert4Delphi.Converter,
  Convert4Delphi.Exportar,
  Convert4Delphi.Importar;

{ TConverter4Delphi }

constructor TConverter4Delphi.Create;
begin

end;

destructor TConverter4Delphi.Destroy;
begin

  inherited;
end;

function TConverter4Delphi.Importar(AQuery: TFDQuery; AOrig: String): iConvert4Delphi;
begin
  Result := Self;
  TImport.New(AQuery, AOrig).Executar;
end;

function TConverter4Delphi.Exportar(AQuery: TFDQuery; ADest: String): iConvert4Delphi;
begin
  Result := Self;
  TExportar.New(AQuery, ADest).Executar;
end;

class function TConverter4Delphi.New: iConvert4Delphi;
begin
  Result := Self.Create;
end;

function TConverter4Delphi.TabelaTabela(AConexaoFrom, AConexaoTo: TFDConnection; ATableNameFrom, ATableNameTo: String): iConvert4Delphi;
begin
  Result := Self;
  TConverter.New(AConexaoFrom, AConexaoTo, ATableNameFrom, ATableNameTo).Executar;
end;

end.
