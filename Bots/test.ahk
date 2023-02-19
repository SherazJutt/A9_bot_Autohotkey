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
gui_1:
    Gui, Add, Button, gguit2 Default w55 h20 x70 y61, Save
    Gui, Show, w135 h185, Cars
Return
guit2:
    Gui, Destroy
    ; car1
    Gui, Add, Text, w30 h25 y7, Car 1:
    Gui, Add, Edit, vcar_1 w25 h20 x40 y3
    ; car2
    Gui, Add, Text, w30 h25 x70 y7, Car 2:
    Gui, Add, Edit, vcar_2 w25 h20 x100 y3
    ; car3
    Gui, Add, Text, w30 h25 x10 y33 , Car 3:
    Gui, Add, Edit, vcar_3 w25 h20 x40 y30
    ; car4
    Gui, Add, Text, w30 h25 x70 y33 , Car 4:
    Gui, Add, Edit, vcar_4 w25 h20 x100 y30
    ; car5
    Gui, Add, Text, w30 h25 x10 y63 , Car 5:
    Gui, Add, Edit, vcar_5 w25 h20 x40 y60

    Gui, Add, Button, gsave_cars Default w55 h20 x70 y61, Save

    Gui, Show, w135 h185, Cars

    IniRead, inicar1, %myinipath%, HUNT ,car_1
    IniRead, inicar2, %myinipath%, HUNT ,car_2
    IniRead, inicar3, %myinipath%, HUNT ,car_3
    IniRead, inicar4, %myinipath%, HUNT ,car_4
    IniRead, inicar5, %myinipath%, HUNT ,car_5
    GuiControl, , car_1, %inicar1%
    GuiControl, , car_2, %inicar2%
    GuiControl, , car_3, %inicar3%
    GuiControl, , car_4, %inicar4%
    GuiControl, , car_5, %inicar5%
Return

save_cars:
    Gui, Submit, NoHide
    IniWrite, %car_1%, %myinipath%, HUNT,car_1
    IniWrite, %car_2%, %myinipath%, HUNT,car_2
    IniWrite, %car_3%, %myinipath%, HUNT,car_3
    IniWrite, %car_4%, %myinipath%, HUNT,car_4
    IniWrite, %car_5%, %myinipath%, HUNT,car_5
    Gui, Destroy
    Goto, gui_1
Return

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
Gui Add, CheckBox, vLowMode x7 y140 w110 h25, Newmode
Gui Show, w225 h185, Window

GuiControl, , LowMode, 1
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