@echo off
setlocal
cd /d "%~dp0"
where node >nul 2>&1
if errorlevel 1 (
  echo Node.js is required. Install Node.js 24 LTS and reopen this window.
  pause
  exit /b 1
)
where npm.cmd >nul 2>&1
if errorlevel 1 (
  echo npm was not found. Reinstall Node.js with npm included.
  pause
  exit /b 1
)
call npm.cmd ci
if errorlevel 1 goto failed
call npm.cmd run dist
if errorlevel 1 goto failed
echo Build complete. Look in the release folder for the portable executable.
pause
exit /b 0
:failed
echo Build failed. Review the error messages above.
pause
exit /b 1
