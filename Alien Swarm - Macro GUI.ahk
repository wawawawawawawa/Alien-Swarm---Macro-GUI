#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#InstallKeybdHook
#InstallMouseHook
#SingleInstance force

; Bind
IniRead, KeyBind, HotkeySetting.ini, HotKey, KeyBind
Hotkey, ~$%KeyBind%, Macro

; Constants
counter = -1 
emotegui = -1
onslgui = -1

CenterX := 800
CenterY := 400
CenterX150 := CenterX - 150
CenterY150 := CenterY - 150

; Window Constants
If WinExist("ahk_exe reactivedrop.exe")
{
	SysGet, borderwidth, 32
	SysGet, borderheight, 33
	WinGetPos, WinX, WinY, WinWidth, WinHeight, ahk_exe reactivedrop.exe
	CenterX := (WinWidth / 2) + borderwidth 
	CenterY := (WinHeight / 2) + borderheight
	CenterX150 := WinX + CenterX - 150
	CenterY150 := WinY + CenterY - 150
}

CenterXLeft := CenterX - 50
CenterXRight := CenterX + 50
CenterYLeft := CenterY - 50
CenterYRight := CenterY + 50

;=============== GUI ==========================
CustomColor := "EEAA99"  ; Can be any RGB color (it will be made transparent below).
Gui, EmoteGUI:+LastFound +AlwaysOnTop -Caption -border +Disabled
Gui, EmoteGUI:Color, %CustomColor%
Gui, EmoteGUI:Add, Picture, x0 y0 w100 h100 vPICTL, %A_ScriptDir%\img\emotes\emotesmile.png
Gui, EmoteGUI:Add, Picture, x100 y0 w100 h100 vPICTM, %A_ScriptDir%\img\emotes\emotego.png
Gui, EmoteGUI:Add, Picture, x200 y0 w100 h100 vPICTR, %A_ScriptDir%\img\emotes\emoteanime.png
Gui, EmoteGUI:Add, Picture, x0 y100 w100 h100 vPICML, %A_ScriptDir%\img\emotes\emoteexclaim.png
; Gui, EmoteGUI:Add, Picture, x100 y100 w100 h100 vPICMM, %A_ScriptDir%\img\emotes\face_flynn.png
Gui, EmoteGUI:Add, Picture, x200 y100 w100 h100 vPICMR, %A_ScriptDir%\img\emotes\emotequestion.png
Gui, EmoteGUI:Add, Picture, x0 y200 w100 h100 vPICBL, %A_ScriptDir%\img\emotes\emotemedic.png
Gui, EmoteGUI:Add, Picture, x100 y200 w100 h100 vPICBM, %A_ScriptDir%\img\emotes\emotestop.png
Gui, EmoteGUI:Add, Picture, x200 y200 w100 h100 vPICBR, %A_ScriptDir%\img\emotes\emoteammo.png
WinSet, TransColor, %CustomColor%
Gui, EmoteGUI:Show, x%CenterX150% y%CenterY150% NoActivate Hide

Gui, OnslGUI:+LastFound +AlwaysOnTop -Caption -border +Disabled
Gui, OnslGUI:Color, %CustomColor%
Gui, OnslGUI:Add, Picture, x0 y0 w100 h100 vPICTL, %A_ScriptDir%\img\enemies\Xenonite.png
Gui, OnslGUI:Add, Picture, x100 y0 w100 h100 vPICTM, %A_ScriptDir%\img\enemies\Parasite.png
Gui, OnslGUI:Add, Picture, x200 y0 w100 h100 vPICTR, %A_ScriptDir%\img\enemies\Mortarbug.png
Gui, OnslGUI:Add, Picture, x0 y100 w100 h100 vPICML, %A_ScriptDir%\img\enemies\Drone.png
; Gui, OnslGUI:Add, Picture, x100 y100 w100 h100 vPICMM, %A_ScriptDir%\img\enemies\Queen.png
Gui, OnslGUI:Add, Picture, x200 y100 w100 h100 vPICMR, %A_ScriptDir%\img\enemies\Shieldbug.png
Gui, OnslGUI:Add, Picture, x0 y200 w100 h100 vPICBL, %A_ScriptDir%\img\enemies\Harvester.png
Gui, OnslGUI:Add, Picture, x100 y200 w100 h100 vPICBM, %A_ScriptDir%\img\enemies\Buzzer.png
Gui, OnslGUI:Add, Picture, x200 y200 w100 h100 vPICBR, %A_ScriptDir%\img\enemies\Boomer.png
WinSet, TransColor, %CustomColor%
Gui, OnslGUI:Show, x%CenterX150% y%CenterY150% NoActivate Hide

SuspendOrNot()
return

SuspendOrNot()
{
	While 1
	{
		IfWinActive ahk_exe reactivedrop.exe
		{
			Suspend, Off
			continue
		}
		Suspend, On
	}
}
return

TimeCheck(key, time="T3", hold="")
{
	KeyWait, %key%, %hold% %time%
	if ErrorLevel = 0
	{
		return 0
	}
	else
	{
		return 1
	}
}
return

