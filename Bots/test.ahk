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

; READING INI FILE TO CONFIGURE BOT
myinipath=%A_ScriptDir%\options.ini

if !FileExist(myinipath){
    IniWrite, "1", %myinipath%, Main,Hunt
    IniWrite, "1", %myinipath%, Main,MP1_Ads
    IniWrite, "1", %myinipath%, Main,LowGarage
    IniWrite, "1", %myinipath%, Main,Mute_System
    ; Goto, script_start
}

IniRead, inihunt, %myinipath%, Main, Hunt
IniRead, iniads, %myinipath%, Main, MP1_Ads
IniRead, iniLowGarage, %myinipath%, Main, LowGarage
IniRead, iniMute_System, %myinipath%, Main, Mute_System

Hunt = 0
MPads = 0
LowGarage = 0
Mute_System = 0

If (inihunt == 1){
    Hunt = Checked
}
If (iniads == 1){
    MPads = Checked
}
If (iniLowGarage == 1){
    LowGarage = Checked
}
If (iniMute_System == 1){
    Mute_System = Checked
}
main_gui:

    Gui -MinimizeBox -MaximizeBox -DPIScale ;-Caption
    ; play 
    Gui Add, Button, gscript_start x3 y3 w130 h60 , Play
    ; exit
    Gui Add, Button, gexitscript x134 y3 w70 h60, Exit
    ; play hunt
    Gui Add, CheckBox, gplayhunt %Hunt% x7 y70 w80 h25 , Play Hunt
    Gui Add, Button, gdefine_cars x90 y70 w75 h25 , Hunt Cars
    Gui Add, CheckBox, gPlayMPAds %MPads% x7 y100 w100 h25 , Play MP Ads
    Gui Add, CheckBox, gLowGarageMode %LowGarage% x7 y130 w130 h25, Low Garage Mode
    Gui Add, CheckBox, gmute_volume %Mute_System% x7 y160 w150 h25, Mute System Volume
    ; Gui Add, Text, x0 y160 w220 h2 +0x10
    Gui Show, w210 h200, Asphat 9 Autobot
    WinSet, Style, -0x80000, Asphat 9 Autobot
Return

; exit button action
exitscript:
ExitApp
Return

BtnPlay:
    MsgBox, %Hunt%
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

mute_volume:
    if(Mute_System == 0){
        Mute_System = Checked
        IniWrite, 1, %myinipath%, Main, Mute_System
    }Else{
        Mute_System = 0
        IniWrite, 0, %myinipath%, Main, Mute_System
    }
Return

define_cars:
    ; MsgBox, %inihunt% 
    Gui, Destroy
    Gui -MinimizeBox -MaximizeBox ;-DPIScale ;-Caption
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

    Gui Add, Text, x10 y87 w120 h50, Insert Numbers only to avoide errors

    Gui, Show, w135 h120, Define Cars
    WinSet, Style, -0x80000, Define Cars

    IniRead, inicar1, %myinipath%, HUNT ,car_1
    IniRead, inicar2, %myinipath%, HUNT ,car_2
    IniRead, inicar3, %myinipath%, HUNT ,car_3
    IniRead, inicar4, %myinipath%, HUNT ,car_4
    IniRead, inicar5, %myinipath%, HUNT ,car_5
    ; setting current ini values to inputs
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
    Goto, main_gui
Return

script_start:
    MsgBox, playing
Return