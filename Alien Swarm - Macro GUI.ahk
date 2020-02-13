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
ChatCheck = 1
counter = -1 
emotegui = -1
onslgui = -1
;=============== GUI ==========================
Gui, ChatGUI:+AlwaysOnTop -Caption -border +Disabled
Gui, ChatGUI:Font, s18 cRed Bold
Gui, ChatGUI:Add, Text, vChatText, Chat Mode OFF
Gui, ChatGUI:Show, x1 y0 NA Hide

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
Gui, EmoteGUI:Show, x650 y300 NoActivate Hide

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
Gui, OnslGUI:Show, x650 y300 NoActivate Hide

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

~^Enter::
{
	ChatCheck = -1
	GuiControl, ChatGUI:, ChatText, Chat Mode ON
	Gui, ChatGUI:Font, s18 cGreen Bold
	GuiControl, ChatGUI:Font, ChatText
	Gui, ChatGUI:Show, NA
}
return
~Enter up::
{
	ChatCheck *= -1
	if ChatCheck = -1
	{
		GuiControl, ChatGUI:, ChatText, Chat Mode ON
		Gui, ChatGUI:Font, s18 cGreen Bold
		GuiControl, ChatGUI:Font, ChatText
		Gui, ChatGUI:Show, NA
	}
	else
	{
		GuiControl, ChatGUI:, ChatText, Chat Mode OFF
		Gui, ChatGUI:Font, s18 cRed Bold
		GuiControl, ChatGUI:Font, ChatText
		Gui, ChatGUI:Show, NA
		Sleep, 100
		Gui, ChatGUI:Show, NA Hide
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
	If (ChatCheck = 1)
	{
		While (GetKeyState(KeyBind))
		{
			if emotegui = -1
			{
				MouseGetPos, CurrentPosX, CurrentPosY
				MouseMove, 800, 450
				emotegui = 1
			}
			MouseGetPos, CurrentEmoteX, CurrentEmoteY
			ResetEmoteGUI()
			if CurrentEmoteX < 750
			{
				if CurrentEmoteY < 400
				{
					GuiControl, EmoteGUI:MoveDraw, PICTL, w100 h100 x0 y0
				}
				else if CurrentEmoteY > 500
				{
					GuiControl, EmoteGUI:MoveDraw, PICBL, w100 h100 x0 y200
				}
				else
				{
					GuiControl, EmoteGUI:MoveDraw, PICML, w100 h100 x0 y100
				}
			}
			else if CurrentEmoteX > 850
			{
				if CurrentEmoteY < 400
				{
					GuiControl, EmoteGUI:MoveDraw, PICTR, w100 h100 x200 y0
				}
				else if CurrentEmoteY > 500
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
				if CurrentEmoteY < 400
				{
					GuiControl, EmoteGUI:MoveDraw, PICTM, w100 h100 x100 y0
				}
				else if CurrentEmoteY > 500
				{
					GuiControl, EmoteGUI:MoveDraw, PICBM, w100 h100 x100 y200
				}
				else
				{
					; GuiControl, EmoteGUI:MoveDraw, PICMM, w100 h100 x100 y100
				}
			}
			Gui, EmoteGUI:Show, NoActivate
			Sleep, 50
		}
		
		
		Gui, EmoteGUI:Show, Hide
		MouseMove, %CurrentPosX%, %CurrentPosY%
		if CurrentEmoteX < 750
		{
			if CurrentEmoteY < 400
			{
				Send {RCTRL down}{Numpad3}{RCTRL up} ; smile emote
			}
			else if CurrentEmoteY > 500
			{
				Send {RCTRL down}{Numpad1}{RCTRL up} ; medic emote
			}
			else
			{
				Send {RCTRL down}{Numpad6}{RCTRL up} ; ! emote
			}
		}
		else if CurrentEmoteX > 850
		{
			if CurrentEmoteY < 400
			{
				Send {RCTRL down}{Numpad7}{RCTRL up} ; anime emote
			}
			else if CurrentEmoteY > 500
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
			if CurrentEmoteY < 400
			{
				Send {RCTRL down}{Numpad5}{RCTRL up} ; go emote
			}
			else if CurrentEmoteY > 500
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
}
return

LaunchOnslGUI:
{
	If (ChatCheck = 1)
	{
		While (GetKeyState(KeyBind))
		{
			if onslgui = -1
			{
				MouseGetPos, CurrentPosX, CurrentPosY
				MouseMove, 800, 450
				onslgui = 1
			}
			MouseGetPos, CurrentOnslX, CurrentOnslY
			ResetOnslGUI()
			if CurrentOnslX < 750
			{
				if CurrentOnslY < 400
				{
					GuiControl, OnslGUI:MoveDraw, PICTL, w100 h100 x0 y0
				}
				else if CurrentOnslY > 500
				{
					GuiControl, OnslGUI:MoveDraw, PICBL, w100 h100 x0 y200
				}
				else
				{
					GuiControl, OnslGUI:MoveDraw, PICML, w100 h100 x0 y100
				}
			}
			else if CurrentOnslX > 850
			{
				if CurrentOnslY < 400
				{
					GuiControl, OnslGUI:MoveDraw, PICTR, w100 h100 x200 y0
				}
				else if CurrentOnslY > 500
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
				if CurrentOnslY < 400
				{
					GuiControl, OnslGUI:MoveDraw, PICTM, w100 h100 x100 y0
				}
				else if CurrentOnslY > 500
				{
					GuiControl, OnslGUI:MoveDraw, PICBM, w100 h100 x100 y200
				}
				else
				{
					; GuiControl, OnslGUI:MoveDraw, PICMM, w100 h100 x100 y100
				}
			}
			Gui, OnslGUI:Show, NoActivate
			Sleep, 50
		}
		
		
		Gui, OnslGUI:Show, Hide
		MouseMove, %CurrentPosX%, %CurrentPosY%
		if CurrentOnslX < 750
		{
			if CurrentOnslY < 400
			{
				SendInput {Numpad1} ; xeno
			}
			else if CurrentOnslY > 500
			{
				SendInput {Numpad2} ; harvester 
			}
			else
			{
				SendInput {Numpad3} ; horde 
			}
		}
		else if CurrentOnslX > 850
		{
			if CurrentOnslY < 400
			{
				SendInput {Numpad4} ; mortar
			}
			else if CurrentOnslY > 500
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
			if CurrentOnslY < 400
			{
				SendInput {Numpad7} ; para 
			}
			else if CurrentOnslY > 500
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
}
return

Macro: ; emote/horde panel
{
	ifWinActive, ahk_exe reactivedrop.exe
	{
		if ChatCheck = 1
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
}
return

Wawakey:
{
	setTimer,Wawakey,off
	if ChatCheck = 1
	{
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