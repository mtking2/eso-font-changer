# ESO FontChanger

## How to add additional fonts
1. Download your desired font in TTF format and put it in the FontChanger/fonts/ttfs folder
2. Copy & Paste into the FontChanger/Fonts folder.
3. Locate `slugfont.exe` in your ESO installation and copy it to FontChanger/fonts. Some common locations are:
	- C:\Program Files\Zenimax Online\The Elder Scrolls Online\game\client\slugfont.exe
	- C:\Program Files (x86)\Zenimax Online\The Elder Scrolls Online\game\client\slugfont.exe
	- C:\Steam\steamapps\common\Zenimax Online\The Elder Scrolls Online\game\client\slugfont.exe
4. Run FontChanger/fonts/slug.bat
	- This will automatically generate .slug files for all the fonts in the ttfs folder and update `FontChanger_Options.lua`

