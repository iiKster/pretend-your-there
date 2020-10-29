#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <MsgBoxConstants.au3>
; Update 2020/10/29, exit if user moves mouse


HotKeySet("{ESC}", "Terminate")        ; Exit with ESC
MsgBox($MB_ICONINFORMATION, "Pretend your there ", "The mouse starts to move after OK is pressed. " & @LF & "Close app by hitting ESC.", 15)

Global $radius = 30
Global $centerx = 400
Global $centery = 200
Global $angle = 1
Local Const $PI = 3.141592653589793
Global $x = 1
Global $y = 1
Global $rat = MouseGetPos(0)
Global $checkX = $radius + $centerx


While 1        ; Infinite loop
	Global $i = "1"
	Do        ; Calculate x, y 35 times
		Sleep(50)
		$angle = $angle + 10
		$x = ($radius * Cos($angle * $PI / 180) + $centerx)
		$y = ($radius * Sin($angle * $PI / 180) + $centery)

		MouseMove($x, $y, 0) ; Move the mouse cursor to the x, y position.
		$i = $i + 1

		; check mouse position, if it out of bounds terminate
		$rat = MouseGetPos(0)
  		If $rat > ($x + 2) Or $rat < ($x - 2) Then
			Call ("Terminate")
		EndIf

	Until $i = 35


WEnd


Func Terminate()
	Exit
EndFunc
