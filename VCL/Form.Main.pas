unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.StdCtrls, Vcl.ExtCtrls, System.Actions, Vcl.ActnList;

type
  TFormMain = class(TForm)
    ApplicationEvents: TApplicationEvents;
    MemoExceptionLogging: TMemo;
    PanelActions: TPanel;
    ActionList: TActionList;
    ActionExceptionAccessViolation: TAction;
    Button1: TButton;
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure ActionExceptionAccessViolationExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  ExceptionStackTrace.Utils;

{$R *.dfm}

procedure TFormMain.ActionExceptionAccessViolationExecute(Sender: TObject);
begin
  var NilObject: TObject := nil;
  var NilObjectClassName := NilObject.ClassName;
end;

procedure TFormMain.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  var ExceptionClassName: string := E.ClassName;
  var ExceptionMessage: string := E.Message;
  var ExceptionStackTrace: string := E.StackTrace;

  MemoExceptionLogging.Lines.BeginUpdate;
  try
    MemoExceptionLogging.Lines.AddStrings([
      ExceptionClassName,
      ExceptionMessage,
      ExceptionStackTrace
    ]);
  finally
    MemoExceptionLogging.Lines.EndUpdate;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  Exception.GetStackInfoStringProc := GetStackInfoStringProc;
  Exception.GetExceptionStackInfoProc := GetExceptionStackInfoProc;
  Exception.CleanUpStackInfoProc := CleanUpStackInfoProc;
end;

end.
