unit EditorUI;

interface

uses 
  Windows, Messages, SysUtils, Classes, Forms, DAVDCommon, DVSTModule,
  Graphics, Controls, ExtCtrls, DGuiBaseControl, DGuiDial;

type
  TDistortionUI = class(TForm)
    Skin: TImage;
    KnobLevel: TGuiDial;
    KnobGain: TGuiDial;
  end;

implementation

{$R *.DFM}

end.