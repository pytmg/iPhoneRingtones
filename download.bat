@echo off
setlocal

REM =========================
REM YouTube Audio Downloader
REM =========================

set "downloadDir=%~dp0Downloads"

REM create Downloads folder if it doesn't exist
if not exist "%downloadDir%" mkdir "%downloadDir%"

REM prompt for URL
set /p "url=Enter YouTube link: "

if "%url%"=="" (
    echo No URL entered. Exiting.
    exit /b
)

REM check if yt-dlp exists
where yt-dlp >nul 2>&1
if errorlevel 1 (
    echo yt-dlp not found in PATH.
    echo Please install yt-dlp first.
    exit /b
)

REM download audio as mp3
yt-dlp ^
  -f bestaudio ^
  --extract-audio ^
  --audio-format mp3 ^
  --audio-quality 0 ^
  -o "%downloadDir%\%%(title)s.%%(ext)s" ^
  "%url%"

echo.
echo Download complete.
pause
