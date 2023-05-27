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

t1:=A_TickCount, X:=Y:=""

carNames := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]

; #Include, %A_ScriptDir%\src\Boot.ahk
; #Include, %A_ScriptDir%\src\BotConfig.ahk
; #Include, %A_ScriptDir%\src\Guis\Main.ahk
; #Include, %A_ScriptDir%\src\Guis\HuntCars.ahk
; #Include, %A_ScriptDir%\src\Guis\CarsSkip.ahk
script_start:

    Gui, Destroy

    If (Mute_System != 0){
        SoundSet,+1,,Mute
    }

    start_game()
    Sleep, 5000

    StuckOnGlLogo := StuckOnGlLogo()
    If (StuckOnGlLogo ){
        Goto, script_start
    }

    StuckOnLoadingScreen:= StuckOnLoadingScreen()
    If (StuckOnLoadingScreen){
        Goto, script_start
    }

    MainMenuLoadedCheck:= MainMenuLoadedCheck()
    If (!MainMenuLoadedCheck){
        Goto, script_start
    }

    SeasonalEvents:= SeasonalEvents()
    If (!SeasonalEvents){
        Goto, script_start
    }

ExitApp

^p:: Pause
^q::
    SoundSet, 0, , mute
ExitApp

#Include, %A_ScriptDir%\src\functions\MainMenuLoadedCheck.ahk
#Include, %A_ScriptDir%\src\functions\StartGame.ahk
#Include, %A_ScriptDir%\src\functions\StuckOnGlLogo.ahk
#Include, %A_ScriptDir%\src\functions\StuckOnLoadingScreen.ahk
#Include, %A_ScriptDir%\src\functions\CommonFunctions.ahk

#Include, %A_ScriptDir%\src\libs\JSON.ahk
#Include, %A_ScriptDir%\src\libs\FindText.ahk