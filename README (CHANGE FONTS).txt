** Changing Fonts **

1. Download your desired font in TTF format.

2. Copy & Paste into the FontChanger/Fonts folder.

3. Locate "slugfont.exe" in your ESO installation  e.g. "D:\Program Files (x86)\Zenimax Online\The Elder Scrolls Online\game\client" and copy it into FontChanger/Fonts

4.a Use Command Prompt
	Press Win+R or use windows search, type "cmd" and press enter. a new window will open.
	Type: 
		cd C:\Users\%username%\Documents\Elder Scrolls Online\live\AddOns\FontChanger\Fonts
	and press enter.
	Now that you are in the right folder you can start slugfont.exe and let it do its magic.
	The syntax for it is: 
		slugfont.exe "FontName.ttf" -o "FontName.slug"
	Do this for every font in your folder. It might take a few seconds to convert a file.
		
4.b Use .bat file
	Right-click in your Fonts folder, choose new and Text Document
	Open it and Copy & Paste all four commands from the bottom of this file and make sure they are the same names as the fonts you want to change. 
	Then go to "Save as...", name it "slug.bat", choose "All Types" for file type and save it in your Fonts folder.
	Open the newly created slug.bat and wait a bit, some custom fonts can take a few seconds to get converted.

5. Open "FontChanger.lua" with your texteditor and change the path for these entries at the beginning to reflect the name of your new font.

		local REGULAR_FONT = "FontChanger/Fonts/FCUI.slug"
		local REGULAR_FONT_BOLD = "FontChanger/Fonts/FCUI_Bold.slug"
		local NAMEPLATE_FONT = "FontChanger/Fonts/FCUI.slug"
		local SCT_FONT = "FontChanger/Fonts/FCUI.slug"
		local CHAT_FONT = "FontChanger/Fonts/FCChat.slug"
		local BOOK_FONT = "FontChanger/Fonts/FCBook.slug"
		
	E.g. if the new font you want to use for chat is called "King.slug" then change
		local CHAT_FONT = "FontChanger/Fonts/FCChat.slug"  
	to
		local CHAT_FONT = "FontChanger/Fonts/King.slug"

6. That's it! Enjoy your new and fresh looking ESO.

** Important! All Filetypes must be .slug format **


** Notes **

The 'REGULAR_FONT' is the font used in Tooltips or as font for the buttons show on sreen(like the "T" for change actibe quest or "E" to interact with something).

The 'REGULAR_FONT_BOLD' is the font most widely used in the UI (Names, Menus etc).

The 'NAMEPLATE_FONT' is used for nameplates only.

The 'SCT_FONT' is used for SCT(Scrolling Combat Text) only.

The 'CHAT_FONT' is the font used in the Chat Box.

The 'BOOK_FONT' is used for Books/Lore Items and similar.


slugfont.exe commands

slugfont.exe "FCChat.ttf" -o "FCChat.slug"
slugfont.exe "FCUI.ttf" -o "FCUI.slug"
slugfont.exe "FCUI_Bold.ttf" -o "FCUI_Bold.slug"
slugfont.exe "FCBook.ttf" -o "FCBook.slug"

