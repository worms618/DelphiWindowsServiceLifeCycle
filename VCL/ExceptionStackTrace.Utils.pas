unit ExceptionStackTrace.Utils;

interface

uses
  System.Classes;

  function GetStackInfoStringProc(Info: Pointer): string;
  function GetExceptionStackInfoProc(P: PExceptionRecord): Pointer;
  procedure CleanUpStackInfoProc(Info: Pointer);

implementation

uses
  JclDebug;

{ TExceptionStrackTraceFunctions }

function GetStackInfoStringProc(Info: Pointer): string;
begin
  Result := '';
  if (Info = nil) then
    Exit;

  var StackList: TJclStackInfoList := TJclStackInfoList(Info);

  var Lines: TStrings := TStringList.Create;
  try
    StackList.AddToStrings(Lines, True, True, True, True);
    Result := Lines.Text;
  finally
    Lines.Free;
  end;
end;

function GetExceptionStackInfoProc(P: PExceptionRecord): Pointer;
begin
  var StackList: TJclStackInfoList := TJclStackInfoList.Create(True, 6, P^.ExceptionAddress, False, nil, nil);
  Result := StackList;
end;

procedure CleanUpStackInfoProc(Info: Pointer);
begin
  if (Info <> nil) then
    TJclStackInfoList(Info).Free;
end;

end.
