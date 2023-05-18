; READING INI FILE TO CONFIGURE BOT
myinipath=%A_ScriptDir%\settings.ini

; if ini file does not exist then create one and write deafault values
if !FileExist(myinipath){
    IniWrite, 1, %myinipath%, Main,Hunt
    IniWrite, 1, %myinipath%, Main,MP1_Ads
    IniWrite, 0, %myinipath%, Main,LowGarage
    IniWrite, 0, %myinipath%, Main,Mute_System
    ; Goto, script_start
}

;  *--------------------------------------------------*
;               |     Main variables      |       
;  *--------------------------------------------------*

IniRead, inihunt, %myinipath%, Main, Hunt
IniRead, iniads, %myinipath%, Main, MP1_Ads
IniRead, iniLowGarage, %myinipath%, Main, LowGarage
IniRead, iniMute_System, %myinipath%, Main, Mute_System
IniRead, iniLeagueDetection, %myinipath%, Main, LeagueDetection

Hunt = 0
MPads = 0
LowGarage = 0
Mute_System = 0
LeagueDetection = 0

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
    Mute_System = checked
}
If (iniLeagueDetection == 1){
    LeagueDetection = checked
}

