#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Users\Austi\Documents\GitHub\W101-PD-Script\W101.ico
#AutoIt3Wrapper_Outfile_x64=PetDanceScript.exe
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Austin Webber (prev. by Zachary King) https://github.com/austindwebber

 Script Function:
	Wizard101 Automatic Pet Dance Game.

	Settings need to be:
	 Resolution 800x600
	 UI Size HUGE
	 Texture Detail HIGH
	 Hardware Cursor ON
	 Brightness MAX
	 Particles MAX
	 Shadows ON
	 Classic Mode ON


#ce ----------------------------------------------------------------------------

#include <Array.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>

Global $LocationsArray[5] = []
Global $SnacksArray[5] = []

Global $Snack1Coords[1] = [175]
Global $Snack2Coords[1] = [288]
Global $Snack3Coords[1] = [406]
Global $Snack4Coords[1] = [516]
Global $Snack5Coords[1] = [634]
Global $TempSnackCoords[0] = []

Global $WizardCityCoords[1] = [174]
Global $KrokotopiaCoords[1] = [287]
Global $MarleyBoneCoords[1] = [402]
Global $MooshuCoords[1] = [516]
Global $DragonspyreCoords[1] = [631]
Global $TempLocationCoords[0] = []

#Region ### START Koda GUI section ### Form=c:\users\admin\desktop\autoit\form1.kxf
Global $PDGUI = GUICreate("W101 PD", 242, 199, -1, -1)
Global $Start = GUICtrlCreateButton("Start", 8, 168, 225, 25)
Global $Locations = GUICtrlCreateLabel("Locations to Farm:", 8, 8, 91, 17)
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
Global $WizardCity = GUICtrlCreateCheckbox("Wizard City", 16, 24, 73, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $Krokotopia = GUICtrlCreateCheckbox("Krokotopia", 16, 40, 73, 17)
Global $Marleybone = GUICtrlCreateCheckbox("Marleybone", 16, 56, 73, 17)
Global $Mooshu = GUICtrlCreateCheckbox("Mooshu", 16, 72, 57, 17)
Global $Dragonspyre = GUICtrlCreateCheckbox("Dragonspyre", 16, 88, 81, 17)
Global $Label1 = GUICtrlCreateLabel("Pet Snacks to Feed:", 136, 8, 101, 17)
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
Global $S1 = GUICtrlCreateCheckbox("Snack 1", 152, 24, 57, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $S2 = GUICtrlCreateCheckbox("Snack 2", 152, 40, 57, 17)
Global $S3 = GUICtrlCreateCheckbox("Snack 3", 152, 56, 57, 17)
Global $S4 = GUICtrlCreateCheckbox("Snack 4", 152, 72, 57, 17)
Global $S5 = GUICtrlCreateCheckbox("Snack 5", 152, 88, 57, 17)
Global $Games = GUICtrlCreateInput("", 8, 138, 89, 21)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlSetTip(-1, "Amount of Games")
Global $Label2 = GUICtrlCreateLabel("Amount of Games:", 8, 120, 91, 17)
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
Global $Label3 = GUICtrlCreateLabel("Color Tolerance:", 141, 120, 82, 17)
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
Global $comboBox = GUICtrlCreateCombo("", 136, 138, 89, 21, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "10|15", "15")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Start ;Gather data entered from GUI and launch program
			Global $LocationsArray[5] = []
			Global $SnacksArray[5] = []
			Global $TempSnackCoords[0] = []
			Global $TempLocationCoords[0] = []

			If (GUICtrlRead($WizardCity) = 1) Then
				$LocationsArray[0] = 1
				_ArrayAdd($TempLocationCoords, $WizardCityCoords)
			Else
				$LocationsArray[0] = 0
			EndIf
			If (GUICtrlRead($Krokotopia) = 1) Then
				$LocationsArray[1] = 1
				_ArrayAdd($TempLocationCoords, $KrokotopiaCoords)
			Else
				$LocationsArray[1] = 0
			EndIf
			If (GUICtrlRead($Marleybone) = 1) Then
				$LocationsArray[2] = 1
				_ArrayAdd($TempLocationCoords, $MarleyBoneCoords)
			Else
				$LocationsArray[2] = 0
			EndIf
			If (GUICtrlRead($Mooshu) = 1) Then
				$LocationsArray[3] = 1
				_ArrayAdd($TempLocationCoords, $MooshuCoords)
			Else
				$LocationsArray[3] = 0
			EndIf
			If (GUICtrlRead($Dragonspyre) = 1) Then
				$LocationsArray[4] = 1
				_ArrayAdd($TempLocationCoords, $DragonspyreCoords)
			Else
				$LocationsArray[4] = 0
			EndIf
			If (GUICtrlRead($S1) = 1) Then
				$SnacksArray[0] = 1
				_ArrayAdd($TempSnackCoords, $Snack1Coords)
			Else
				$SnacksArray[0] = 0
			EndIf
			If (GUICtrlRead($S2) = 1) Then
				$SnacksArray[1] = 1
				_ArrayAdd($TempSnackCoords, $Snack2Coords)
			Else
				$SnacksArray[1] = 0
			EndIf
			If (GUICtrlRead($S3) = 1) Then
				$SnacksArray[2] = 1
				_ArrayAdd($TempSnackCoords, $Snack3Coords)
			Else
				$SnacksArray[2] = 0
			EndIf
			If (GUICtrlRead($S4) = 1) Then
				$SnacksArray[3] = 1
				_ArrayAdd($TempSnackCoords, $Snack4Coords)
			Else
				$SnacksArray[3] = 0
			EndIf
			If (GUICtrlRead($S5) = 1) Then
				$SnacksArray[4] = 1
				_ArrayAdd($TempSnackCoords, $Snack5Coords)
			Else
				$SnacksArray[4] = 0
			EndIf

			;Handle if the user checks no boxes
			Local $Amount1 = UBound($TempSnackCoords)
			Local $Amount2 = UBound($TempLocationCoords)
			if ($Amount1 <= 0) Then
				$SnacksArray[0] = 1
				_ArrayAdd($TempSnackCoords, $Snack1Coords)
			EndIf
			if ($Amount2 <= 0) Then
				$LocationsArray[0] = 1
				_ArrayAdd($TempLocationCoords, $WizardCityCoords)
			EndIf

			;Read Amount of Games
			Global $numOfGames = GUICtrlRead($Games)
			if ($numOfGames == "" Or $numOfGames < 1) Then
				$numOfGames = 1
			EndIf

			;Read Tolerance
			Global $Tolerance = GUICtrlRead($comboBox)

			GUISetState(@SW_HIDE)
			Dance()
			GUISetState(@SW_SHOW)
	EndSwitch
WEnd

Func Dance()
WinActivate("[CLASS:Wizard Graphical Client]")
HotKeySet("q", "_Exit")
Local $Loop = 1
WinMove("[CLASS:Wizard Graphical Client]","", 0, 0)
Local $ClientPos = WinGetPos("[CLASS:Wizard Graphical Client]")
Local $x = 0 ;Current index in $TempSnackCoords
Local $y = 0 ;Current index in $TempLocationCoords
ProgressOn("", "Amount of Games", $DLG_NOTITLE) ;Create Progress Bar
While $Loop <= $numOfGames
   ProgressSet(0, 0 & "%  (press 'q' to quit)", "Amount of Games: " & $Loop & "/" & $numOfGames) ;Progress Bar Update
   Send("x")
   Sleep(300)
   if ($y == UBound($TempLocationCoords)) Then ;Reset Index
		$y = 0
   EndIf
   MouseClick("Left", $ClientPos[0] + $TempLocationCoords[$y], $ClientPos[1] + 490) ;Begin Game
   $y = $y + 1 ;Increment Index
   MouseClick("Left", $ClientPos[0] + 627, $ClientPos[1] + 588)
   Local $MoveArray[7] = []
   ConsoleWrite("Game Starting... ")
   Sleep(1590) ;Allow for page turn animation
   For $Round = 2 to 6
	  Local $Moves = 0
	  ;Get Moves
	  While $Moves <= $Round
		 PixelSearch($ClientPos[0] + 404, $ClientPos[1] + 547, $ClientPos[0] + 404, $ClientPos[1] + 547, 0xCAC375, $Tolerance)
		 If Not(@error) Then
			;Up or Down
			PixelSearch($ClientPos[0] + 404, $ClientPos[1] + 580, $ClientPos[0] + 404, $ClientPos[1] + 580, 0x877710, $Tolerance)
			If Not(@Error) Then
			   ConsoleWrite("UP, ")
			   _ArrayInsert($MoveArray, $Moves, "Up")
			Else
			   ConsoleWrite("DOWN, ")
			   _ArrayInsert($MoveArray, $Moves, "Down")
			EndIf
			$Moves = $Moves + 1
			Sleep(200)
		 EndIf
		 PixelSearch($ClientPos[0] + 393, $ClientPos[1] + 562, $ClientPos[0] + 393, $ClientPos[1] + 562, 0xCBBE33, $Tolerance)
		 If Not(@error) Then
			;Left or Right
			PixelSearch($ClientPos[0] + 425, $ClientPos[1] + 560, $ClientPos[0] + 425, $ClientPos[1] + 560, 0xC2B71C, $Tolerance)
			If Not(@Error) Then
			   ConsoleWrite("LEFT, ")
			   _ArrayInsert($MoveArray, $Moves, "Left")
			Else
			   ConsoleWrite("RIGHT, ")
			   _ArrayInsert($MoveArray, $Moves, "Right")
			EndIf
			$Moves = $Moves + 1
			Sleep(200)
		 EndIf
	  WEnd
	  ;Execute Moves
	  Sleep(500)
	  For $i = 0 to $Moves
		 If $MoveArray[$i] == "Down" Then
			ConsoleWrite("Sending Down, ")
			Send("s")
			Sleep(250)
		 ElseIf $MoveArray[$i] == "Up" Then
			ConsoleWrite("Sending Up, ")
			Send("w")
			Sleep(250)
		 ElseIf $MoveArray[$i] == "Right" Then
			ConsoleWrite("Sending Right, ")
			Send("d")
			Sleep(250)
		 ElseIf $MoveArray[$i] == "Left" Then
			ConsoleWrite("Sending Left, ")
			Send("a")
			Sleep(250)
		 EndIf
	  Next
	  ProgressSet((($Round - 1) * 20), (($Round - 1) * 20) & "%  (press 'q' to quit)",  "Amount of Games: " & $Loop & "/" & $numOfGames)
   Next
   Sleep(2500) ;Wait for loading
   MouseClick("Left", $ClientPos[0] + 620, $ClientPos[1] + 588) ;Next
   Sleep(100)
   if ($x == UBound($TempSnackCoords)) Then ;Reset Index
		$x = 0
   EndIf
   #_ArrayDisplay($TempSnackCoords)
   ConsoleWrite($x)
   MouseClick("Left", $ClientPos[0] + $TempSnackCoords[$x], $ClientPos[1] + 480) ;Snack Select
   $x = $x + 1
   MouseClick("Left", $ClientPos[0] + 620, $ClientPos[1] + 588) ;Feed Pet
   MouseClick("Left", $ClientPos[0] + 184, $ClientPos[1] + 588) ;Exit
   $Loaded = False
   While $Loaded == False
	  PixelSearch($ClientPos[0] + 239, $ClientPos[1] + 537, $ClientPos[0] + 239, $ClientPos[1] + 537, 0xEF76B5, 5) ;Check if finished
	  If Not(@Error) Then
		 $Loaded = True
	  Else
		 Sleep(50)
	  EndIf
   WEnd
   $Loop = $Loop + 1
WEnd
ProgressSet(100, "Done!", "Complete")
ProgressOff()
EndFunc

Func _Exit()
   Exit
EndFunc
