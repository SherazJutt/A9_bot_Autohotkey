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

global carNames := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]

; date_check:

;     ; Create WinHttpRequest object
;     WinHttp := ComObjCreate("WinHttp.WinHttpRequest.5.1")

;     ; Set URL and disable asynchronous requests
;     WinHttp.Open("GET", "http://worldtimeapi.org/api/ip", false)

;     ; Loop until successful response is received
;     Loop
;     {
;         ; Display alert message
;         MsgBox, 262144, , Connecting to internet... [ctrl + Q to exit], 1

;         ; Send request
;         try
;         {
;             WinHttp.Send()
;             break
;         }
;         catch
;         {
;             ; Wait for 1 second before retrying
;             Sleep, 1000
;         }
;     }

;     ; Response received, process data
;     data := WinHttp.ResponseText
;     Pos := InStr(data, "datetime")
;     Pos += 11
;     CurrentDate := StrReplace(SubStr(data, Pos, 10),"-", "")

;     ; Year Month Day
;     ExpirationDate := 2023 06 10
;     PurchaseDate := 2023 03 01

;     if (CurrentDate >= ExpirationDate or !data)
;     {
;         msgbox, The subscription period is over.
;         ExitApp
;     }Else if (CurrentDate <= PurchaseDate)
;     {
;         msgbox, Warning dont change the system date
;         ExitApp
;     }Else{
;         ToolTip, ExpirationDate : 10 June 2023 , 640, 0,
;     }

#Include, %A_ScriptDir%\src\Boot.ahk
#Include, %A_ScriptDir%\src\Guis\Main.ahk
#Include, %A_ScriptDir%\src\Guis\HuntCars.ahk
#Include, %A_ScriptDir%\src\Guis\CarsSkip.ahk

ScriptStart:

    ToolTip, Script start, 640, 0,

    Gui, Destroy

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

    If (!PlayHuntRace()){
        Goto, ScriptStart
    }

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
LeagueDetectionLabel:
    If (LeagueDetection()){
        Goto, TiersCheckLabel
    }Else{
        SelectMPCarToPlay()
    }

    Sleep, 3000

TiersCheckLabel:

    TiersCheck()
    CheckGame()

CarsSkipLabel:
    If (CarsSkip()){
        Goto, TiersCheckLabel
    }

OwnsThisCarLabel:
    If (!OwnsThisCar()){
        Send, {PgDn}
        Sleep, 2000
        Goto, OwnsThisCarLabel
    }

    If (isRefueling){
        Send, {PgDn}
        Sleep, 2000
        Goto, OwnsThisCarLabel
    }

    TdCheck()
    StartMPRace()
    If (!PlayMpRace()){
        Goto, ScriptStart
    }

    Sleep, 2000

    ; mp rewards skip
    Text:="|<>*144$3.zz0zzzzzzzzU"
    if (ok:=FindText(X, Y, 1184, 184, 1223, 222, 0, 0, Text))
    {
        Sleep, 250
        Click, 1188, 649 Left, 1
        Sleep, 250
    }Else{
        MpSkipCheck()
        Sleep, 1000
        If (watch_AD_if_1st_2nd_OR_3rd()){
            If (!close_AD()){
                Goto, ScriptStart
            }
        }
    }

    If (!homeCheck()){
        Goto, ScriptStart
    }
    Goto, LeagueDetectionLabel

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
#Include, %A_ScriptDir%\src\functions\CarsSkip.ahk

#Include, %A_ScriptDir%\src\functions\CommonFunctions.ahk

#Include, %A_ScriptDir%\src\libs\JSON.ahk
#Include, %A_ScriptDir%\src\libs\FindText.ahk