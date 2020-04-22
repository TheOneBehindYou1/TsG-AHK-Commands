;  #### GUI ####

FormatTime, CurrentDate,, dd.M.yyyy HH:mm:ss 

; Create the sub-menus for the menu bar:
Menu, FileMenu, Add, &Ban Request, FileBan
Menu, FileMenu, Add, &Echelon, FileEchelon
Menu, FileMenu, Add  ; Separator line.
Menu, FileMenu, Add, E&xit, FileExit
Menu, HelpMenu, Add, &Forum, ForumAbout
Menu, HelpMenu, Add, &About, HelpAbout

; Create the menu bar by attaching the sub-menus to it:
Menu, MyMenuBar, Add, &Options, :FileMenu
Menu, MyMenuBar, Add, &Help, :HelpMenu

; Attach the menu bar to the window:
Gui, Menu, MyMenuBar

; Create Tab for more Games:
Gui, Add, Tab3,, MW3|More Game to come

; Create the main control display:
Gui, Tab, 1
Gui, Add, ListView, x5 r20 w517 grid, Command|Shortcut|Preview
LV_Add("", "Clean", "Numpad0", "!clean <name>")
LV_Add("", "Warning for Camping", "Numpad1", "!warn <name> camp")
LV_Add("", "Warning for Grenade Launcher", "Numpad2", "!warn <name> rule3")
LV_Add("", "Warning for Rocket Launcher", "Numpad3", "!warn <name> rule4")
LV_Add("", "Warning for Respectfull Language", "Numpad4", "!warn <name> rule5")
LV_Add("", "Warning for English Only", "Numpad5", "!warn <name> rule6")
LV_Add("", "Kick for Camping", "Shift + Numpad1", "!kick <name> rule2")
LV_Add("", "Kick for Grenade Launcher", "Shift + Numpad2", "!kick <name> rule3")
LV_Add("", "Kick for Rocket Launcher", "Shift + Numpad3", "!kick <name> rule4")
LV_Add("", "Kick for Respectfull Language", "Shift + Numpad4", "!kick <name> rule5")
LV_Add("", "Kick for English Only", "Shift + Numpad5", "!kick <name> rule6")
LV_Add("", "Permban for Aimbot", "Shift + F1", "!permban <name> Aimbot")
LV_Add("", "Permban for Wallhack", "Shift + F2", "!permban <name> Wallhack")
LV_Add("", "Tempban for continuous camping (3h)", "Shift + F3", "!tempban <name> 3h Stop camping")
LV_Add("", "Scream no camping", "Shift + F9", "!scream CAMPING IS NOT ALLOWED")
LV_Add("", "Scream English only", "Shift + F10", "!scream ENGLISH ONLY IN PUBLIC CHAT")
LV_Add("", "No Camping in 5 languages", "Shift + F11", "")
LV_Add("", "Pause Quick Commands", "Alt + P", "")
LV_ModifyCol(1)
LV_ModifyCol(2, "Auto" "Center")
LV_ModifyCol(3)
Gui, Tab, 2
Gui, Add, Text,, More Games will appear here
Gui, Tab
Gui, Font, s7 bold c000000, Times New Roman
Gui, Add, Link,, TsG Quick Commands by <a href="https://thesyndicategamers.com/index.php?members/cntrlaltdel.49/">CAD</a> and <a href="https://thesyndicategamers.com/index.php?members/theonebehindyou1.28/">Toby</a> ©2018                                                                                                                                %CurrentDate%
Gui, Show, Autosize, TsG Quick Commands
return

FileEchelon:
MsgBox, 4, Echelon, Do you want to open Echelon?
IfMsgBox No
	return
IfMsgBox Timeout
	return
else IfMsgBox Yes
	Run, https://www.tsgservers.tk/echelon-v2/
return

FileBan:
MsgBox, 4, Creating Ban Request, Do you want to create a Ban request?
IfMsgBox No
	return
IfMsgBox Timeout
	return
else IfMsgBox Yes
	Run, https://thesyndicategamers.com/index.php?form/4/select
return

HelpAbout:
MsgBox, 64, About, Made by CntrlAltDel and TheOneBehindYou1`nIf you have questions, send a DM on Discord or in the Forum
return

AboutButtonOK:  ; This section is used by the "about box" above.
AboutGuiClose:
AboutGuiEscape:
Gui, 1:-Disabled  ; Re-enable the main window (must be done prior to the next step).
Gui Destroy  ; Destroy the about box.
return

ForumAbout:
MsgBox, 4, Forum, Would you like to visit the Forum?.
IfMsgBox No
	return
IfMsgBox Timeout
	return
else
	Run, https://thesyndicategamers.com/index.php
return

FileExit:	; Close with 'Exit'
GuiClose:	; Close interface
ExitApp


; #### Commands ####

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

Numpad0::
SetKeyDelay , 10, 10 ;
Send, t{!}clean <name>
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Shift & Numpad1::
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

Shift & Numpad2::
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

Shift & Numpad3::
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

Shift & Numpad4::
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

Shift & Numpad5::
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

Shift & F11::
SetKeyDelay , 10, 10 ;
Send, tCAMPING is NOT allowed{!}
Sleep 10
Send, {Enter}
Sleep 1000
Send, tCAMPEN ist NICHT erlaubt{!}
Sleep 10
Send, {Enter}
Sleep 1000
Send, tКЕМПИНГ НЕ РАЗРЕШЕН{!}
Sleep 10
Send, {Enter}
Sleep 1000
Send, tLE CAMPING N'EST PAS autorisé{!}
Sleep 10
Send, {Enter}
Sleep 1000
Send, tCAMPING'e izin verilmiyor{!}
Sleep 10
Send, {Enter}

Alt & p::Suspend