ResetEmoteGUI()
{
	GuiControl, EmoteGUI:MoveDraw, PICTL, w75 h75 x12 y12
	GuiControl, EmoteGUI:MoveDraw, PICTM, w75 h75 x112 y12
	GuiControl, EmoteGUI:MoveDraw, PICTR, w75 h75 x212 y12
	GuiControl, EmoteGUI:MoveDraw, PICML, w75 h75 x12 y112
	; GuiControl, EmoteGUI:MoveDraw, PICMM, w75 h75 x112 y112
	GuiControl, EmoteGUI:MoveDraw, PICMR, w75 h75 x212 y112
	GuiControl, EmoteGUI:MoveDraw, PICBL, w75 h75 x12 y212
	GuiControl, EmoteGUI:MoveDraw, PICBM, w75 h75 x112 y212
	GuiControl, EmoteGUI:MoveDraw, PICBR, w75 h75 x212 y212
}
return

ResetOnslGUI()
{
	GuiControl, OnslGUI:MoveDraw, PICTL, w75 h75 x12 y12
	GuiControl, OnslGUI:MoveDraw, PICTM, w75 h75 x112 y12
	GuiControl, OnslGUI:MoveDraw, PICTR, w75 h75 x212 y12
	GuiControl, OnslGUI:MoveDraw, PICML, w75 h75 x12 y112
	; GuiControl, OnslGUI:MoveDraw, PICMM, w75 h75 x112 y112
	GuiControl, OnslGUI:MoveDraw, PICMR, w75 h75 x212 y112
	GuiControl, OnslGUI:MoveDraw, PICBL, w75 h75 x12 y212
	GuiControl, OnslGUI:MoveDraw, PICBM, w75 h75 x112 y212
	GuiControl, OnslGUI:MoveDraw, PICBR, w75 h75 x212 y212
}
return

LaunchEmoteGUI:
{
	While (GetKeyState(KeyBind))
	{
		IfWinActive ahk_exe reactivedrop.exe
		{
			if emotegui = -1
			{
				MouseGetPos, CurrentPosX, CurrentPosY
				MouseMove, %CenterX%, %CenterY%
				emotegui = 1
			}
			MouseGetPos, CurrentEmoteX, CurrentEmoteY
			ResetEmoteGUI()
			if CurrentEmoteX < %CenterXLeft%
			{
				if CurrentEmoteY < %CenterYLeft%
				{
					GuiControl, EmoteGUI:MoveDraw, PICTL, w100 h100 x0 y0
				}
				else if CurrentEmoteY > %CenterYRight%
				{
					GuiControl, EmoteGUI:MoveDraw, PICBL, w100 h100 x0 y200
				}
				else
				{
					GuiControl, EmoteGUI:MoveDraw, PICML, w100 h100 x0 y100
				}
			}
			else if CurrentEmoteX > %CenterXRight%
			{
				if CurrentEmoteY < %CenterYLeft%
				{
					GuiControl, EmoteGUI:MoveDraw, PICTR, w100 h100 x200 y0
				}
				else if CurrentEmoteY > %CenterYRight%
				{
					GuiControl, EmoteGUI:MoveDraw, PICBR, w100 h100 x200 y200
				}
				else
				{
					GuiControl, EmoteGUI:MoveDraw, PICMR, w100 h100 x200 y100
				}
			}
			else
			{
				if CurrentEmoteY < %CenterYLeft%
				{
					GuiControl, EmoteGUI:MoveDraw, PICTM, w100 h100 x100 y0
				}
				else if CurrentEmoteY > %CenterYRight%
				{
					GuiControl, EmoteGUI:MoveDraw, PICBM, w100 h100 x100 y200
				}
				else
				{
					; GuiControl, EmoteGUI:MoveDraw, PICMM, w100 h100 x100 y100
				}
			}
			Gui, EmoteGUI:Show, NoActivate
			Gui, EmoteGUI:+AlwaysOnTop
			Sleep, 50
		}
	}
		
		
	Gui, EmoteGUI:Show, Hide
	MouseMove, %CurrentPosX%, %CurrentPosY%
	if CurrentEmoteX < %CenterXLeft%
	{
		if CurrentEmoteY < %CenterYLeft%
		{
			Send {RCTRL down}{Numpad3}{RCTRL up} ; smile emote
		}
		else if CurrentEmoteY > %CenterYRight%
		{
			Send {RCTRL down}{Numpad1}{RCTRL up} ; medic emote
		}
		else
		{
			Send {RCTRL down}{Numpad6}{RCTRL up} ; ! emote
		}
	}
	else if CurrentEmoteX > %CenterXRight%
	{
		if CurrentEmoteY < %CenterYLeft%
		{
			Send {RCTRL down}{Numpad7}{RCTRL up} ; anime emote
		}
		else if CurrentEmoteY > %CenterYRight%
		{
			Send {RCTRL down}{Numpad2}{RCTRL up} ; ammo emote
		}
		else
		{
			Send {RCTRL down}{Numpad8}{RCTRL up} ; ? emote
		}
	}
	else
	{
		if CurrentEmoteY < %CenterYLeft%
		{
			Send {RCTRL down}{Numpad5}{RCTRL up} ; go emote
		}
		else if CurrentEmoteY > %CenterYRight%
		{
			Send {RCTRL down}{Numpad4}{RCTRL up} ; stop emote
		}
		else
		{
			; Send {RCTRL down}{Numpad9}{RCTRL up} ; flynn voice
		}
	}
	emotegui = -1
	ResetEmoteGUI()
}
return

