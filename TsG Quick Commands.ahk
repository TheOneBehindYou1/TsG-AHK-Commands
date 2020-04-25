;  #### GUI ####
#SingleInstance force

FormatTime, CurrentDate,, dd.M.yyyy HH:mm
CurrentVersion := "Version 1.2.6"
IsMW3On := false
IsMW2On := false
IsCOD4On := false
IsMW3InfOn := false

;Ranks
URank1 := "Admin"
URank2 := "Master Admin"
URank3 := "Commander"
URank4 := "Councillor"
URank5 := "High Councillor"
URank6 := "Co-Leader"
URank7 := "Leader"
URank8 := "Founder"


WhichAdminRank := GetAdminRank()

; Create the sub-menus for the menu bar:
Menu, ChangeLMenu, Add, &Changelog, ChangeMenu
Menu, ChangeLMenu, Add, &To-Do, ToDoMenu

Menu, GameMenu, Add, &CoD MW3, Mw3Menu
Menu, GameMenu, Add, &CoD MW3 Inf, Mw3InfMenu
Menu, GameMenu, Add, &CoD MW2, ThisMenu
Menu, GameMenu, Add, &CoD 4, Cod4Menu
Menu, GameMenu, Add  ; Separator line.
Menu, GameMenu, Add, &More Games to come, MoreMenu

Menu, BanMenu, Add, &Call of Duty: Modern Warfare 3, FileBan1
Menu, BanMenu, Add, &Call of Duty: Modern Warfare 2, FileBan2
Menu, BanMenu, Add, &Call of Duty 4: ModernWarfare, FileBan3

Menu, EchelonMenu, Add, &Call of Duty: Modern Warfare 3, Echelon1
Menu, EchelonMenu, Add, &Call of Duty: Modern Warfare 2, Echelon2
Menu, EchelonMenu, Add, &Call of Duty 4: Modern Warfare, Echelon3
Menu, EchelonMenu, Add, &Call of Duty: Black Ops, Echelon4
Menu, EchelonMenu, Add, &Counter-Strike Global Offensive, Echelon5

Menu, FileMenu, Add, &Ban Requests, :BanMenu
Menu, FileMenu, Add, &Echelon, :EchelonMenu
Menu, FileMenu, Add  ; Separator line.
Menu, FileMenu, Add, &Username and &Rank, UandRMenu
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

if FileExist("Profile.txt")
{
	FileReadLine, UName, Profile.txt,1
	FileReadLine, URank, Profile.txt,2
	Gui, Menu, MyMenuBar
	Gui, Add, Edit,h100 w310 ReadOnly -WantCtrlA, Welcome back, %UName%`nYour Rank is %WhichAdminRank%`nHave a look into the Changelog to see what's new`nSelect the Game you are playing for the Commands to work`nHave fun
	;Gui, Add, Text,, 
	;Gui, Add, Button,w80, Close
	Gui, Font, s7 bold c000000, Times New Roman
	Gui, Add, Link,, TsG Quick Commands by <a href="https://thesyndicategamers.com/index.php?members/cntrlaltdel.49/">CAD</a> and <a href="https://thesyndicategamers.com/index.php?members/theonebehindyou1.28/">Toby</a> ©2018      <a href="https://github.com/TheOneBehindYou1/TsGQuickCommands">%CurrentVersion%</a>
	Gui, Show, Autosize, TsG Quick Commands
	return
}
else {
	Gui, Add, Text,, Username:
	Gui, Add, Text,, Rank:
	Gui, Add, Edit, vUsername ym  ; The ym option starts a new column of controls.
	Gui, Add, DDL, vRank, Admin|Master Admin|Commander|Councillor|High Councillor|Co-Leader|Leader|Founder
	Gui, Add, Text,, You seem to be using Quick Commands for the first time.
	Gui, Add, Text,, Please insert your Username and select your current Rank
	Gui, Add, Button,w80, Save
	Gui, Show, Autosize, TsG Quick Commands
	return
}


