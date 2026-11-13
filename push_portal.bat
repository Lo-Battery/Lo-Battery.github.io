@echo off
setlocal
cd /d "%~dp0"
set "PATH=%LOCALAPPDATA%\Microsoft\WinGet\Packages\Git.MinGit_Microsoft.Winget.Source_8wekyb3d8bbwe\cmd;%PATH%"

echo ========================================================
echo   Pushing Game Portal to https://github.com/Lo-Battery/Lo-Battery.github.io
echo ========================================================
echo.
git add -A
git diff --cached --quiet || git commit -m "Update game portal"
echo.
echo Connecting to GitHub (browser authentication prompt may open)...
git push -u origin main
if errorlevel 1 (
    echo.
    echo ========================================================
    echo [ERROR] Push failed.
    echo If GitHub opened a browser login window, complete the sign-in.
    echo Or if you use Personal Access Token, enter your token when prompted.
    echo ========================================================
    pause
    exit /b 1
)

echo.
echo ========================================================
echo [SUCCESS] Game Portal successfully published!
echo It will be live at:
echo   https://lo-battery.github.io/
echo (It typically takes 1-2 minutes for GitHub Pages to deploy)
echo ========================================================
pause