LaunchOnslGUI:
{
	While (GetKeyState(KeyBind))
	{
		IfWinActive ahk_exe reactivedrop.exe
		{
			if onslgui = -1
			{
				MouseGetPos, CurrentPosX, CurrentPosY
				MouseMove, %CenterX%, %CenterY%
				onslgui = 1
			}
			MouseGetPos, CurrentOnslX, CurrentOnslY
			ResetOnslGUI()
			if CurrentOnslX < %CenterXLeft%
			{
				if CurrentOnslY < %CenterYLeft%
				{
					GuiControl, OnslGUI:MoveDraw, PICTL, w100 h100 x0 y0
				}
				else if CurrentOnslY > %CenterYRight%
				{
					GuiControl, OnslGUI:MoveDraw, PICBL, w100 h100 x0 y200
				}
				else
				{
					GuiControl, OnslGUI:MoveDraw, PICML, w100 h100 x0 y100
				}
			}
			else if CurrentOnslX > %CenterXRight%
			{
				if CurrentOnslY < %CenterYLeft%
				{
					GuiControl, OnslGUI:MoveDraw, PICTR, w100 h100 x200 y0
				}
				else if CurrentOnslY > %CenterYRight%
				{
					GuiControl, OnslGUI:MoveDraw, PICBR, w100 h100 x200 y200
				}
				else
				{
					GuiControl, OnslGUI:MoveDraw, PICMR, w100 h100 x200 y100
				}
			}
			else
			{
				if CurrentOnslY < %CenterYLeft%
				{
					GuiControl, OnslGUI:MoveDraw, PICTM, w100 h100 x100 y0
				}
				else if CurrentOnslY > %CenterYRight%
				{
					GuiControl, OnslGUI:MoveDraw, PICBM, w100 h100 x100 y200
				}
				else
				{
					; GuiControl, OnslGUI:MoveDraw, PICMM, w100 h100 x100 y100
				}
			}
			Gui, OnslGUI:Show, NoActivate
			Gui, OnslGUI:+AlwaysOnTop
			Sleep, 50
		}
	}
	
	
	Gui, OnslGUI:Show, Hide
	MouseMove, %CurrentPosX%, %CurrentPosY%
	if CurrentOnslX < %CenterXLeft%
	{
		if CurrentOnslY < %CenterYLeft%
		{
			SendInput {Numpad1} ; xeno
		}
		else if CurrentOnslY > %CenterYRight%
		{
			SendInput {Numpad2} ; harvester 
		}
		else
		{
			SendInput {Numpad3} ; horde 
		}
	}
	else if CurrentOnslX > %CenterXRight%
	{
		if CurrentOnslY < %CenterYLeft%
		{
			SendInput {Numpad4} ; mortar
		}
		else if CurrentOnslY > %CenterYRight%
		{
			SendInput {Numpad5} ; boomer
		}
		else
		{
			SendInput {Numpad6} ; shield 
		}
	}
	else
	{
		if CurrentOnslY < %CenterYLeft%
		{
			SendInput {Numpad7} ; para 
		}
		else if CurrentOnslY > %CenterYRight%
		{
			SendInput {Numpad8} ; buzzer
		}
		else
		{
			; SendInput {Numpad9} ; queen 
		}
	}
	onslgui = -1
	ResetOnslGUI()
}
return

Macro: ; emote/horde panel
{
	ifWinActive, ahk_exe reactivedrop.exe
	{
		if counter >= 0 ; setTimer already started, so we log the keypress instead
		{
			counter++
			return
		}
		if TimeCheck(KeyBind, "T0.15", "") = 0
		{
			counter = 0 ; Start setTimer and set the number of logged keypresses to 0
			setTimer,Wawakey, 300
		}
		else ; key hold (and not pressed twice, just hold) => emote panel
		{
			GoSub, LaunchEmoteGUI
		}
	}
}
return

Wawakey:
{
	setTimer,Wawakey,off
	if counter = 0 ; The key is pressed once
	{
			Send {RCTRL down}{Numpad7}{RCTRL up} ; anime emote
	}
	else if counter >= 1 ; The key is pressed twice
	{
		GetKeyState, keyCheck, %KeyBind%
		if keyCheck = D ; key pressed twice and hold => horde panel
		{
			GoSub, LaunchOnslGUI
		}
		else ; key pressed twice but not hold
		{
			Send {RCTRL down}{Numpad8}{RCTRL up} ; ? emote
		}
	}
	counter = -1
}
return

;;;;;;;;;;;;;;				EMERGENCY EXIT					;;;;;;;;;;;;;;;;;;;;;;

^F8:: ; CTRL + F8 to close the script manually
{
	ExitApp
}
return

^F9:: ; CTRL + F8 to close the script manually
{
	Reload
}
return