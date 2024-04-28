# Changelog

## 1.5 (zetauma)
* improved support for gamepad mode
* added support for PerfectPixel (some compatibility taken from Antisenil's v1.3)
	* override PerfectPixel's fonts with a `ZO_PreHook`
	* apply FontChanger's scaling to PerfectPixel

## 1.4 (zetauma)
* Fixed SCT resetting on zone change
* Moved .ttf and .slug files into their own folders
* Added a batch script to automatically generate .slug files and add them to `CustomFontOptions.lua`
* Added all fonts as dropdown options to the addon settings, including vanilla game fonts
	* UI Font
	* Nameplate Font
	* SCT Font
	* Chat Font
	* Book Font
	* Letter Font
	* Stone Tablet Font

## 1.2 (Antisenil)
* changed the names of fonts to not overwrite old ones
* updated Readme file
* reworked Nameplate and SCT function in two seperat functions and their own fontpaths, currently they both use the 'FontChanger_RegularFont' font

## 1.1 (Antisenil)
* re-added the old fontpaths to keep compatible with non updated addons

## 1.0 (Antisenil)
* api bump
* standard included fonts converted from .ttf to .slug format
* added options to change the style of nameplates, scrolling combat text(sct) and chat(not all options work the way they should, need to wait for ZOS to make changes)
* added new ZOS constants for fontpaths to ensure compatibility with future updates

## 0.9
* Added options to scale UI fonts individually

## 0.8
* Fixed an issue causing SCT to reset font during zone changes

## 0.7
* Fixed an issue causing an error on startup if you haven't set your own font scale

## 0.6
* Added Options Menu

## 0.5
* Adjusted font size in game pad mode

## 0.4
* Adjusted size of Fonts in game pad mode

## 0.3
* Added support for game pad mode

## 0.2
* Tidyed Code & General Optimization

