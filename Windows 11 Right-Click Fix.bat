@echo off
Title Windows 11 Right-Click Fix - IHobble
@setlocal ENABLEDELAYEDEXPANSION
cls


@echo.
@echo.                  Script by IHobble
@echo.                FOR WINDOWS 11 ONLY!!! 
@echo.     Misuse of this program may cause serious damage!
@echo.              Dont use if already enabled.
@echo.
@echo.         YOUR SYSTEM WILL RESTART AFTER COMPLETE!
@echo.
@echo. This script will edit the computers registry to enable the 
@echo.    expanded Right-click menu as default on Windows 11. 
@echo.

REM --------------------- OS Verification
:osverify
pause
cls
@echo. Checking system
setlocal
set "vard="

for /f "tokens=1,2,* delims=: " %%i in ('systeminfo') do (
    if "%%~i %%~j" == "OS Name" (
        call :clean_spaces "%%~k"
        goto :next
    )
)

:next
echo the operating system name 2 is "%vard%"
exit /b

:clean_spaces
setlocal enabledelayedexpansion
set "string=%~1"
    :loop
    if "!string:~-1!" == " " (
        set "string=!string:~,-1!"
        goto :loop
    )
endlocal & set "RESULT=%string%"

IF "%Result%" == "Microsoft Windows 11 Home" (GOTO :install) 
IF "%Result%" == "Microsoft Windows 11 PRO" (GOTO :install) 
IF "%Result%" == "Microsoft Windows 11 Education" (GOTO :install)
IF "%Result%" == "Microsoft Windows 11 Enterprise" (GOTO :install)
IF "%Result%" == "Microsoft Windows 11 Pro Education" (GOTO :install) 
IF "%Result%" == "Microsoft Windows 11 Pro for Workstations" (GOTO :install) 
IF "%Result%" == "Microsoft Windows 11 Mixed Reality" (GOTO :install) 

goto fail


REM ------------------------ Routes

:fail
cls
@echo.
@echo. Failsafe Enabled.
@echo. You do NOT appear to have a Windows 11 operating system!
@echo. You Have %RESULT%
@echo.
pause
end

:install
cls
@echo.
@echo. Ready to install...
@echo. Your system will restart.
@echo. If you wish to cancel, close this window.

pause
cls
REG ADD "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" 
REG ADD "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
cls
@echo.
@echo. Sucess!
shutdown.exe /r /t 00
end




REM ------------------Notes




