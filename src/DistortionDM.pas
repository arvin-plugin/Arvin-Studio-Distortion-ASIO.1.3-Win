unit DistortionDM;

interface

uses 
  Windows, Messages, SysUtils, Classes, Forms, 
  DAVDCommon, DVSTModule;

type
  TDistortionDataModule = class(TVSTModule)
    procedure VSTModuleEditOpen(Sender: TObject; var GUI: TForm; ParentWindow: Cardinal);
    procedure VSTModuleCreate(Sender: TObject);
    procedure VSTModuleProcess(const Inputs,
      Outputs: TAVDArrayOfSingleDynArray; const SampleFrames: Integer);
    procedure VSTModuleParameterChange(Sender: TObject;
      const Index: Integer; var Value: Single);
    procedure DistortionDataModuleParameterProperties0ParameterChange(
      Sender: TObject; const Index: Integer; var Value: Single);
  private
  fDistortionAmount: Single;
  public
  end;

implementation

{$R *.DFM}

uses
  EditorUI;

procedure TDistortionDataModule.VSTModuleEditOpen(Sender: TObject; var GUI: TForm; ParentWindow: Cardinal);
begin
  GUI := TDistortionUI.Create(Self);
end;

procedure TDistortionDataModule.VSTModuleCreate(Sender: TObject);
begin
  Parameter[0] := 0.5; // Default distortion amount
  fDistortionAmount := Parameter[0];
end;

procedure TDistortionDataModule.VSTModuleProcess(const Inputs,
  Outputs: TAVDArrayOfSingleDynArray; const SampleFrames: Integer);
var
 j: Integer;
  DistortedSample: Single;
begin
  for j := 0 to SampleFrames - 1 do
  begin
    // Apply distortion to each sample in both channels
    DistortedSample := Inputs[0, j] * fDistortionAmount;
    Outputs[0, j] := DistortedSample;

    DistortedSample := Inputs[1, j] * fDistortionAmount;
    Outputs[1, j] := DistortedSample;
  end;
end;
procedure TDistortionDataModule.VSTModuleParameterChange(Sender: TObject;
  const Index: Integer; var Value: Single);
begin
fDistortionAmount := Value;
end;

procedure TDistortionDataModule.DistortionDataModuleParameterProperties0ParameterChange(
  Sender: TObject; const Index: Integer; var Value: Single);
begin
fDistortionAmount := Value;
end;

end.