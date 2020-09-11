#include <MsgBoxConstants.au3>

HotKeySet("{ESC}", "Terminate")		; Exit with ESC
MsgBox($MB_ICONINFORMATION, "Pretend your there ", "The mouse starts to move after OK is pressed. " & @LF & "Close app by hitting ESC.",  15 )

Global $radius = 30
Global $centerx = 200
Global $centery = 200
Global $angle = 1
Local Const $PI = 3.141592653589793
Global $x = 1
Global $y= 1


While 1		; Infinite loop
	Global $i="1"
	Do		; Calculate x, y 35 times
		Sleep(50)
		$angle = $angle + 10
		$x = ($radius * Cos($angle * $PI/180) + $centerx)
		$y = ($radius * Sin($angle * $PI/180) + $centery)

		MouseMove($x, $y, 0) ; Move the mouse cursor to the x, y position.
		$i=$i+1
	Until $i = 35
WEnd


Func Terminate()
    Exit
EndFunc   ;==>Terminate