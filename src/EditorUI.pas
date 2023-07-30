unit EditorUI;

interface

uses 
  Windows, Messages, SysUtils, Classes, Forms, DAVDCommon, DVSTModule,
  Graphics, Controls, ExtCtrls, DGuiBaseControl, DGuiDial, StdCtrls;

type
  TDistortionUI = class(TForm)
    Skin: TImage;
    KnobLevel: TGuiDial;
    KnobGain: TGuiDial;
    procedure KnobLevelChange(Sender: TObject);
    procedure KnobGainChange(Sender: TObject);
  end;

implementation

uses DistortionDM;

{$R *.DFM}

procedure TDistortionUI.KnobLevelChange(Sender: TObject);
begin
 TDistortionDataModule(Owner).Parameter[0] := KnobLevel.Position;
end;

procedure TDistortionUI.KnobGainChange(Sender: TObject);
begin
 TDistortionDataModule(Owner).Parameter[1] := KnobGain.Position;
end;

end.