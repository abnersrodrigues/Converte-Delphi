unit Convert4Delphi.Interfaces.Components;

interface

uses
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove.Text,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.SQL, FireDAC.Comp.UI;

Type

  iGUIxWaitCursor = interface
    function Component: TFDGUIxWaitCursor;
  end;

  iBatchMove = interface
    function Component: TFDBatchMove;
  end;

  iBatchMoveTextWriter = interface
    function Component: TFDBatchMoveTextWriter;
  end;

  iBatchMoveDataSetReader = interface
    function Component: TFDBatchMoveDataSetReader;
  end;

  iBatchMoveTextReader = interface
    function Component: TFDBatchMoveTextReader;
  end;

  iBatchMoveDataSetWriter = interface
    function Component: TFDBatchMoveDataSetWriter;
  end;

  iBatchMoveSQLReader = interface
    function Component: TFDBatchMoveSQLReader;
  end;

  iBatchMoveSQLWriter = interface
    function Component: TFDBatchMoveSQLWriter;
  end;

implementation

end.
