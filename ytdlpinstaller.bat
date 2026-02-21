@echo off
REM =========================
REM yt-dlp Installer / Launcher
REM =========================

REM --- check if yt-dlp already in PATH ---
where yt-dlp >nul 2>&1
if %ERRORLEVEL%==0 (
    echo yt-dlp found in PATH, using existing installation.
    yt-dlp --version
    exit /b
)

REM --- check if python is installed ---
where python >nul 2>&1
if %ERRORLEVEL%==0 (
    echo Python detected, installing yt-dlp via pip...
    python -m pip install --user --upgrade yt-dlp
    echo yt-dlp installed in Python Scripts folder.
    exit /b
)

REM --- no Python, install standalone yt-dlp ---
set "binfolder=%USERPROFILE%\bin"
if not exist "%binfolder%" mkdir "%binfolder%"

set "yt_dlp_path=%binfolder%\yt-dlp.exe"

echo Downloading standalone yt-dlp...
curl -L "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe" -o "%yt_dlp_path%"

REM --- add to user PATH if not already ---
powershell -NoProfile -Command "$p='%binfolder%'; if ($env:Path -notlike '*'+$p+'*') {[Environment]::SetEnvironmentVariable('Path', $env:Path+';'+$p,'User')}"

echo yt-dlp installed to "%yt_dlp_path%". Restart Terminal to use it.
pause
