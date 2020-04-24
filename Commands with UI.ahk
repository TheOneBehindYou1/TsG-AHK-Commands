;  #### GUI ####

FormatTime, CurrentDate,, dd.M.yyyy HH:mm
CurrentVersion := "Version 1.1.3"

; Create the sub-menus for the menu bar:
Menu, ChangeLMenu, Add, &Changelog, ChangeMenu

Menu, GameMenu, Add, &CoD MW3, Mw3Menu
Menu, GameMenu, Add, &CoD MW2, ThisMenu
Menu, GameMenu, Add, &CoD 4, ThisMenu
Menu, GameMenu, Add  ; Separator line.
Menu, GameMenu, Add, &More Games to come, MoreMenu

Menu, BanMenu, Add, &Modern Warfare 3, FileBan1
Menu, BanMenu, Add, &Modern Warfare 2, FileBan2
Menu, BanMenu, Add, &Call of Duty 4, FileBan3

Menu, FileMenu, Add, &Ban Requests, :BanMenu
Menu, FileMenu, Add, &Echelon, FileEchelon
Menu, FileMenu, Add  ; Separator line.
Menu, FileMenu, Add, &Update, FileUpdate
Menu, FileMenu, Add  ; Separator line.
Menu, FileMenu, Add, E&xit, FileExit

Menu, HelpMenu, Add, &Forum, ForumAbout
Menu, HelpMenu, Add, &About, HelpAbout

; Create the menu bar by attaching the sub-menus to it:
Menu, MyMenuBar, Add, &Menu, :ChangeLMenu
Menu, MyMenuBar, Add, &Games, :GameMenu
Menu, MyMenuBar, Add, &Options, :FileMenu
Menu, MyMenuBar, Add, &Help, :HelpMenu

; Attach the menu bar to the window:
Gui, Menu, MyMenuBar



; Create the main control display:
Gui, Add, Text,, Changelog:
Gui, Add, ListView, x5 r20 w517 BackgroundSilver, Version|Change
LV_Add("", "1.0.6","")
LV_Add("", "","- Added !list shortcut (Num 9)")
LV_Add("", "","- Temporarily removed 5 lang camp")
LV_Add("", "","- Changed 'Shift + Num' to 'Alt + Num' because of not working properly")
LV_Add("", "1.1.3      ","")
LV_Add("", "","- Added 'Update' option")
LV_Add("", "","- Added start with Changelog")
LV_Add("", "","- Added Changelog option")
LV_Add("", "","- Added !lookup shortcut (Alt + Num 9)")
LV_Add("", "","- Replaced Games Tab with Games Menu")
LV_Add("", "","- Temporarily paused development of TsG QC without UI ('Commands Only')")
LV_Add("", "","- Updated 'Games' Menu")
LV_Add("", "","- Updated 'Ban Requests' Menu")
Gui, Font, s7 bold c000000, Times New Roman
Gui, Add, Link,, TsG Quick Commands by <a href="https://thesyndicategamers.com/index.php?members/cntrlaltdel.49/">CAD</a> and <a href="https://thesyndicategamers.com/index.php?members/theonebehindyou1.28/">Toby</a> ©2018      <a href="https://github.com/TheOneBehindYou1/TsGQuickCommands">%CurrentVersion%</a>
Gui, Show, Autosize, TsG Quick Commands
return

ChangeMenu:
Gui, Destroy
Gui, Menu, MyMenuBar
Gui, Add, Text,, Changelog:
Gui, Add, ListView, x5 r20 w517 BackgroundSilver, Version|Change
LV_Add("", "1.0.6","")
LV_Add("", "","- Added !list shortcut (Num 9)")
LV_Add("", "","- Temporarily removed 5 lang camp")
LV_Add("", "","- Changed 'Shift + Num' to 'Alt + Num' because of not working properly")
LV_Add("", "1.1.3      ","")
LV_Add("", "","- Added 'Update' option")
LV_Add("", "","- Added start with Changelog")
LV_Add("", "","- Added Changelog option")
LV_Add("", "","- Added !lookup shortcut (Alt + Num 9)")
LV_Add("", "","- Replaced Games Tab with Games Menu")
LV_Add("", "","- Temporarily paused development of TsG QC without UI ('Commands Only')")
LV_Add("", "","- Updated 'Games' Menu")
LV_Add("", "","- Updated 'Ban Requests' Menu")

;  LV_Add("", "","")  Ready to copy ;)
LV_ModifyCol(1, "Auto" "Center")
Gui, Font, s7 bold c000000, Times New Roman
Gui, Add, Link,, TsG Quick Commands by <a href="https://thesyndicategamers.com/index.php?members/cntrlaltdel.49/">CAD</a> and <a href="https://thesyndicategamers.com/index.php?members/theonebehindyou1.28/">Toby</a> ©2018      <a href="https://github.com/TheOneBehindYou1/TsGQuickCommands">%CurrentVersion%</a>
Gui, Show, Autosize, TsG Quick Commands
return

