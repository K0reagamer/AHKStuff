#NoEnv
SendMode Input
Insert::
MouseGetPos, X, Y
MsgBox, 65, Minecraft Book Writer, Starting Book Writer at (%X%, %Y%)`nPress OK to continue.
IfMsgBox OK
	Loop, 100{
		Loop, 320{
			Random, Char, 0x1000, 0xFFFF
			Send,% Chr(Char)
		}
	MouseClick, L, %X%, %Y%
	}
return

Home::
ExitApp