ButtonSave:
Gui, Submit  ; Save the input from the user to each control's associated variable.
FileAppend, %Username%`n%Rank%, Profile.txt
Gui, Destroy
FileReadLine, UName, Profile.txt,1
FileReadLine, URank, Profile.txt,2
Gui, Menu, MyMenuBar
Gui, Add, Edit,h100 w300 ReadOnly -WantCtrlA, You set your Username to %Username% and your Rank to %Rank%`nHave a look into the Changelog to see what's new`nOr just hop into a game`nHave fun 
Gui, Add, Button,w80, Close
Gui, Font, s7 bold c000000, Times New Roman
Gui, Add, Link,, TsG Quick Commands by <a href="https://thesyndicategamers.com/index.php?members/cntrlaltdel.49/">CAD</a> and <a href="https://thesyndicategamers.com/index.php?members/theonebehindyou1.28/">Toby</a> ©2018      <a href="https://github.com/TheOneBehindYou1/TsGQuickCommands">%CurrentVersion%</a>
Gui, Show, Autosize, TsG Quick Commands
return
MsgBox,64,, You successfully set your Username to %Username% and your Rank to %Rank%.
return

ButtonClose:
ExitApp
return

UandRMenu:
Gui, Destroy
Gui, Menu, MyMenuBar
Gui, Add, Text,, Username:*
Gui, Add, Text,, Rank:*
Gui, Add, Edit, vUsername ym 
Gui, Add, DDL, vRank, Admin|Master Admin|Commander|Councillor|High Councillor|Co-Leader|Leader|Founder
Gui, Add, Text,, Your Username or Rank changed? Here you can update them
Gui, Font, s7 bold c000000, Times New Roman
Gui, Add, Text,, * Required
Gui, Font
Gui, Add, Button,w80, Update
Gui, Show, Autosize, TsG Quick Commands
return

