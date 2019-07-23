#include <Array.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
Global $LocationsArray[5] = []
Global $SnacksArray[5] = []

Global $Snack1Coords[2] = [175, 480]
Global $Snack2Coords[2] = [288, 480]
Global $Snack3Coords[2] = [406, 480]
Global $Snack4Coords[2] = [516, 480]
Global $Snack5Coords[2] = [634, 480]
Global $TempSnackCoords[0] = []

Global $WizardCityCoords[2] = [174, 490]
Global $KrokotopiaCoords[2] = [287, 490]
Global $MarleyBoneCoords[2] = [402, 490]
Global $MooshuCoords[2] = [516, 490]
Global $DragonspyreCoords[2] = [631, 490]
Global $TempLocationCoords[0] = []

#Region ### START Koda GUI section ### Form=c:\users\admin\desktop\autoit\form1.kxf
Global $PDGUI = GUICreate("GUI", 242, 264, -1, -1)
Global $Start = GUICtrlCreateButton("Start", 8, 224, 225, 25)
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
GUICtrlCreateInput("", 8, 138, 89, 21)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlSetTip(-1, "Amount of Games")
$Label2 = GUICtrlCreateLabel("Amount of Games:", 8, 120, 91, 17)
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
$Label3 = GUICtrlCreateLabel("Color Tolerance:", 144, 120, 82, 17)
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
$Tolerance = GUICtrlCreateCombo("", 136, 138, 89, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "5|6|7|8|9|10", "5")
$Label4 = GUICtrlCreateLabel("Resolution:", 8, 176, 57, 17)
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
$Resolution = GUICtrlCreateCombo("", 8, 194, 89, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "800x600|1024x768|1152x864|1176x664|1280x720|1280x768|1280x800|1280x960|1280x1024|1360x768|1366x768|1600x900|1600x1024|1680x1050|1768x992|1440x900|1920x1080|", "800x600")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Start
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
			#_ArrayDisplay($TempSnackCoords)
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
			#Dance()
	EndSwitch
WEnd

Func Dance()
WinActivate("Wizard101")
HotKeySet("q", "_Exit")
Local $Loop = 1
Local $Times = InputBox("Games to play", "How many times do you want to play?")
WinActivate("Wizard101")
Local $ClientPos = WinGetPos("Wizard101")
While $Loop <= $Times
   Send("x")
   Sleep(300)
   MouseClick("Left", $ClientPos[0] + 632, $ClientPos[1] + 491) ;Begin Game
   MouseClick("Left", $ClientPos[0] + 627, $ClientPos[1] + 588)
   Local $MoveArray[7] = []
   While PixelGetColor($ClientPos[0] + 595, $ClientPos[1] + 593) <> 0x40382E ;Wait until minigame has loaded
	  Sleep(20)
   WEnd
   ConsoleWrite("Game Starting... ")
   Sleep(1590) ;Allow for page turn animation
   For $Round = 2 to 6
	  Local $Moves = 0
	  ;Get Moves
	  While $Moves <= $Round
		 PixelSearch($ClientPos[0] + 402, $ClientPos[1] + 545, $ClientPos[0] + 402, $ClientPos[1] + 545, 0xF3E75A, 15)
		 If Not(@error) Then
			;Up or Down
			PixelSearch($ClientPos[0] + 402, $ClientPos[1] + 578, $ClientPos[0] + 402, $ClientPos[1] + 578, 0x695B08, 5)
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
		 PixelSearch($ClientPos[0] + 389, $ClientPos[1] + 560, $ClientPos[0] + 389, $ClientPos[1] + 560, 0xD5C82A, 15)
		 If Not(@error) Then
			;Left or Right
			PixelSearch($ClientPos[0] + 423, $ClientPos[1] + 560, $ClientPos[0] + 423, $ClientPos[1] + 560, 0x342F14, 15)
			If Not(@Error) Then
			   ConsoleWrite("RIGHT, ")
			   _ArrayInsert($MoveArray, $Moves, "Right")
			Else
			   ConsoleWrite("LEFT, ")
			   _ArrayInsert($MoveArray, $Moves, "Left")
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
			Sleep(150)
		 ElseIf $MoveArray[$i] == "Up" Then
			ConsoleWrite("Sending Up, ")
			Send("w")
			Sleep(150)
		 ElseIf $MoveArray[$i] == "Right" Then
			ConsoleWrite("Sending Right, ")
			Send("d")
			Sleep(150)
		 ElseIf $MoveArray[$i] == "Left" Then
			ConsoleWrite("Sending Left, ")
			Send("a")
			Sleep(150)
		 EndIf
	  Next
   Next
   Sleep(2500) ;Wait for loading
   MouseClick("Left", $ClientPos[0] + 620, $ClientPos[1] + 588) ;Next
   Sleep(100)
   MouseClick("Left", $ClientPos[0] + 174, $ClientPos[1] + 487) ;Snack Select
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
EndFunc

Func _Exit()
   Exit
EndFunc
