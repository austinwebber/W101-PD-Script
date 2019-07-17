#include <Array.au3>
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

Func _Exit()
   Exit
EndFunc
