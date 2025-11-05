object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Delphi - Exception Life Cycle'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object MemoExceptionLogging: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 40
    Width = 618
    Height = 398
    Align = alClient
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object PanelActions: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 618
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 105
      Height = 25
      Action = ActionExceptionAccessViolation
      Align = alLeft
      TabOrder = 0
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 48
    Top = 32
  end
  object ActionList: TActionList
    Left = 176
    Top = 40
    object ActionExceptionAccessViolation: TAction
      Caption = 'Access violation'
      OnExecute = ActionExceptionAccessViolationExecute
    end
  end
end
