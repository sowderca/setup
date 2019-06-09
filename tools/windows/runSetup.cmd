rem Entry script to provision a Windows machine

@echo off

title "Setup"

setLocal enableExtensions
setLocal enableDelayedExpansion




endLocal

:INSTALL_CHOCOLATEY
@powershell -Command "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force;"
@powershell -Command "Invoke-RestMethod -Method 'GET' -Uri 'https://chocolatey.org/install.ps1' | Out-String | Invoke-Expression "
set PATH=%PATH%;%AllUsersProfile%\chocolatey\bin
call refreshEnv.cmd

rem -- Install Chocolatey
:MISSING_CHOCOLATEY
:: Install Chocolatey if choco.exe is not found in %PATH%
set CHOCOLATEY_FOUND=for %%e in (%PATHEXT%) do (
    for %%X in (choco%%e) do (
        if not defined CHOCOLATEY_FOUND (
            call INSTALL_CHOCOLATEY
        )
    )
)

:SETUP


:SUCCESS
exit /B 0

:FAILURE
exit /B 1
