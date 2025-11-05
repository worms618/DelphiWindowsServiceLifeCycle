# DelphiWindowsServiceLifeCycle
An example project to see the lifecycle parts of a Delphi Windows service project

# Dependencies

## JCL - Jedi Code Library

Install via GetIt package manager. [JCL](https://getitnow.embarcadero.com/jedi-code-library/)

### Exception StackTrace

Testing the ways of filling the StackTrace property of every exception.

The exception class makes it possible to fill the StackTrace property by exposing three global methods vars:
- [Exception.GetStackInfoStringProc](https://docwiki.embarcadero.com/Libraries/Florence/en/System.SysUtils.Exception.GetStackInfoStringProc)
- [Exception.GetExceptionStackInfoProc](https://docwiki.embarcadero.com/Libraries/Florence/en/System.SysUtils.Exception.GetExceptionStackInfoProc)
- [Exception.CleanUpStackInfoProc](https://docwiki.embarcadero.com/Libraries/Florence/en/System.SysUtils.Exception.CleanUpStackInfoProc)

#### JclDebug

Jcl provides the unit JclDebug.pas. If this unit is included anywhere in the application, it will assign procedures to the three global methods vars. But only if this unit is compiled with the conditional defines _HAS_EXCEPTION_STACKTRACE_ present.