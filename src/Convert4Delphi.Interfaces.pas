unit Convert4Delphi.Interfaces;

interface

Uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client;

Type

  iConvert4Delphi = interface
    function Exportar(AQuery: TFDQuery; ADest: String): iConvert4Delphi;
    function Importar(AQuery: TFDQuery; AOrig: String):  iConvert4Delphi;
    function TabelaTabela(AConexaoFrom, AConexaoTo: TFDConnection; ATableNameFrom, ATableNameTo: String): iConvert4Delphi;
  end;

  iConverter = interface
    function Executar: iConverter;
  end;

  iExportar = interface
    function Executar: iExportar;
  end;

  iImportar = interface
    function Executar: iImportar;
  end;

implementation

end.
