#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
CoordMode , Mouse, Screen
SendMode Input
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 0
SetMouseDelay -1
SetBatchLines -1

#Include, %A_ScriptDir%\src\Boot.ahk
#Include, %A_ScriptDir%\src\BotConfig.ahk
#Include, %A_ScriptDir%\src\Guis\CarsSkip\Variables.ahk
#Include, %A_ScriptDir%\src\Guis\Main.ahk
; #Include, %A_ScriptDir%\src\Guis\CarsSkip\Labels.ahk
#Include, %A_ScriptDir%\src\Guis\Hunt\HuntCars.ahk
#Include, %A_ScriptDir%\src\Guis\CarsSkip\Main.ahk
Hunt_Cars(id, label){
    MsgBox, its working %id% %label%
}
; skip_cars:
; playhunt:
; PlayMPAds:
; mute_volume:
; LeagueDetection:
script_start:

ExitApp

^p:: Pause
^q::
    SoundSet, 0, , mute
ExitApp

#Include, %A_ScriptDir%\src\libs\JSON.ahk
#Include, %A_ScriptDir%\src\libs\FindText.ahk