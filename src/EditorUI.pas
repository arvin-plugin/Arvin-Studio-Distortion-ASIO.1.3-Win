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
    procedure KnobLevelChange(Sender: TObject);
  end;

implementation

uses DistortionDM;

{$R *.DFM}

procedure TDistortionUI.KnobLevelChange(Sender: TObject);
begin
 TDistortionDataModule(Owner).Parameter[0] := KnobLevel.Position;
end;

end.