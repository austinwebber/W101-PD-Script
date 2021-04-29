#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Austin Webber

 Script Function:
	A simple script to get the color value of a pixel at certain position in the W101 window

#ce ----------------------------------------------------------------------------

; Script Start

WinActivate("Wizard101")
WinMove("Wizard101","", 0, 0)
Local $ClientPos = WinGetPos("Wizard101")
Local $temp = PixelGetColor($ClientPos[0] + 425, $ClientPos[1] + 560)
MouseMove($ClientPos[0] + 425, $ClientPos[1] + 560)
ConsoleWrite($temp)