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

global SettingsIni := A_ScriptDir "\settings.ini"

carNames := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]

; #Include, %A_ScriptDir%\src\Boot.ahk
; #Include, %A_ScriptDir%\src\Guis\Main.ahk
; #Include, %A_ScriptDir%\src\Guis\HuntCars.ahk
; #Include, %A_ScriptDir%\src\Guis\CarsSkip.ahk

ScriptStart:

    ToolTip, Script start, 640, 0,

    Gui, Destroy
    Sleep, 3000

    LeagueDetection()
ExitApp

If (Mute_System != 0){
    SoundSet,+1,,Mute
}

start_game()
Sleep, 5000

If (StuckOnGlLogo()) {
    Goto, ScriptStart
}

If (StuckOnLoadingScreen()) {
    Goto, ScriptStart
}

MainMenuLoadedCheck:

    If (!MainMenuLoadedCheck()) {
        Goto, ScriptStart
    }

    Sleep, 3000

    CheckGame()
    FullScreenAD()
    ExitGamePopUp()
    RewardsNext()

    If (!SeasonalEvents()) {
        Goto, ScriptStart
    }

    if (Hunt == 0){
        Goto, HuntEnded
    }
    ; <========== Hunt Start ==========>

    If (!EnterEventsTab()) {
        Goto, MainMenuLoadedCheck
    }

HuntStart:

    If (!EnterHuntTab()) {
        If (!MainMenuLoadedCheck()) {
            Goto, ScriptStart
        }

        Goto, MP1Start
    }

HuntRaceScreen:

    If (!isRaceScreen()) {
        Goto, ScriptStart
    }

    Sleep, 2000

    If (!TicketCheck()) {
        If (!MainMenuLoadedCheck()) {
            Goto, ScriptStart
        }
        Goto, MP1Start
    }

    Sleep, 1000
    SelectCarToPlayHunt()
    Sleep, 1000
    TdCheck()

    if(PlayButton()){
        Click, 1183, 634 Left, 1
    }

    Sleep, 8000

    If (!PlayRace()){
        Goto, ScriptStart
    }

    MsgBox, rewards skip

    If (HuntRewardsSkip()){
        Sleep, 1000
        Goto, HuntRaceScreen
    }Else{
        Goto, ScriptStart
    }

HuntEnded:

; <========== Hunt Ended ==========>

MP1Start:

    ; entering mp
    Loop, 2
    {
        Click, 686, 644 Left, 1
        Sleep, 1000
    }

    authIndex := 0
    If (!XboxAuthentication()){
        If (authIndex == 5){
            Goto, ScriptStart
        }Else{
            authIndex ++
            Goto, MP1Start
        }
    }

    LeagueDetection()

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
#Include, %A_ScriptDir%\src\functions\PlayRace.ahk
#Include, %A_ScriptDir%\src\functions\MP1.ahk

#Include, %A_ScriptDir%\src\functions\CommonFunctions.ahk

#Include, %A_ScriptDir%\src\libs\JSON.ahk
#Include, %A_ScriptDir%\src\libs\FindText.ahk