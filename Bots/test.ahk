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

myinipath=%A_ScriptDir%\options.ini
IniRead, inihunt, %myinipath%, Main, Hunt
IniRead, iniads, %myinipath%, Main, MP1_Ads
IniRead, iniLowGarage, %myinipath%, Main, LowGarage

Hunt = 0
MPads = 0
LowGarage = 0

If (inihunt == 1){
    Hunt = Checked
}
If (iniads == 1){
    MPads = Checked
}
If (iniLowGarage == 1){
    LowGarage = Checked
}

Gui Add, Button, gBtnPlay x7 y7 w100 h45 , Play
Gui Add, Button, gexitscript x115 y7 w100 h45, Exit
Gui Add, CheckBox, gplayhunt %Hunt% x7 y60 w75 h25 , Play Hunt
Gui Add, CheckBox, gPlayMPAds %MPads% x7 y85s w80 h25 , Play MP Ads
Gui Add, CheckBox, gLowGarageMode %LowGarage% x7 y110 w110 h25, Low Garage Mode

Gui Show, w225 h185, Window
Return

BtnPlay:
    MsgBox, %Hunt%
Return
exitscript:
    toggle := !toggle
    MsgBox, exit. %toggle%
    ; ExitApp
Return

pausescript:
    Pause
Return

playhunt:
    if(hunt == 0){
        hunt = Checked
        IniWrite, 1, %myinipath%, Main,Hunt
    }Else{
        hunt = 0
        IniWrite, 0, %myinipath%, Main,Hunt
    }
Return

PlayMPAds:
    if(MPads == 0){
        MPads = Checked
        IniWrite, 1, %myinipath%, Main,MP1_Ads
    }Else{
        MPads = 0
        IniWrite, 0, %myinipath%, Main,MP1_Ads
    }
Return

LowGarageMode:
    if(LowGarage == 0){
        LowGarage = Checked
        IniWrite, 1, %myinipath%, Main, LowGarage
    }Else{
        LowGarage = 0
        IniWrite, 0, %myinipath%, Main, LowGarage
    }
Return

GuiEscape:
GuiClose:
ExitApp