Mw3Menu:
Gui, Destroy
Gui, Menu, MyMenuBar
Gui, Add, ListView, x5 r20 w517 grid BackgroundSilver NoSort, Command|Shortcut|Preview
LV_Add("", "Clean", "Numpad 0", "!clean <name>")
LV_Add("", "Warning for Camping", "Numpad 1", "!warn <name> camp")
LV_Add("", "Warning for Grenade Launcher", "Numpad 2", "!warn <name> rule3")
LV_Add("", "Warning for Rocket Launcher", "Numpad 3", "!warn <name> rule4")
LV_Add("", "Warning for Respectfull Language", "Numpad 4", "!warn <name> rule5")
LV_Add("", "Warning for English Only", "Numpad 5", "!warn <name> rule6")
LV_Add("", "List", "Numpad 9", "!list")
LV_Add("", "Kick for Camping", "Alt + Numpad 1", "!kick <name> rule2")
LV_Add("", "Kick for Grenade Launcher", "Alt + Numpad 2", "!kick <name> rule3")
LV_Add("", "Kick for Rocket Launcher", "Alt + Numpad 3", "!kick <name> rule4")
LV_Add("", "Kick for Respectfull Language", "Alt + Numpad 4", "!kick <name> rule5")
LV_Add("", "Kick for English Only", "Alt + Numpad 5", "!kick <name> rule6")
LV_Add("", "Lookup player ID", "Alt + Numpad 9", "!lookup <name>")
LV_Add("", "Permban for Aimbot", "Shift + F1", "!permban <name> Aimbot")
LV_Add("", "Permban for Wallhack", "Shift + F2", "!permban <name> Wallhack")
LV_Add("", "Tempban for continuous camping (3h)", "Shift + F3", "!tempban <name> 3h Stop camping")
LV_Add("", "Scream no camping", "Shift + F9", "!scream CAMPING IS NOT ALLOWED")
LV_Add("", "Scream English only", "Shift + F10", "!scream ENGLISH ONLY IN PUBLIC CHAT")
;LV_Add("", "No Camping in 5 languages", "Shift + F11", "")
LV_Add("", "Pause Quick Commands", "Alt + P", "")
LV_ModifyCol(1)
LV_ModifyCol(2, "Auto" "Center")
LV_ModifyCol(3)
Gui, Font, s7 bold c000000, Times New Roman
Gui, Add, Link,, TsG Quick Commands by <a href="https://thesyndicategamers.com/index.php?members/cntrlaltdel.49/">CAD</a> and <a href="https://thesyndicategamers.com/index.php?members/theonebehindyou1.28/">Toby</a> ©2018      <a href="https://github.com/TheOneBehindYou1/TsGQuickCommands">%CurrentVersion%</a>
Gui, Show, Autosize, TsG Quick Commands
return

MoreMenu:
MsgBox, 64, More Games maybe, More Games will be added (hopefully) soon
return

ThisMenu:
MsgBox, 64, Hopefully soon, This Game will be added (hopefully) soon
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

FileUpdate:
Run, https://github.com/TheOneBehindYou1/TsGQuickCommands
return

FileBan1:
MsgBox, 4, Creating MW 3 Ban Request, Do you want to create a Ban request for Modern Warfare 3?
IfMsgBox No
	return
IfMsgBox Timeout
	return
else IfMsgBox Yes
	Run, https://thesyndicategamers.com/index.php?form/4/select
return

FileBan2:
MsgBox, 4, Creating MW 2 Ban Request, Do you want to create a Ban request for Modern Warfare 2?
IfMsgBox No
	return
IfMsgBox Timeout
	return
else IfMsgBox Yes
	Run, https://thesyndicategamers.com/index.php?forums/mw2-ban-requests.67/post-thread
return

FileBan3:
MsgBox, 4, Creating CoD 4 Ban Request, Do you want to create a Ban request for Call of Duty 4?
IfMsgBox No
	return
IfMsgBox Timeout
	return
else IfMsgBox Yes
	Run, https://thesyndicategamers.com/index.php?forums/cod4-ban-requests.69/post-thread
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

Alt & Numpad9::
SetKeyDelay, 10, 10 ;
Send, t{!}lookup <name>
Loop, 6 {
	Sleep 10
	Send, {Backspace}
}
return

Alt & p::Suspend 



;To-Do:

; !warnremove (name)
; !lookup (name)
; rank specific commands
; 
