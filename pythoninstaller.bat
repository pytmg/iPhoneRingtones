@echo off
REM ==============================
REM Python 3.12.3 Installer Batch
REM ==============================

set "dest=%LocalAppData%\Programs\Python\Python312"
set "installer=%~dp0\python-3.12.3.exe"

REM check if python 3.12.3 is already installed
if exist "%dest%\python.exe" (
    echo Python 3.12.3 already installed.
    set /p "c=Do you want to delete it and reinstall? (y/N): "
    if /i "%c%"=="y" (
        echo Deleting existing Python installation...
        rmdir /s /q "%dest%"
    ) else (
        echo Aborting.
        exit /b
    )
)

REM download python installer (user installation)
echo Downloading Python 3.12.3...
curl -L "https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe" -o "%installer%"

REM run installer silently for current user only
echo Installing Python 3.12.3...
"%installer%" /quiet InstallAllUsers=0 TargetDir="%dest%" PrependPath=1 Include_test=0

REM cleanup installer
del "%installer%"

echo Python 3.12.3 installed successfully for current user!
echo You may need to restart Terminal or log off to update PATH.
pause
