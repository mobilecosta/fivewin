set hdir=c:\xharbour
set bcdir=c:\bcc55
set fwhdir=c:\fwh612
set include=c:\bcc55\include;c:\fwh612\include

@ECHO OFF
CLS
ECHO ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ECHO ?FiveWin for xHarbour 6.12 - December 2006       xHarbour development power ³Ü
ECHO ?(c) FiveTech, 1993-2006      for Microsoft Windows 95/98/NT/2000/ME and XP ³Û
ECHO ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ?
ECHO ÿ ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß?


REM if %1 == 1 GOTO ENDCOMPILE
if EXIST %1.PRG GOTO DESVIO

:INCOMPILA
ECHO Compilando....

@If Exist agenda.EXE Del agenda.EXE
rem @If Exist *.Bak Del *.Bak
@If Exist *.Obj Del *.Obj
@If Exist *.Log Del *.Log
@If Exist *.Ppo Del *.Ppo
@If Exist *.C Del *.C
@If Exist *.MAP Del *.MAP
@If Exist *.TDS Del *.TDS

%hdir%\bin\harbour agenda         /m/n /i%fwhdir%\include;%hdir%\include /w0 /p %2 %3 >  clip.log

echo -O2 -eagenda.exe -I%hdir%\include agenda.c           >  b32.bc

%bcdir%\bin\bcc32 -M -c -v @b32.bc

:ENDCOMPILE

IF EXIST agenda.rc  %bcdir%\bin\brc32 -r agenda.rc

rem cls
echo c0w32.obj                     + >  b32.bc
echo agenda.obj,                  + >> b32.bc
echo agenda.exe,                  + >> b32.bc
echo agenda.map,                  + >> b32.bc

echo %fwhdir%\lib\FiveHx.lib       + >> b32.bc
echo %fwhdir%\lib\FiveHC.lib       + >> b32.bc
echo %hdir%\lib\hbzip.Lib          + >> b32.bc
echo %hdir%\lib\zlib.Lib           + >> b32.bc
echo %hdir%\lib\tip.Lib            + >> b32.bc
echo %hdir%\lib\hbsix.lib          + >> b32.bc
echo %hdir%\lib\codepage.Lib       + >> b32.bc
echo %hdir%\lib\libmisc.lib        + >> b32.bc
echo %hdir%\lib\ct.Lib             + >> b32.bc
echo %hdir%\lib\hbhpdf.lib         + >> b32.bc
echo %hdir%\lib\hbzebra.Lib        + >> b32.bc
echo %hdir%\lib\libharu.lib        + >> b32.bc
echo %hdir%\lib\png.Lib            + >> b32.bc
echo %hdir%\lib\rtl.lib            + >> b32.bc
echo %hdir%\lib\vm.lib             + >> b32.bc
echo %hdir%\lib\gtgui.lib          + >> b32.bc
echo %hdir%\lib\lang.lib           + >> b32.bc
echo %hdir%\lib\macro.lib          + >> b32.bc
echo %hdir%\lib\rdd.lib            + >> b32.bc
echo %hdir%\lib\dbfntx.lib         + >> b32.bc
echo %hdir%\lib\dbfcdx.lib         + >> b32.bc
echo %hdir%\lib\dbffpt.lib         + >> b32.bc
echo %hdir%\lib\hbsix.lib          + >> b32.bc
echo %hdir%\lib\debug.lib          + >> b32.bc
echo %hdir%\lib\common.lib         + >> b32.bc
echo %hdir%\lib\pp.lib             + >> b32.bc
echo %hdir%\lib\pcrepos.lib        + >> b32.bc
echo %hdir%\lib\tip.lib            + >> b32.bc
echo %hdir%\lib\libfi.lib          + >> b32.bc
echo %hdir%\lib\freeimage.lib      + >> b32.bc
echo %hdir%\lib\libbgd.lib         + >> b32.bc
echo %hdir%\lib\libhbpg.lib        + >> b32.bc
echo %bcdir%\lib\cw32.lib          + >> b32.bc
echo %bcdir%\lib\import32.lib      + >> b32.bc
echo %bcdir%\lib\uuid.lib          + >> b32.bc
echo %bcdir%\lib\ws2_32.lib        + >> b32.bc
echo %bcdir%\lib\psdk\odbc32.lib   + >> b32.bc
echo %bcdir%\lib\psdk\rasapi32.lib + >> b32.bc
echo %bcdir%\lib\psdk\nddeapi.lib  + >> b32.bc
echo %bcdir%\lib\psdk\msimg32.Lib  + >> b32.bc
echo %bcdir%\lib\psdk\psapi.Lib    + >> b32.bc
echo %bcdir%\lib\psdk\shell32.lib  + >> b32.bc
echo %bcdir%\lib\psdk\wininet.lib  + >> b32.bc
echo %bcdir%\lib\psdk\iphlpapi.lib,  >> b32.bc

if exist agenda.res echo agenda.res + >> b32.bc

rem uncomment this line to use the debugger and comment the following one
rem %bcdir%\bin\ilink32 -Gn -Tpe -s -v @b32.bc
%bcdir%\bin\ilink32 -Gn -aa -Tpe -s -v @b32.bc


IF ERRORLEVEL 1 GOTO LINKERROR


ECHO ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ECHO ?Controle Administrativo ³Û
ECHO ?³Û
ECHO ?SISTEMA COMPILADO E PRONTO PARA USO ³Û
ECHO ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ?
ECHO ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß?

rem nuevo by Antonio Linares - 16/05/2013
rem mshta vbscript:CreateObject("SAPI.SpVoice").Speak("Application successfully built")(Window.close)
rem mshta vbscript:CreateObject("SAPI.SpVoice").Speak("Programa construido com sucesso")(Window.close)

GOTO EXIT
ECHO

:LINKERROR
rem if exist meminfo.txt notepad meminfo.txt
rem PAUSE * Linking errors *
GOTO EXIT

:SINTAX
ECHO SYNTAX: Build [Program] {-- No especifiques la extensi? PRG
ECHO {-- Don't specify .PRG extension
GOTO EXIT

:DESVIO
CLS

ECHO ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ?
ECHO ?Compilando o programa %1.PRG
ECHO ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ?
ECHO ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß

%hdir%\bin\harbour %1 /m/n /i%fwhdir%\include;%hdir%\include /w0 /p %2 %3 > clip.log

%bcdir%\bin\bcc32 -M -c -v @b32.bc

GOTO ENDCOMPILE

:NOEXIST
ECHO The specified PRG %1 does not exist
:EXIT
