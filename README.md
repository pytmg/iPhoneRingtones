# iPhoneRingtones

## Dependencies

- 7Zip (Required if installing ffmpeg from scripts provided.)
- FFMpeg (Required by yt-dlp and by convert.bat)
- yt-dlp (Required for downloading YouTube audio)
- Python 3.12.3 (Optional for installing yt-dlp)

## Installers provided

- `7zipinstaller.bat` for installing 7Zip
- `ffmpeginstaller.bat` for installing FFMpeg
- `ytdlpinstaller.bat` for installing yt-dlp
- `pythoninstaller.bat` for installing Python 3.12.3

## Setup

If you do not have the dependencies or are unsure if dependencies are installed,
run the installers for:

1. 7Zip
2. FFMpeg
3. yt-dlp

These installers automatically add their programs to PATH, so they can be used system-wide.

## Usage

Once you have all dependencies installed, run `download.bat`

You will be prompted for a YouTube URL.
Paste any YouTube link and press enter.

You can download as many as you want.
Files will be saved in the "Downloads" folder under the video title's name.

## Conversions

Once you have all the audio files you want, run `convert.bat`

This will:
- Convert ALL audio files in "Downloads"
- Output all files in the "Converted" folder

## Adding the ringtones to your iOS device

1. Open iTunes (NOT the Microsoft Store version).
2. Connect your iOS device.
3. In iTunes, open the "Tones" section.
4. Drag and drop the .m4r files from the "Converted" folder into Tones.
5. Sync your device.

### iTunes

If you are unsure which version you have, check the Microsoft Store Library in the app, if it shows up there and it is installed, uninstall it and download installer from [here](https://www.apple.com/itunes/download/win64/)

## Notes
- Scripts are designed for Windows 10 or Windows 11
- If installing dependencies yourself, all dependencies are required to be in PATH
- Restart your terminal after running installers to refresh your PATH.
- I'm not working on this, so I'm not fixing issues, just follow the [Setup](#setup) and nothing should screw up, ideally.