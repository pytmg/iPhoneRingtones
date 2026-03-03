@echo off

set "source=%~dp0\TEMPFOLDER"
set "dest=C:\ffmpeg" 

if exist "%dest%" (
  echo FFMPEG already installed.
  set /p "c=Do you want to delete it and reinstall? (y/N): "
  if /i "%c%"=="y" (
    echo Deleting "%dest%"
    rmdir /s /q "%dest%"
  ) else (
    echo Aborting.
    exit /b
  )
)

mkdir %source%

curl -L "https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-essentials.7z" -o "%source%\ffmpeg.7z"
"C:\Program Files\7-Zip\7z.exe" x "%source%\ffmpeg.7z" -o"%source%" -y
move "%source%\ffmpeg\bin\*" "%dest%\"

rmdir %source% /s /q 2>nul

powershell -NoProfile -Command "$p='%dest%'; if ($env:Path -notlike '*'+$p+'*') {[Environment]::SetEnvironmentVariable('Path', $env:Path+';'+$p,'User')}"

echo FFMPEG installed successfully, restart Terminal to see changes.
