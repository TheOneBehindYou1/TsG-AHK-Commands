;  #### GUI ####


; Create the sub-menus for the menu bar:
Menu, FileMenu, Add, &Open, FileOpen
Menu, FileMenu, Add, Save &As, FileSaveAs
Menu, FileMenu, Add  ; Separator line.
Menu, FileMenu, Add, E&xit, FileExit
Menu, HelpMenu, Add, &About, HelpAbout

; Create the menu bar by attaching the sub-menus to it:
Menu, MyMenuBar, Add, &File, :FileMenu
Menu, MyMenuBar, Add, &Help, :HelpMenu

; Attach the menu bar to the window:
Gui, Menu, MyMenuBar

; Create the main Edit control and display the window:
Gui, Add, ListView, x5 r15 w250 grid, Command|Shortcut
LV_Add("", "Camping", "Numpad1")
LV_Add("", "Grenade Launcher", "Numpad2")
LV_Add("", "Rocket Launcher", "Numpad3")
LV_Add("", "Respectfull Language", "Numpad4")
LV_Add("", "English Only", "Numpad5")
LV_Add("", "Permban for Aimbot", "Shift + F1")
LV_Add("", "Permban for Wallhack", "Shift + F2")
LV_Add("", "Tempban for continuous camping", "Shift + F3")
LV_Add("", "Scream no camping", "Shift + F9")
LV_Add("", "Scream English only", "Shift + F10")
LV_ModifyCol(1)  ; Auto-size each column to fit its contents.
Gui, Font, s7 bold c000000, Times New Roman
Gui, Add, Text,, kS Quick Commands by Toby © 2018
Gui, Show, Autosize, kS Quick Commands
return

FileOpen:
Gui +OwnDialogs  ; Force the user to dismiss the FileSelectFile dialog before returning to the main window.
FileSelectFile, SelectedFileName, 3,, Open File, Text Documents (*.txt)
if not SelectedFileName  ; No file selected.
    return
Gosub FileRead
return

FileRead:  ; Caller has set the variable SelectedFileName for us.
FileRead, MainEdit, %SelectedFileName%  ; Read the file's contents into the variable.
if ErrorLevel
{
    MsgBox Could not open "%SelectedFileName%".
    return
}
GuiControl,, MainEdit, %MainEdit%  ; Put the text into the control.
CurrentFileName := SelectedFileName
Gui, Show,, %CurrentFileName%   ; Show file name in title bar.
return

FileSaveAs:
Gui +OwnDialogs  ; Force the user to dismiss the FileSelectFile dialog before returning to the main window.
FileSelectFile, SelectedFileName, S16,, Save File, Text Documents (*.txt)
if not SelectedFileName  ; No file selected.
    return
CurrentFileName := SelectedFileName
Gosub SaveCurrentFile
return

SaveCurrentFile:  ; Caller has ensured that CurrentFileName is not blank.
if FileExist(CurrentFileName)
{
    FileDelete %CurrentFileName%
    if ErrorLevel
    {
        MsgBox The attempt to overwrite "%CurrentFileName%" failed.
        return
    }
}
GuiControlGet, MainEdit  ; Retrieve the contents of the Edit control.
FileAppend, %MainEdit%, %CurrentFileName%  ; Save the contents to the file.
; Upon success, Show file name in title bar (in case we were called by FileSaveAs):
Gui, Show,, %CurrentFileName%
return

HelpAbout:
Gui, About:+owner1  ; Make the main window (Gui #1) the owner of the "about box".
Gui +Disabled  ; Disable main window.
Gui, About:Add, Text,, Made by TheOneBehindYou1.
Gui, About:Add, Text,, If you have questions, DM him on Discord or in the Forum
Gui, About:Add, Button, Default w275, OK
Gui, About:Show,, kS Quick Commands
return

AboutButtonOK:  ; This section is used by the "about box" above.
AboutGuiClose:
AboutGuiEscape:
Gui, 1:-Disabled  ; Re-enable the main window (must be done prior to the next step).
Gui Destroy  ; Destroy the about box.
return

GuiDropFiles:  ; Support drag & drop.
Loop, Parse, A_GuiEvent, `n
{
    SelectedFileName := A_LoopField  ; Get the first file only (in case there's more than one).
    break
}
Gosub FileRead
return

GuiSize:
if (ErrorLevel = 1)  ; The window has been minimized. No action needed.
    return
; Otherwise, the window has been resized or maximized. Resize the Edit control to match.
NewWidth := A_GuiWidth - 20
NewHeight := A_GuiHeight - 20
GuiControl, Move, MainEdit, W%NewWidth% H%NewHeight%
return

FileExit:     ; User chose "Exit" from the File menu.
GuiClose:  ; User closed the window.
ExitApp


; #### Commands ####

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

Shift & F3::
SetKeyDelay , 10, 10 ;
Send, t{!}tempban <name> 3h Stop Camping
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
Send, {Backspace}
Sleep 10
Send, {Backspace}
Sleep 10
Send, {Backspace}
Sleep 10
Send, {Backspace}
Sleep 10
Send, {Backspace}
Sleep 10
Send, {Backspace}
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
