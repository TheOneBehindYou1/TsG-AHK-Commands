;  #### GUI ####
Gui, Add, Text,, Quick Commands Running
Gui, Add, Text,, Only close this when not needed anymore
Gui, Add, Button, default w200, Close 
Gui, Show,, kS Quick Commands
return  ; End of auto-execute section. The script is idle until the user does something.

GuiClose:
ButtonClose:
ExitApp


Shift & F1::
SetKeyDelay , 10, 10 ;
Send, t{!}permban  Aimbot
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
return

Shift & F2::
SetKeyDelay , 10, 10 ;
Send, t{!}permban  Wallhack
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
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
Send, t{!}warn  camp
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
return

Numpad2::
SetKeyDelay , 10, 10 ;
Send, t{!}warn  rule3
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
return

Numpad3::
SetKeyDelay , 10, 10 ;
Send, t{!}warn  rule4
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
return

Numpad4::
SetKeyDelay , 10, 10 ;
Send, t{!}warn  rule5
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
return

Numpad5::
SetKeyDelay , 10, 10 ;
Send, t{!}warn  rule6
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
Sleep 10
Send, {Left}
return