ButtonUpdate:
Gui, Submit  ; Save the input from the user to each control's associated variable.
FileDelete, Profile.txt
FileAppend, %Username%`n%Rank%, Profile.txt
MsgBox,64,, You changed your Username to %Username% and your Rank to %Rank%.
return

ChangeMenu:
Gui, Destroy
Gui, Menu, MyMenuBar
Gui, Add, Text,, Changelog:
Gui, Add, ListView, x5 r20 w517 BackgroundSilver NoSort, Version|Change
LV_Add("", "1.2.6     ","")
LV_Add("", "", "- Added Startscreen")
LV_Add("", "", "- Added Modern Warfare 3 Infected Support")
LV_Add("", "", "- Added Call of Duty 4 Support")
LV_Add("", "", "- Added Ranks and Username")
LV_Add("", "", "- Added Rank specific commands")
LV_Add("", "", "- Added !warnremove shortcut (Num 6)")
LV_Add("", "", "- Added To-Do List")
LV_Add("", "", "- Updated Echelon Menu")
LV_Add("", "", "- Fixed a Bug with the kick for camping QC (Alt + Num 1)")
;  LV_Add("", "", "")  Ready to copy ;)
LV_ModifyCol(1, "Auto" "Center")
Gui, Font, s7 bold c000000, Times New Roman
Gui, Add, Link,, TsG Quick Commands by <a href="https://thesyndicategamers.com/index.php?members/cntrlaltdel.49/">CAD</a> and <a href="https://thesyndicategamers.com/index.php?members/theonebehindyou1.28/">Toby</a> ©2018      <a href="https://github.com/TheOneBehindYou1/TsGQuickCommands">%CurrentVersion%</a>
Gui, Show, Autosize, TsG Quick Commands
return

ToDoMenu:
Gui, Destroy
Gui, Menu, MyMenuBar
Gui, Add, Text,, To-Do List:
Gui, Add, ListView, x5 r20 w517 BackgroundSilver NoSort, Version|Change
LV_Add("", "For 1.2","")
LV_Add("", "", "+ Add !warnremove shortcut")
LV_Add("", "", "+ Rank specific commands")
LV_Add("", "", "+ Game specific commands (= not all commands work on every game")
LV_Add("", "", "+ Add To-Do List")
LV_Add("", "", "")
LV_Add("", "For 1.3", "")
LV_Add("", "", "More shortcuts")
LV_Add("", "", "Trying for cleaner view of Commands, Changelog and To-Do")
LV_Add("", "", "")
LV_Add("", "Later Version", "")
LV_Add("", "", "Ingame Overlay showing QCs")
LV_Add("", "", "Change to C++ or Python")
LV_Add("", "", "With C++/py/... -> more Games and Features")
;  LV_Add("", "", "")  Ready to copy ;)
LV_ModifyCol(1, "Auto" "Center")
Gui, Font, s7 bold c000000, Times New Roman
Gui, Add, Link,, TsG Quick Commands by <a href="https://thesyndicategamers.com/index.php?members/cntrlaltdel.49/">CAD</a> and <a href="https://thesyndicategamers.com/index.php?members/theonebehindyou1.28/">Toby</a> ©2018      <a href="https://github.com/TheOneBehindYou1/TsGQuickCommands">%CurrentVersion%</a>
Gui, Show, Autosize, TsG Quick Commands
return

Mw3Menu:
Gui, Destroy
Gui, Menu, MyMenuBar
IsMW3On := true
IsMW3InfOn := false
IsCOD4On := false
IsMW2On := false
Gui, Add, ListView, x5 r23 w517 grid BackgroundSilver NoSort, Command|Shortcut|Preview
LV_Add("", "Clean", "Numpad 0", "!clean <name>")
LV_Add("", "Warning for Camping", "Numpad 1", "!warn <name> camp")
LV_Add("", "Warning for Grenade Launcher", "Numpad 2", "!warn <name> rule3")
LV_Add("", "Warning for Rocket Launcher", "Numpad 3", "!warn <name> rule4")
LV_Add("", "Warning for Respectfull Language", "Numpad 4", "!warn <name> rule5")
LV_Add("", "Warning for English Only", "Numpad 5", "!warn <name> rule6")
LV_Add("", "Remove warning", "Numpad 6", "!warnremove <name>")
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

Mw3InfMenu:
Gui, Destroy
Gui, Menu, MyMenuBar
IsMW3InfOn := true
IsMW3On := false
IsCOD4On := false
IsMW2On := false
Gui, Add, ListView, x5 r23 w517 grid BackgroundSilver NoSort, Command|Shortcut|Preview
LV_Add("", "Warning for camping after Moab", "Numpad 1", "!warn <name> rule2")
LV_Add("", "Warning for not talking english", "Numpad 2", "!warn <name> rule4")
LV_Add("", "Remove warning", "Numpad 6", "!warnremove <name>")
LV_Add("", "List", "Numpad 9", "!list")
LV_Add("", "Kick for camping after Moab", "Alt + Numpad 1", "!kick <name> rule2")
LV_Add("", "Kick for not talking english", "Alt + Numpad 2", "!kick <name> rule4")
LV_Add("", "Lookup player ID", "Alt + Numpad 9", "!lookup <name>")
LV_Add("", "Permban for Aimbot", "Shift + F1", "!permban <name> Aimbot")
LV_Add("", "Permban for Wallhack", "Shift + F2", "!permban <name> Wallhack")
LV_Add("", "Tempban for continuous camping (3h)", "Shift + F3", "!tempban <name> 3h Stop camping")
LV_Add("", "Scream no camping", "Shift + F9", "!scream CAMPING AFTER MOAB IS NOT ALLOWED")
LV_Add("", "Scream English only", "Shift + F10", "!scream ENGLISH ONLY IN PUBLIC CHAT")
LV_Add("", "Pause Quick Commands", "Alt + P", "")
LV_ModifyCol(1)
LV_ModifyCol(2, "Auto" "Center")
LV_ModifyCol(3)
Gui, Font, s7 bold c000000, Times New Roman
Gui, Add, Link,, TsG Quick Commands by <a href="https://thesyndicategamers.com/index.php?members/cntrlaltdel.49/">CAD</a> and <a href="https://thesyndicategamers.com/index.php?members/theonebehindyou1.28/">Toby</a> ©2018      <a href="https://github.com/TheOneBehindYou1/TsGQuickCommands">%CurrentVersion%</a>
Gui, Show, Autosize, TsG Quick Commands
return

Cod4Menu:
Gui, Destroy
Gui, Menu, MyMenuBar
IsMW3On := false
IsMW3InfOn := false
IsCOD4On := true
IsMW2On := false
Gui, Add, ListView, x5 r23 w517 grid BackgroundSilver NoSort, Command|Shortcut|Preview
LV_Add("", "Clean", "Numpad 0", "!clean <name> (lookup if possible)")
LV_Add("", "Warning for Camping", "Numpad 1", "!warn <name> camp")
LV_Add("", "Warning for Grenade Launcher", "Numpad 2", "!warn <name> rule3")
LV_Add("", "Warning for Rocket Launcher", "Numpad 3", "!warn <name> rule4")
LV_Add("", "Warning for Respectfull Language", "Numpad 4", "!warn <name> rule5")
LV_Add("", "Warning for English Only", "Numpad 5", "!warn <name> rule6")
LV_Add("", "Remove warning", "Numpad 6", "!warnremove <name>")
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

Echelon1:
MsgBox, 4, Echelon, Do you want to open Echelon for MW3?
IfMsgBox No
	return
IfMsgBox Timeout
	return
else IfMsgBox Yes
	Run, https://www.tsgservers.tk/echelon-v2/index.php?game=1
return

Echelon2:
MsgBox, 4, Echelon, Do you want to open Echelon for MW2?
IfMsgBox No
	return
IfMsgBox Timeout
	return
else IfMsgBox Yes
	Run, https://www.tsgservers.tk/echelon-v2/index.php?game=5
return

Echelon3:
MsgBox, 4, Echelon, Do you want to open Echelon for CoD4?
IfMsgBox No
	return
IfMsgBox Timeout
	return
else IfMsgBox Yes
	Run, https://www.tsgservers.tk/echelon-v2/index.php?game=2
return

Echelon4:
MsgBox, 4, Echelon, Do you want to open Echelon for BO?
IfMsgBox No
	return
IfMsgBox Timeout
	return
else IfMsgBox Yes
	Run, https://www.tsgservers.tk/echelon-v2/index.php?game=3
return

Echelon5:
MsgBox, 4, Echelon, Do you want to open Echelon for CS:GO?
IfMsgBox No
	return
IfMsgBox Timeout
	return
else IfMsgBox Yes
	Run, https://www.tsgservers.tk/echelon-v2/index.php?game=6
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
if(WhichAdminRank == URank3 or WhichAdminRank == URank4 or WhichAdminRank == URank5 or WhichAdminRank == URank6 or WhichAdminRank == URank7 or WhichAdminRank == URank8) {
	if(IsMW3On == true or IsCOD4On == true or IsMW3InfOn == true) {
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
	}
	else {
	return
	}
}
else if(WhichAdminRank == URank1 or WhichAdminRank == URank2) {
return
}

Shift & F2::
if(WhichAdminRank == URank3 or WhichAdminRank == URank4 or WhichAdminRank == URank5 or WhichAdminRank == URank6 or WhichAdminRank == URank7 or WhichAdminRank == URank8) {
	if(IsMW3On == true or IsCOD4On == true or IsMW3InfOn == true) {
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
	}
	else {
	return
	}
}
else if(WhichAdminRank == URank1 or WhichAdminRank == URank2) {
return
}

Shift & F3::
if(WhichAdminRank == URank2 or WhichAdminRank == URank3 or WhichAdminRank == URank4 or WhichAdminRank == URank5 or WhichAdminRank == URank6 or WhichAdminRank == URank7 or WhichAdminRank == URank8) {
	if(IsMW3On == true or IsCOD4On == true or IsMW3InfOn == true) {
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
	}
	else {
	return
	}
}
else if(WhichAdminRank == URank1) {
return
}

Shift & F9::
	if(IsMW3On == true  or IsCOD4On == true or IsMW3InfOn == true) {
	SetKeyDelay , 10, 10 ;
	Send, t{!}scream CAMPING IS NOT ALLOWED!
	SetKeyDelay , 10, 10 ;
	Send, {Enter}
	return
}
else {
return
}

Shift & F10::
if(IsMW3On == true  or IsCOD4On == true or IsMW3InfOn == true) {
	SetKeyDelay , 10, 10 ;
	Send, t{!}scream ENGLISH ONLY IN PUBLIC CHAT
	SetKeyDelay , 10, 10 ;
	Send, {Enter}
	return
}
else {
return
}

Numpad1::
if(WhichAdminRank == URank2 or WhichAdminRank == URank3 or WhichAdminRank == URank4 or WhichAdminRank == URank5 or WhichAdminRank == URank6 or WhichAdminRank == URank7 or WhichAdminRank == URank8) {
	if(IsMW3On == true or IsCOD4On == true) {
		SetKeyDelay , 10, 10 
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
	}
	else if(IsMW3InfOn == true){
		SetKeyDelay, 10, 10 
		Send, t{!}warn <name> rule2
		Loop, 6 {
			Sleep 10
			Send, {Left}
		}
		Loop, 6 {
			Sleep 10
			Send, {Backspace}
		}
		return
	}
	else {
	return
	}
}
else if(WhichAdminRank == URank1) {
return
}

Numpad2::
if(WhichAdminRank == URank2 or WhichAdminRank == URank3 or WhichAdminRank == URank4 or WhichAdminRank == URank5 or WhichAdminRank == URank6 or WhichAdminRank == URank7 or WhichAdminRank == URank8) {
	if(IsMW3On == true or IsCOD4On == true) {
		SetKeyDelay , 10, 10 
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
	}
	else if(IsMW3InfOn == true){
		SetKeyDelay, 10, 10 
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
	}
	else {
	return
	}
}
else if(WhichAdminRank == URank1) {
return
}

Numpad3::
if(WhichAdminRank == URank2 or WhichAdminRank == URank3 or WhichAdminRank == URank4 or WhichAdminRank == URank5 or WhichAdminRank == URank6 or WhichAdminRank == URank7 or WhichAdminRank == URank8) {
	if(IsMW3On == true or IsCOD4On == true) {
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
	}
	else {
	return
	}
}
else if(WhichAdminRank == URank1) {
return
}

Numpad4::
if(WhichAdminRank == URank2 or WhichAdminRank == URank3 or WhichAdminRank == URank4 or WhichAdminRank == URank5 or WhichAdminRank == URank6 or WhichAdminRank == URank7 or WhichAdminRank == URank8) {
	if(IsMW3On == true or IsCOD4On == true) {
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
	}
	else {
	return
	}
}
else if(WhichAdminRank == URank1) {
return
}

Numpad5::
if(WhichAdminRank == URank2 or WhichAdminRank == URank3 or WhichAdminRank == URank4 or WhichAdminRank == URank5 or WhichAdminRank == URank6 or WhichAdminRank == URank7 or WhichAdminRank == URank8) {
	if(IsMW3On == true or IsCOD4On == true) {
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
	}
	else {
	return
	}
}
else if(WhichAdminRank == URank1) {
return
}

Numpad6::
if(WhichAdminRank == URank2 or WhichAdminRank == URank3 or WhichAdminRank == URank4 or WhichAdminRank == URank5 or WhichAdminRank == URank6 or WhichAdminRank == URank7 or WhichAdminRank == URank8) {
	if(IsMW3On == true or IsCOD4On == true or IsMW3InfOn == true) {
		SetKeyDelay , 10, 10 ;
		Send, t{!}warnremove <name>
		Loop, 6 {
			Sleep 10
			Send, {Backspace}
		}
		return
	}
	else {
	return
	}
}
else if(WhichAdminRank == URank1) {
return
}

Numpad9::
if(IsMW3On == true or IsCOD4On == true or IsMW3InfOn == true) {
	SetKeyDelay , 10, 10 ;
	Send, t{!}list
	Sleep 10
	Send, t{Enter}
	return
}
else {
return
}

Numpad0::
if(IsMW3On == true or IsCOD4On == true or IsMW3InfOn == true) {
	SetKeyDelay , 10, 10 ;
	Send, t{!}clean <name>
	Loop, 6 {
		Sleep 10
		Send, {Backspace}
	}
	return
}
else {
return
}

Alt & Numpad1::
if(IsMW3On == true or IsCOD4On == true) {
	SetKeyDelay , 10, 10 ;
	Send, t{!}kick <name> rule2
	Loop, 6 {
		Sleep 10
		Send, {Left}
	}
	Loop, 6 {
		Sleep 10
		Send, {Backspace}
	}
	return
}
else if(IsMW3InfOn == true){
	SetKeyDelay, 10, 10 
	Send, t{!}kick <name> rule2
	Loop, 6 {
		Sleep 10
		Send, {Left}
	}
	Loop, 6 {
		Sleep 10
		Send, {Backspace}
	}
	return
}
else {
return
}

Alt & Numpad2::
if(IsMW3On == true or IsCOD4On == true) {
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
}
else if(IsMW3InfOn == true){
	SetKeyDelay, 10, 10 
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
}
else {
return
}

Alt & Numpad3::
if(IsMW3On == true or IsCOD4On == true) {
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
}
else {
return
}

Alt & Numpad4::
if(IsMW3On == true or IsCOD4On == true) {
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
}
else {
return
}

Alt & Numpad5::
if(IsMW3On == true or IsCOD4On == true) {
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
}
else {
return
}

Alt & Numpad9::
if(IsMW3On == true or IsCOD4On == true or IsMW3InfOn == true) {
	SetKeyDelay, 10, 10 ;
	Send, t{!}lookup <name>
	Loop, 6 {
		Sleep 10
		Send, {Backspace}
	}
	return
}
else {
return
}

Alt & p::Suspend 

GetAdminRank() {
	if FileExist("Profile.txt")
	{
		FileReadLine, AdminRank, Profile.txt,2
		return AdminRank
	}
	else {
		return
	}
}
