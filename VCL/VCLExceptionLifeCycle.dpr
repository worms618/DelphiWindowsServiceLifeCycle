// JCL_DEBUG_EXPERT_INSERTJDBG ON
program VCLExceptionLifeCycle;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {FormMain},
  ExceptionStackTrace.Utils in 'ExceptionStackTrace.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
