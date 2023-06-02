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

    ToolTip, Script start, 640, 0,

    Gui, Destroy

    ;     Text:="|<>*147$12.Tzzzzzzzw0w0w0w0w0w0zyzyzyw0w0w0w0w0w0w0zzzzzzU"

    ;     if (ok:=FindText(X, Y, 499, 641, 523, 676, 0, 0, Text))
    ;     {
    ;         MsgBox, found
    ;     }Else{
    ;         MsgBox, not found
    ;     }

    ; Return

    If (Mute_System != 0){
        SoundSet,+1,,Mute
    }

    start_game()
    Sleep, 5000

    If (StuckOnGlLogo()) {
        Goto, script_start
    }

    If (StuckOnLoadingScreen()) {
        Goto, script_start
    }

MainMenuLoadedCheck:

    If (!MainMenuLoadedCheck()) {
        Goto, script_start
    }

    Sleep, 3000

    CheckGame()
    FullScreenAD()
    exitGamePopUp()
    RewardsNext()

    If (!SeasonalEvents()) {
        Goto, script_start
    }

    Sleep, 3000

    If (!EnterEventsTab()) {
        Goto, MainMenuLoadedCheck
    }

HuntStart:

    If (!EnterHuntTab()) {
        Goto, MP1Start
    }

    If (!isRaceScreen()) {
        Goto, MainMenuLoadedCheck
    }

MP1Start:
    MsgBox, Playing MP1

ExitApp

^p:: Pause
^q::
    SoundSet, 0, , mute
ExitApp

#Include, %A_ScriptDir%\src\functions\StartGame.ahk
#Include, %A_ScriptDir%\src\functions\StuckOnGlLogo.ahk
#Include, %A_ScriptDir%\src\functions\StuckOnLoadingScreen.ahk
#Include, %A_ScriptDir%\src\functions\MainMenuLoadedCheck.ahk
#Include, %A_ScriptDir%\src\functions\Events.ahk
#Include, %A_ScriptDir%\src\functions\Hunt.ahk

#Include, %A_ScriptDir%\src\functions\CommonFunctions.ahk

#Include, %A_ScriptDir%\src\libs\JSON.ahk
#Include, %A_ScriptDir%\src\libs\FindText.ahk