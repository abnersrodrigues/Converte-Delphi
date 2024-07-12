unit Convert4Delphi.Component.GUIxWaitCursor;

interface

Uses
  System.SysUtils, System.Classes, Convert4Delphi.Interfaces.Components,
  FireDAC.Comp.UI, Convert4Delphi.Interfaces;

Type

  TGUIxWaitCursor = class(TInterfacedObject, iGUIxWaitCursor)
    private
      FGUIxWaitCursor: TFDGUIxWaitCursor;
    public
      Constructor Create(Parent: TComponent);
      Destructor Destroy; Override;
      class function New(Parent: TComponent): iGUIxWaitCursor;
      function Component: TFDGUIxWaitCursor;
  end;

implementation

{ TGUIxWaitCursor }

function TGUIxWaitCursor.Component: TFDGUIxWaitCursor;
begin
  Result := FGUIxWaitCursor;
end;

Constructor TGUIxWaitCursor.Create(Parent: TComponent);
begin
  FGUIxWaitCursor := TFDGUIxWaitCursor.Create(Parent);
end;

destructor TGUIxWaitCursor.Destroy;
begin
  FreeAndNil(FGUIxWaitCursor);
  inherited;
end;

class function TGUIxWaitCursor.New(Parent: TComponent): iGUIxWaitCursor;
begin
  Result := Self.Create(Parent);
end;

end.

