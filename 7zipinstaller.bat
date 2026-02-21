@echo off
REM =========================
REM 7-Zip Installer Batch
REM =========================

set "dest=C:\Program Files\7-Zip"
set "installer=%~dp0\7zsetup.exe"

REM check if 7-Zip is already installed
if exist "%dest%\7z.exe" (
    echo 7-Zip already installed.
    set /p "c=Do you want to delete it and reinstall? (y/N): "
    if /i "%c%"=="y" (
        echo Deleting existing 7-Zip...
        rmdir /s /q "%dest%"
    ) else (
        echo Aborting.
        exit /b
    )
)

REM download latest 7-Zip installer
curl -L "https://www.7-zip.org/a/7z2600-x64.exe" -o "%installer%"

REM run installer silently
"%installer%" /S /D=%dest%

REM add 7-Zip folder to user PATH if not already there
powershell -NoProfile -Command "$p='%dest%'; if ($env:Path -notlike '*'+$p+'*') {[Environment]::SetEnvironmentVariable('Path', $env:Path+';'+$p,'User')}"

REM cleanup installer
del "%installer%"

echo 7-Zip installed successfully! Restart Terminal to see PATH changes.
pause
