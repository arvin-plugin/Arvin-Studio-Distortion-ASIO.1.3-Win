object DistortionDataModule: TDistortionDataModule
  OldCreateOrder = False
  Flags = [effFlagsHasEditor, effFlagsCanMono, effFlagsCanReplacing]
  Version = '0.0'
  EffectName = 'Distortion Pedal'
  ProductName = 'Arvin Plugin'
  VendorName = 'Arvin Studio'
  PlugCategory = vpcEffect
  CanDos = []
  SampleRate = 44100.000000000000000000
  CurrentProgram = 0
  CurrentProgramName = 'Init'
  UniqueID = 'xWnB'
  ShellPlugins = <>
  Programs = <
    item
      DisplayName = 'Init'
      VSTModule = Owner
    end>
  ParameterProperties = <
    item
      Max = 1.000000000000000000
      Curve = ctLinear
      DisplayName = 'Level'
      CurveFactor = 1.000000000000000000
      SmoothingFactor = 1.000000000000000000
      VSTModule = Owner
    end
    item
      Max = 1.000000000000000000
      Curve = ctLinear
      DisplayName = 'Gain'
      CurveFactor = 1.000000000000000000
      SmoothingFactor = 1.000000000000000000
      VSTModule = Owner
    end>
  OnEditOpen = VSTModuleEditOpen
  Left = 192
  Top = 124
  Height = 150
  Width = 215
end
