@echo off
cd /d "%~dp0"
set "PATH=%LOCALAPPDATA%\Microsoft\WinGet\Packages\Git.MinGit_Microsoft.Winget.Source_8wekyb3d8bbwe\cmd;%PATH%"
echo Pushing Lo-Battery.github.io to GitHub...
git add -A
git diff --cached --quiet || git commit -m "Update game portal"
git push -u origin main
if errorlevel 1 (
    echo Push failed or needs GitHub login.
    pause
    exit /b 1
)
echo Published! Open https://lo-battery.github.io/ in 1-2 minutes.
pause
