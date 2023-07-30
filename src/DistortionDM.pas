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
    procedure DistortionDataModuleParameterProperties0ParameterChange(
      Sender: TObject; const Index: Integer; var Value: Single);
    procedure DistortionDataModuleParameterProperties1ParameterChange(
      Sender: TObject; const Index: Integer; var Value: Single);
  private
  fDistortionAmount: Single;
  fGainAmount: Single;
  public
  end;

implementation

{$R *.DFM}

uses
  EditorUI;
// Fungsi ini akan dipanggil ketika antarmuka pengguna (GUI) untuk efek distorsi dibuka.
procedure TDistortionDataModule.VSTModuleEditOpen(Sender: TObject; var GUI: TForm; ParentWindow: Cardinal);
begin
  GUI := TDistortionUI.Create(Self);
end;
// Fungsi ini akan dipanggil saat modul efek distorsi dibuat.
procedure TDistortionDataModule.VSTModuleCreate(Sender: TObject);
begin
  Parameter[0] := 0.5; // Jumlah distorsi default
  fDistortionAmount := Parameter[0];  // Parameter Untuk Knob LEVEL
  Parameter[1] := 1.0; // Jumlah Gain default
  fGainAmount := Parameter[1];  // Parameter Untuk Knob GAIN

end;

// Fungsi ini merupakan inti dari efek distorsi. Sinyal audio akan diproses di sini.
procedure TDistortionDataModule.VSTModuleProcess(const Inputs,
  Outputs: TAVDArrayOfSingleDynArray; const SampleFrames: Integer);
var
 j: Integer;
  DistortedSample, GainSample: Single;
begin
  for j := 0 to SampleFrames - 1 do
  begin
    // Mengaplikasikan efek distorsi pada setiap sampel dalam kedua saluran.
    DistortedSample := Inputs[0, j] * fDistortionAmount;
    Outputs[0, j] := DistortedSample;

    DistortedSample := Inputs[1, j] * fDistortionAmount;
    Outputs[1, j] := DistortedSample;
    
    // Mengaplikasikan efek gain pada setiap sampel dalam kedua saluran.
    GainSample := Outputs[0, j] * fGainAmount;
    Outputs[0, j] := GainSample;

    GainSample := Outputs[1, j] * fGainAmount;
    Outputs[1, j] := GainSample;
  end;
end;
// Fungsi ini akan dipanggil saat nilai knob distorsi berubah. Fungsi ini mengupdate variabel fDistortionAmount sesuai nilai yang baru.

procedure TDistortionDataModule.DistortionDataModuleParameterProperties0ParameterChange(
  Sender: TObject; const Index: Integer; var Value: Single);
begin
fDistortionAmount := Value;
end;

procedure TDistortionDataModule.DistortionDataModuleParameterProperties1ParameterChange(
  Sender: TObject; const Index: Integer; var Value: Single);
begin
fGainAmount := Value;
end;



end.