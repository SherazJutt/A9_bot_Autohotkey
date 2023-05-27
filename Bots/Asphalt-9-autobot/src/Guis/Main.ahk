main_gui:

    Gui -MinimizeBox -MaximizeBox -DPIScale ;-Caption

    Gui Add, Button, gscript_start x3 y3 w130 h60 , Play
    Gui Add, Button, gexitscript x134 y3 w70 h60, Exit

    Gui Add, CheckBox, gplayhunt %Hunt% x7 y70 w80 h25 , Play Hunt
    Gui Add, Button, gHunt_Cars_Label x90 y70 w75 h25 , Hunt Cars
    Gui Add, CheckBox, gPlayMPAds %MPads% x7 y100 w100 h25 , Play MP Ads
    Gui Add, CheckBox, gmute_volume %Mute_System% x7 y130 w150 h25, Mute System Volume
    Gui Add, CheckBox, gLeagueDetection %LeagueDetection% x7 y160 w150 h25, League Detection
    Gui Add, Button, gSkip_MP_Cars_Label x7 y190 w100 h25 , Skip MP Cars

    Gui Show, w210 h300, Asphat 9 Autobot
    WinSet, Style, -0x80000, Asphat 9 Autobot

Return
exitscript:
    SoundSet,0,,Mute
ExitApp
Return
;  *--------------------------------------------------*
;        |     Toggling bot options      |       
;  *--------------------------------------------------*

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

LeagueDetection:
    if(LeagueDetection == 0){
        LeagueDetection = Checked
        IniWrite, 1, %myinipath%, Main, LeagueDetection
    }Else{
        LeagueDetection = 0
        IniWrite, 0, %myinipath%, Main, LeagueDetection
    }
Return

;  *--------------------------------------------------*
;        |     Functions Labels      |       
;  *--------------------------------------------------*
