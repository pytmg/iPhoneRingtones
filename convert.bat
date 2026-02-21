@echo off
setlocal enabledelayedexpansion

REM =========================
REM Bulk AAC Converter
REM =========================

set "source=%~dp0Downloads"
set "dest=%~dp0Converted"

REM check if source exists
if not exist "%source%" (
    echo Downloads folder not found.
    exit /b
)

REM delete Converted folder if it exists
if exist "%dest%" (
    echo Converted folder exists. Deleting...
    rmdir /s /q "%dest%"
)

mkdir "%dest%"

REM loop through all files in Downloads
for %%F in ("%source%\*") do (
    echo Converting: %%~nxF
    
    ffmpeg -y -i "%%F" -vn -c:a aac -b:a 192k "%dest%\%%~nF.m4a"
)

REM rename .m4a to .m4v
for %%F in ("%dest%\*.m4a") do (
    ren "%%F" "%%~nF.m4r"
)

echo.
echo All files converted to AAC and renamed to .m4v
pause
