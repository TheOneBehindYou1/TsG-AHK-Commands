;  #### GUI ####
Gui, Add, Text,, Quick Commands Running
Gui, Add, Text,, Always pause (Alt + P) QC when not Ingame 
Gui, Add, Text,, Only close this when not needed anymore
Gui, Add, Link,, <a href="https://github.com/TheOneBehindYou1/TsGQuickCommands">Version 1.0.6</a>
Gui, Add, Button, default w225, Close 
Gui, Show,, TsG Quick Commands
return  ; End of auto-execute section. The script is idle until the user does something.

GuiClose:
ButtonClose:
ExitApp

;  #### Commands ####

Shift & F1::
SetKeyDelay , 10, 10 ;
Send, t{!}permban <name> Aimbot
Loop, 7 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Shift & F2::
SetKeyDelay , 10, 10 ;
Send, t{!}permban <name> Wallhack
Loop, 9 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Shift & F3::
SetKeyDelay , 10, 10 ;
Send, t{!}tempban <name> 3h Stop Camping
Loop, 16 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Shift & F9::
SetKeyDelay , 10, 10 ;
Send, t{!}scream CAMPING IS NOT ALLOWED!
SetKeyDelay , 10, 10 ;
Send, {Enter}
return

Shift & F10::
SetKeyDelay , 10, 10 ;
Send, t{!}scream ENGLISH ONLY IN PUBLIC CHAT
SetKeyDelay , 10, 10 ;
Send, {Enter}
return

Numpad1::
SetKeyDelay , 10, 10 ;
Send, t{!}warn <name> camp
Loop, 5 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Numpad2::
SetKeyDelay , 10, 10 ;
Send, t{!}warn <name> rule3
Loop, 6 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Numpad3::
SetKeyDelay , 10, 10 ;
Send, t{!}warn <name> rule4
Loop, 6 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Numpad4::
SetKeyDelay , 10, 10 ;
Send, t{!}warn <name> rule5
Loop, 6 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Numpad5::
SetKeyDelay , 10, 10 ;
Send, t{!}warn <name> rule6
Loop, 6 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Numpad9::
SetKeyDelay , 10, 10 ;
Send, t{!}list
Sleep 10
Send, t{Enter}
return

Numpad0::
SetKeyDelay , 10, 10 ;
Send, t{!}clean <name>
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Alt & Numpad1::
SetKeyDelay , 10, 10 ;
Send, t{!}kick <name> rule2
Loop, 5 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Alt & Numpad2::
SetKeyDelay , 10, 10 ;
Send, t{!}kick <name> rule3
Loop, 6 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Alt & Numpad3::
SetKeyDelay , 10, 10 ;
Send, t{!}kick <name> rule4
Loop, 6 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Alt & Numpad4::
SetKeyDelay , 10, 10 ;
Send, t{!}kick <name> rule5
Loop, 6 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Alt & Numpad5::
SetKeyDelay , 10, 10 ;
Send, t{!}kick <name> rule6
Loop, 6 {
	Sleep 10
	Send, {Left}
}
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Alt & p::Suspend