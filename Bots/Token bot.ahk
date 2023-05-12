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

; run as admin if not running as admin
CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) {
    Try {
        If (A_IsCompiled) {
            Run *RunAs "%A_ScriptFullPath%" /restart
        } Else {
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
    }
    ExitApp
}
; set tooltip coords screen base instead of focused window
CoordMode, ToolTip, Screen

date_check:

    ; Create WinHttpRequest object
    WinHttp := ComObjCreate("WinHttp.WinHttpRequest.5.1")

    ; Set URL and disable asynchronous requests
    WinHttp.Open("GET", "http://worldtimeapi.org/api/ip", false)

    ; Loop until successful response is received
    Loop
    {
        ; Display alert message
        MsgBox, 262144, , Connecting to internet... [ctrl + Q to exit], 1

        ; Send request
        try
        {
            WinHttp.Send()
            break
        }
        catch
        {
            ; Wait for 1 second before retrying
            Sleep, 1000
        }
    }

    ; Response received, process data
    data := WinHttp.ResponseText
    Pos := InStr(data, "datetime")
    Pos += 11
    CurrentDate := StrReplace(SubStr(data, Pos, 10),"-", "")

    ; Year Month Day
    ExpirationDate := 2023 06 01
    PurchaseDate := 2023 03 01

    if (CurrentDate >= ExpirationDate or !data)
    {
        msgbox, The subscription period is over.
        ExitApp
    }Else if (CurrentDate <= PurchaseDate)
    {
        msgbox, Warning dont change the system date
        ExitApp
    }Else{
        ToolTip, ExpirationDate : 01 June 2023 , 640, 0,
    }

    ; READING INI FILE TO CONFIGURE BOT
    myinipath=%A_ScriptDir%\options.ini

    if !FileExist(myinipath){
        IniWrite, "1", %myinipath%, Main,Hunt
        IniWrite, "1", %myinipath%, Main,MP1_Ads
        IniWrite, "0", %myinipath%, Main,LowGarage
        IniWrite, "0", %myinipath%, Main,Mute_System
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

    ;  *--------------------------------------------------*
    ;               |     Cars variables      |       
    ;  *--------------------------------------------------*

    ; Lancer
    IniRead, iniLancer, %myinipath%, CarsSkip, Lancer
    IniRead, iniLancer_to, %myinipath%, CarsSkip, Lancer_to
    ; Hellcat
    IniRead, iniHellcat, %myinipath%, CarsSkip, Hellcat
    IniRead, iniHellcat_to, %myinipath%, CarsSkip, Hellcat_to
    ; Peugeotsr1
    IniRead, iniPeugeotsr1, %myinipath%, CarsSkip, Peugeotsr1
    IniRead, iniPeugeotsr1_to, %myinipath%, CarsSkip, Peugeotsr1_to
    ; Lamborghinicountach25th
    IniRead, iniLamborghinicountach25th, %myinipath%, CarsSkip, Lamborghinicountach25th
    IniRead, iniLamborghinicountach25th_to, %myinipath%, CarsSkip, Lamborghinicountach25th_to
    ; Srt8
    IniRead, iniSrt8, %myinipath%, CarsSkip, Srt8
    IniRead, iniSrt8_to, %myinipath%, CarsSkip, Srt8_to
    ; Saleens1
    IniRead, iniSaleens1, %myinipath%, CarsSkip, Saleens1
    IniRead, iniSaleens1_to, %myinipath%, CarsSkip, Saleens1_to
    ; Ferrarimonzasp1
    IniRead, iniFerrarimonzasp1, %myinipath%, CarsSkip, Ferrarimonzasp1
    IniRead, iniFerrarimonzasp1_to, %myinipath%, CarsSkip, Ferrarimonzasp1_to
    ; Jaguarxesvproject
    IniRead, iniJaguarxesvproject, %myinipath%, CarsSkip, Jaguarxesvproject
    IniRead, iniJaguarxesvproject_to, %myinipath%, CarsSkip, Jaguarxesvproject_to
    ; Lamborghinimiura
    IniRead, iniLamborghinimiura, %myinipath%, CarsSkip, Lamborghinimiura
    IniRead, iniLamborghinimiura_to, %myinipath%, CarsSkip, Lamborghinimiura_to
    ; Bugattieb110
    IniRead, iniBugattieb110, %myinipath%, CarsSkip, Bugattieb110
    IniRead, iniBugattieb110_to, %myinipath%, CarsSkip, Bugattieb110_to
    ; Porsche911gscoupe
    IniRead, iniPorsche911gscoupe, %myinipath%, CarsSkip, Porsche911gscoupe
    IniRead, iniPorsche911gscoupe_to, %myinipath%, CarsSkip, Porsche911gscoupe_to
    ; Nissanr390
    IniRead, iniNissanr390, %myinipath%, CarsSkip, Nissanr390
    IniRead, iniNissanr390_to, %myinipath%, CarsSkip, Nissanr390_to
    ; Ferrarienzo
    IniRead, iniFerrarienzo, %myinipath%, CarsSkip, Ferrarienzo
    IniRead, iniFerrarienzo_to, %myinipath%, CarsSkip, Ferrarienzo_to
    ; Lamborghiniessenza
    IniRead, iniLamborghiniessenza, %myinipath%, CarsSkip, Lamborghiniessenza
    IniRead, iniLamborghiniessenza_to, %myinipath%, CarsSkip, Lamborghiniessenza_to
    ; Porschecarrera
    IniRead, iniPorschecarrera, %myinipath%, CarsSkip, Porschecarrera
    IniRead, iniPorschecarrera_to, %myinipath%, CarsSkip, Porschecarrera_to
    ; Vulkan
    IniRead, iniVulkan, %myinipath%, CarsSkip, Vulkan
    IniRead, iniVulkan_to, %myinipath%, CarsSkip, Vulkan_to
    ; Sennagtr
    IniRead, iniSennagtr, %myinipath%, CarsSkip, Sennagtr
    IniRead, iniSennagtr_to, %myinipath%, CarsSkip, Sennagtr_to
    ; Zondar
    IniRead, iniZondar, %myinipath%, CarsSkip, Zondar
    IniRead, iniZondar_to, %myinipath%, CarsSkip, Zondar_to
    ; Centenario
    IniRead, iniCentenario, %myinipath%, CarsSkip, Centenario
    IniRead, iniCentenario_to, %myinipath%, CarsSkip, Centenario_to
    ; RaesrTacheon
    IniRead, iniRaesrTacheon, %myinipath%, CarsSkip, RaesrTacheon
    IniRead, iniRaesrTacheon_to, %myinipath%, CarsSkip, RaesrTacheon_to
    ; Trion
    IniRead, iniTrion, %myinipath%, CarsSkip, Trion
    IniRead, iniTrion_to, %myinipath%, CarsSkip, Trion_to
    ; Naran
    IniRead, iniNaran, %myinipath%, CarsSkip, Naran
    IniRead, iniNaran_to, %myinipath%, CarsSkip, Naran_to

    ;  *--------------------------------------------------*
    ;         |     Cars checkbox variables      |       
    ;  *--------------------------------------------------*

    Lancer=0
    Hellcat=0
    Peugeotsr1=0
    Lamborghinicountach25th=0
    Srt8=0
    Saleens1=0
    Ferrarimonzasp1=0
    Jaguarxesvproject=0
    Lamborghinimiura=0
    Bugattieb110=0
    Porsche911gscoupe=0
    Nissanr390=0
    Ferrarienzo=0
    Lamborghiniessenza=0
    Porschecarrera=0
    Vulkan=0
    Sennagtr=0
    Zondar=0
    Centenario=0
    RaesrTacheon=0
    Trion=0
    Naran=0

    ;  *-----------------------------------------------------------------------*
    ;       |     Setting checkbox values whether its checked or not      |       
    ;  *------------------------------------------------------------------------*

    Lancer := (iniLancer = 1) ? "Checked":Lancer
    Hellcat := (iniHellcat = 1) ? "Checked":Hellcat
    Peugeotsr1 := (iniPeugeotsr1 = 1) ? "Checked":Peugeotsr1
    Lamborghinicountach25th := (iniLamborghinicountach25th = 1) ? "Checked":Lamborghinicountach25th
    Srt8 := (iniSrt8 = 1) ? "Checked":Srt8
    Saleens1 := (iniSaleens1 = 1) ? "Checked":Saleens1
    Ferrarimonzasp1 := (iniFerrarimonzasp1 = 1) ? "Checked":Ferrarimonzasp1
    Jaguarxesvproject := (iniJaguarxesvproject = 1) ? "Checked":Jaguarxesvproject
    Lamborghinimiura := (iniLamborghinimiura = 1) ? "Checked":Lamborghinimiura
    Bugattieb110 := (iniBugattieb110 = 1) ? "Checked":Bugattieb110
    Porsche911gscoupe := (iniPorsche911gscoupe = 1) ? "Checked":Porsche911gscoupe
    Nissanr390 := (iniNissanr390 = 1) ? "Checked":Nissanr390
    Ferrarienzo := (iniFerrarienzo = 1) ? "Checked":Ferrarienzo
    Lamborghiniessenza := (iniLamborghiniessenza = 1) ? "Checked":Lamborghiniessenza
    Porschecarrera := (iniPorschecarrera = 1) ? "Checked":Porschecarrera
    Vulkan := (iniVulkan = 1) ? "Checked":Vulkan
    Sennagtr := (iniSennagtr = 1) ? "Checked":Sennagtr
    Zondar := (iniZondar = 1) ? "Checked":Zondar
    Centenario := (iniCentenario = 1) ? "Checked":Centenario
    RaesrTacheon := (iniRaesrTacheon = 1) ? "Checked":RaesrTacheon
    Trion := (iniTrion = 1) ? "Checked":Trion
    Naran := (iniNaran = 1) ? "Checked":Naran

    ;  *--------------------------------------------------*
    ;         |     Mani GUi / shows first      |       
    ;  *--------------------------------------------------*

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
    Gui Add, CheckBox, gmute_volume %Mute_System% x7 y130 w150 h25, Mute System Volume
    Gui Add, CheckBox, gLeagueDetection %LeagueDetection% x7 y160 w150 h25, League Detection
    ; Gui Add, CheckBox, gLowGarageMode %LowGarage% x7 y190 w150 h25, Low Garage Mode
    Gui Add, Button, gskip_cars x7 y190 w100 h25 , Skip MP Cars
    ; Gui Add, Text, x0 y160 w220 h2 +0x10
    Gui Show, w210 h300, Asphat 9 Autobot
    WinSet, Style, -0x80000, Asphat 9 Autobot
Return

; exit button action
exitscript:
    SoundSet,0,,Mute
ExitApp
Return

;  *--------------------------------------------------*
;        |     Toggling main bot functions      |       
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

;  *-----------------------------------------------------------------------------*
;         |     Define Cars GUi / Shows after clicking on hunt cars       |       
;  *-----------------------------------------------------------------------------*

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

skip_cars:

    Gui, Destroy
    Gui -MinimizeBox -MaximizeBox ;-Caption ;-DPIScale

    ; glancer is like goto label and %Lancer% is a variable to set checkbox state checked or uncheked
    ; vlancer is a variable to select input

    ;lancer
    Gui Add, CheckBox, gLancer %Lancer% y0 w150 h25 , Lancer
    Gui, Add, Edit, vlancer_to_input w25 h20 x200 y0
    ;Dodge Hellcat
    Gui Add, CheckBox, gHellcat %Hellcat% x10 y30 w150 h25 , Hellcat
    Gui, Add, Edit, vhellcat_to_input w25 h20 x200 y30
    ;peugeot sr1
    Gui Add, CheckBox, gPeugeotsr1 %Peugeotsr1% x10 y60 w150 h25 , Peugeot sr1
    Gui, Add, Edit, vpeugeotsr1_to_input w25 h20 x200 y60
    ;lamborghini countach 25th
    Gui Add, CheckBox, gLamborghinicountach25th %Lamborghinicountach25th% x10 y90 w150 h25 , lamborghini countach 25th
    Gui, Add, Edit, vlamborghinicountach25th_to_input w25 h20 x200 y90
    ;SRT8
    Gui Add, CheckBox, gSrt8 %Srt8% x10 y120 w150 h25 , Srt8
    Gui, Add, Edit, vSrt8_to_input w25 h20 x200 y120
    ;Saleen s1
    Gui Add, CheckBox, gSaleens1 %Saleens1% x10 y150 w150 h25 , Saleen s1
    Gui, Add, Edit, vsaleens1_to_input w25 h20 x200 y150
    ;ferrari monza sp1
    Gui Add, CheckBox, gFerrarimonzasp1 %Ferrarimonzasp1% x10 y180 w150 h25 , Ferrari monza sp1
    Gui, Add, Edit, vferrarimonzasp1_to_input w25 h20 x200 y180
    ;jaguar xe sv project
    Gui Add, CheckBox, gJaguarxesvproject %Jaguarxesvproject% x10 y210 w150 h25 , jaguar xe sv project
    Gui, Add, Edit, vjaguarxesvproject_to_input w25 h20 x200 y210
    ;lamborghini miura
    Gui Add, CheckBox, gLamborghinimiura %Lamborghinimiura% x10 y240 w150 h25 , lamborghini miura
    Gui, Add, Edit, vlamborghinimiura_to_input w25 h20 x200 y240
    ;bugatti eb 110
    Gui Add, CheckBox, gBugattieb110 %Bugattieb110% x10 y270 w150 h25 , bugatti eb 110
    Gui, Add, Edit, vBugattieb110_to_input w25 h20 x200 y270
    ;Porsche 911 gs coupe
    Gui Add, CheckBox, gPorsche911gscoupe %Porsche911gscoupe% x10 y300 w150 h25 , Porsche 911 gs coupe
    Gui, Add, Edit, vporsche911gscoupe_to_input w25 h20 x200 y300
    ;nissan r390
    Gui Add, CheckBox, gNissanr390 %Nissanr390% x10 y330 w150 h25 , Nissan r390
    Gui, Add, Edit, vnissanr390_to_input w25 h20 x200 y330
    ;Ferrari enzo
    Gui Add, CheckBox, gFerrarienzo %Ferrarienzo% x10 y360 w150 h25 , Ferrari enzo
    Gui, Add, Edit, vFerrarienzo_to_input w25 h20 x200 y360
    ;lamborghini essenza
    Gui Add, CheckBox, gLamborghiniessenza %Lamborghiniessenza% x10 y390 w150 h25 , Lamborghini essenza
    Gui, Add, Edit, vLamborghiniessenza_to_input w25 h20 x200 y390
    ;Porsche carrera
    Gui Add, CheckBox, gPorschecarrera %Porschecarrera% x10 y420 w150 h25 , Porsche carrera
    Gui, Add, Edit, vPorschecarrera_to_input w25 h20 x200 y420
    ;vulkan
    Gui Add, CheckBox, gVulkan %Vulkan% x10 y450 w150 h25 , Vulkan
    Gui, Add, Edit, vVulkan_to_input w25 h20 x200 y450
    ;senna gtr
    Gui Add, CheckBox, gSennagtr %Sennagtr% x10 y480 w150 h25 , Senna gtr
    Gui, Add, Edit, vSennagtr_to_input w25 h20 x200 y480
    ;zonda r
    Gui Add, CheckBox, gZondar %Zondar% x10 y510 w150 h25 , Zonda r
    Gui, Add, Edit, vZondar_to_input w25 h20 x200 y510
    ;centenario
    Gui Add, CheckBox, gCentenario %Centenario% x10 y540 w150 h25 , Lamborgini centenario
    Gui, Add, Edit, vCentenario_to_input w25 h20 x200 y540
    ;Raesr Tacheon
    Gui Add, CheckBox, gRaesrTacheon %RaesrTacheon% x10 y570 w150 h25 , Raesr Tacheon
    Gui, Add, Edit, vRaesrTacheon_to_input w25 h20 x200 y570
    ;trion
    Gui Add, CheckBox, gTrion %Trion% x10 y600 w150 h25 , Trion Nemisis
    Gui, Add, Edit, vTrion_to_input w25 h20 x200 y600
    ;Naran
    Gui Add, CheckBox, gNaran %Naran% x10 y630 w150 h25 , Naran HyperCoupoe
    Gui, Add, Edit, vNaran_to_input w25 h20 x200 y630

    ; SAVE CARS SKIP
    Gui Add, Button, gsave_cars_skip x10 y660 w100 h25 , Save

    ; showing gui
    Gui, Show, w240 h690, Define Cars Skip
    ; WinSet, Style, -0x80000, Define Cars Skip

    ; MsgBox, %iniLancer_to%
    GuiControl, , Lancer_to_input, %iniLancer_to%
    GuiControl, , Hellcat_to_input, %iniHellcat_to%
    GuiControl, , Peugeotsr1_to_input, %iniPeugeotsr1_to%
    GuiControl, , Lamborghinicountach25th_to_input, %iniLamborghinicountach25th_to%
    GuiControl, , Srt8_to_input, %iniSrt8_to%
    GuiControl, , Saleens1_to_input, %iniSaleens1_to%
    GuiControl, , Ferrarimonzasp1_to_input, %iniFerrarimonzasp1_to%
    GuiControl, , Jaguarxesvproject_to_input, %iniJaguarxesvproject_to%
    GuiControl, , Lamborghinimiura_to_input, %iniLamborghinimiura_to%
    GuiControl, , Bugattieb110_to_input, %iniBugattieb110_to%
    GuiControl, , Porsche911gscoupe_to_input, %iniPorsche911gscoupe_to%
    GuiControl, , Nissanr390_to_input, %iniNissanr390_to%
    GuiControl, , Ferrarienzo_to_input, %iniFerrarienzo_to%
    GuiControl, , Lamborghiniessenza_to_input, %iniLamborghiniessenza_to%
    GuiControl, , Porschecarrera_to_input, %iniPorschecarrera_to%
    GuiControl, , Vulkan_to_input, %iniVulkan_to%
    GuiControl, , Sennagtr_to_input, %iniSennagtr_to%
    GuiControl, , Zondar_to_input, %iniZondar_to%
    GuiControl, , Centenario_to_input, %iniCentenario_to%
    GuiControl, , RaesrTacheon_to_input, %iniRaesrTacheon_to%
    GuiControl, , Trion_to_input, %iniTrion_to%
    GuiControl, , Naran_to_input, %iniNaran_to%

Return

save_cars_skip:
    Gui, Submit, NoHide
    IniWrite, %Lancer_to_input%, %myinipath%, CarsSkip, Lancer_to
    IniWrite, %Hellcat_to_input%, %myinipath%, CarsSkip, Hellcat_to
    IniWrite, %Peugeotsr1_to_input%, %myinipath%, CarsSkip, Peugeotsr1_to
    IniWrite, %Lamborghinicountach25th_to_input%, %myinipath%, CarsSkip, Lamborghinicountach25th_to
    IniWrite, %Srt8_to_input%, %myinipath%, CarsSkip, Srt8_to
    IniWrite, %Saleens1_to_input%, %myinipath%, CarsSkip, Saleens1_to
    IniWrite, %Ferrarimonzasp1_to_input%, %myinipath%, CarsSkip, Ferrarimonzasp1_to
    IniWrite, %Jaguarxesvproject_to_input%, %myinipath%, CarsSkip, Jaguarxesvproject_to
    IniWrite, %Lamborghinimiura_to_input%, %myinipath%, CarsSkip, Lamborghinimiura_to
    IniWrite, %Bugattieb110_to_input%, %myinipath%, CarsSkip, Bugattieb110_to
    IniWrite, %Porsche911gscoupe_to_input%, %myinipath%, CarsSkip, Porsche911gscoupe_to
    IniWrite, %Nissanr390_to_input%, %myinipath%, CarsSkip, Nissanr390_to
    IniWrite, %Ferrarienzo_to_input%, %myinipath%, CarsSkip, Ferrarienzo_to
    IniWrite, %Lamborghiniessenza_to_input%, %myinipath%, CarsSkip, Lamborghiniessenza_to
    IniWrite, %Porschecarrera_to_input%, %myinipath%, CarsSkip, Porschecarrera_to
    IniWrite, %Vulkan_to_input%, %myinipath%, CarsSkip, Vulkan_to
    IniWrite, %Sennagtr_to_input%, %myinipath%, CarsSkip, Sennagtr_to
    IniWrite, %Zondar_to_input%, %myinipath%, CarsSkip, Zondar_to
    IniWrite, %Centenario_to_input%, %myinipath%, CarsSkip, Centenario_to
    IniWrite, %RaesrTacheon_to_input%, %myinipath%, CarsSkip, RaesrTacheon_to
    IniWrite, %Trion_to_input%, %myinipath%, CarsSkip, Trion_to
    IniWrite, %Naran_to_input%, %myinipath%, CarsSkip, Naran_to
    ; MsgBox, %Lancer_to_input%

    Gui, Destroy
    Goto, main_gui
Return

; cars to skip labels start
Lancer:
    if(Lancer == 0){
        Lancer = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Lancer
    }Else{
        Lancer = 0
        IniWrite, 0, %myinipath%, CarsSkip, Lancer
    }
Return
; Hellcat
Hellcat:
    if(Hellcat == 0){
        Hellcat = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Hellcat
    }Else{
        Hellcat = 0
        IniWrite, 0, %myinipath%, CarsSkip, Hellcat
    }
Return
; Peugeotsr1
Peugeotsr1:
    if(Peugeotsr1 == 0){
        Peugeotsr1 = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Peugeotsr1
    }Else{
        Peugeotsr1 = 0
        IniWrite, 0, %myinipath%, CarsSkip, Peugeotsr1
    }
Return
; Lamborghinicountach25th
Lamborghinicountach25th:
    if(Lamborghinicountach25th == 0){
        Lamborghinicountach25th = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Lamborghinicountach25th
    }Else{
        Lamborghinicountach25th = 0
        IniWrite, 0, %myinipath%, CarsSkip, Lamborghinicountach25th
    }
Return
; Srt8
Srt8:
    if(Srt8 == 0){
        Srt8 = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Srt8
    }Else{
        Srt8 = 0
        IniWrite, 0, %myinipath%, CarsSkip, Srt8
    }
Return
; Saleens1
Saleens1:
    if(Saleens1 == 0){
        Saleens1 = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Saleens1
    }Else{
        Saleens1 = 0
        IniWrite, 0, %myinipath%, CarsSkip, Saleens1
    }
Return
; Ferrarimonzasp1
Ferrarimonzasp1:
    if(Ferrarimonzasp1 == 0){
        Ferrarimonzasp1 = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Ferrarimonzasp1
    }Else{
        Ferrarimonzasp1 = 0
        IniWrite, 0, %myinipath%, CarsSkip, Ferrarimonzasp1
    }
Return
; Jaguarxesvproject
Jaguarxesvproject:
    if(Jaguarxesvproject == 0){
        Jaguarxesvproject = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Jaguarxesvproject
    }Else{
        Jaguarxesvproject = 0
        IniWrite, 0, %myinipath%, CarsSkip, Jaguarxesvproject
    }
Return
; Lamborghinimiura
Lamborghinimiura:
    if(Lamborghinimiura == 0){
        Lamborghinimiura = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Lamborghinimiura
    }Else{
        Lamborghinimiura = 0
        IniWrite, 0, %myinipath%, CarsSkip, Lamborghinimiura
    }
Return
; Bugattieb110
Bugattieb110:
    if(Bugattieb110 == 0){
        Bugattieb110 = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Bugattieb110
    }Else{
        Bugattieb110 = 0
        IniWrite, 0, %myinipath%, CarsSkip, Bugattieb110
    }
Return
; Porsche911gscoupe
Porsche911gscoupe:
    if(Porsche911gscoupe == 0){
        Porsche911gscoupe = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Porsche911gscoupe
    }Else{
        Porsche911gscoupe = 0
        IniWrite, 0, %myinipath%, CarsSkip, Porsche911gscoupe
    }
Return
; Nissanr390
Nissanr390:
    if(Nissanr390 == 0){
        Nissanr390 = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Nissanr390
    }Else{
        Nissanr390 = 0
        IniWrite, 0, %myinipath%, CarsSkip, Nissanr390
    }
Return
; Ferrarienzo
Ferrarienzo:
    if(Ferrarienzo == 0){
        Ferrarienzo = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Ferrarienzo
    }Else{
        Ferrarienzo = 0
        IniWrite, 0, %myinipath%, CarsSkip, Ferrarienzo
    }
Return
; Lamborghiniessenza
Lamborghiniessenza:
    if(Lamborghiniessenza == 0){
        Lamborghiniessenza = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Lamborghiniessenza
    }Else{
        Lamborghiniessenza = 0
        IniWrite, 0, %myinipath%, CarsSkip, Lamborghiniessenza
    }
Return
; Porschecarrera
Porschecarrera:
    if(Porschecarrera == 0){
        Porschecarrera = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Porschecarrera
    }Else{
        Porschecarrera = 0
        IniWrite, 0, %myinipath%, CarsSkip, Porschecarrera
    }
Return
; Vulkan
Vulkan:
    if(Vulkan == 0){
        Vulkan = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Vulkan
    }Else{
        Vulkan = 0
        IniWrite, 0, %myinipath%, CarsSkip, Vulkan
    }
Return
; Sennagtr
Sennagtr:
    if(Sennagtr == 0){
        Sennagtr = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Sennagtr
    }Else{
        Sennagtr = 0
        IniWrite, 0, %myinipath%, CarsSkip, Sennagtr
    }
Return
; Zondar
Zondar:
    if(Zondar == 0){
        Zondar = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Zondar
    }Else{
        Zondar = 0
        IniWrite, 0, %myinipath%, CarsSkip, Zondar
    }
Return
; Centenario
Centenario:
    if(Centenario == 0){
        Centenario = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Centenario
    }Else{
        Centenario = 0
        IniWrite, 0, %myinipath%, CarsSkip, Centenario
    }
Return
; RaesrTacheon
RaesrTacheon:
    if(RaesrTacheon == 0){
        RaesrTacheon = Checked
        IniWrite, 1, %myinipath%, CarsSkip, RaesrTacheon
    }Else{
        RaesrTacheon = 0
        IniWrite, 0, %myinipath%, CarsSkip, RaesrTacheon
    }
Return
; Trion
Trion:
    if(Trion == 0){
        Trion = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Trion
    }Else{
        Trion = 0
        IniWrite, 0, %myinipath%, CarsSkip, Trion
    }
Return
; Naran
Naran:
    if(Naran == 0){
        Naran = Checked
        IniWrite, 1, %myinipath%, CarsSkip, Naran
    }Else{
        Naran = 0
        IniWrite, 0, %myinipath%, CarsSkip, Naran
    }
Return
; cars to skip labels end

script_start:

    Gui, Destroy

    If (Mute_System != 0){
        SoundSet,+1,,Mute
    }

    t1:=A_TickCount, X:=Y:=""

    Sleep, 1000

    ; close a9
    WinClose , Asphalt 9: Legends
    Sleep , 1000

    Run, "Asphalt 9" %A_ScriptDir%

    Sleep, 2000
    ; restore a9 window
    WinRestore, Asphalt 9: Legends

    ; activate a9 window
    Sleep , 2000
    WinActivate , Asphalt 9: Legends
    Sleep , 1000

    ; resize a9 window to 720p
    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
    Sleep, 1000

    ; restore a9 window
    WinRestore, Asphalt 9: Legends

    Sleep, 2000

stuck_on_GL_logo_start:

    Loop, 60
    {
        Sleep, 1000
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 650, 356, 679, 378, 0x000000, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            Continue
        }
        Else
        {
            Break
        }
    }
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 650, 356, 679, 378, 0x000000, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Goto, script_start
    }

stuck_on_GL_logo_end:

stuck_on_loading_screen_start:

    Loop, 60
    {
        Sleep, 1000
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 627, 511, 653, 531, 0xCD0041, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            Continue
        }
        Else
        {
            Break
        }
    }
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 627, 511, 653, 531, 0xCD0041, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Goto, script_start
    }

game_loading_screen_end:

main_menu_loaded_check_start:

    Sleep, 3000

    CoordMode , Pixel, Screen
    PixelSearch, FoundX, FoundY, 10, 61, 35, 87, 0xB00039, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Send , {Escape}
        Sleep , 1000
        Send , {Escape}
        Sleep , 1000
    } Else
    {
        Send , {Escape}
        Sleep , 1000
        Send , {Escape}
        Sleep , 1000
        Send , {Escape}
        Sleep , 1000
        Send , {Escape}
        Sleep , 1000
        IfWinExist, Asphalt 9: Legends
        {
            WinActivate, Asphalt 9: Legends
            WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
            WinRestore, Asphalt 9: Legends
        }
        else
        {
            ToolTip, main menu loaded check, 640, 0,
            Sleep, 1000
            Goto, script_start
        }
        ; game load screen banner ad

        Text:="|<>*117$61.zk600C0k1XTy3U0DUQ1lzzVk07kD1ky1ks03s3UsT0MQ03g1sMDUAC01r0QQ7k6700nUCC3s33U0sk3i1w3Vk0QQ1z0z1ks0CC0T0PzsQ0630DUBzsC071k3U6s0703zs1k0M03U1zw0s0A01k1sC0Q0q00s0s3UC0T00TyQ1k70DU0DzA0s3U7k07za0A1k3E"

        if (ok:=FindText(X, Y, 909, 544, 997, 585, 0, 0, Text))
        {
            Sleep, 250
            Click, 1058, 138 Left, 1
        }

        ; rewards next
        Text:="|<>*149$70.000000000001s1sDzls1tzzbU7Uzz3k7bzyT0S3zwD0wTztw1sC00S3k3k7s7Us00sS0D0TkS3U03ls0w1z1sC007D03k7y7Us00Sw0D0SsS3U00zU0w1vlsDz03w03k7b7Uzy07k0D0SSS3zs0z00w1stsC003y03k7XrUs00Ts0D0S7y3U01vk0w1sDsC00D703k7UzUs00wS0D0S1y3U07Us0w1s7sC00S3k3k7UDUzy3k70D0S0y3zwD0S0w1s1sDzls0s3k3030zy301U60U"

        if (ok:=FindText(X, Y, 1103, 628, 1190, 672, 0, 0, Text))
        {
            Click, 1207, 642 Left, 1
        }

        Goto , main_menu_loaded_check_start
    }
main_menu_loaded_check_end:

    Sleep, 1000

    ; seasonal events red
    Loop, 30
    {
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 240, 603, 270, 625, 0xFF0049, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            Sleep, 1000
        }
        else
        {
            Break
        }
    }
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 240, 603, 270, 625, 0xFF0049, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Goto, script_start
    }
    else
    {
        ; Sleep, 1000
        ; Click, 349, 637 Left, 1

        Loop, 100{

            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 251, 648, 276, 674, 0xFFFFFF, 0, Fast RGB
            If (ErrorLevel = 0)
            {
                Break
            }
            else
            {
                Click, 349, 637 Left, 1
                sleep, 100
                Send, {Escape}
            }
        }

        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 251, 648, 276, 674, 0xFFFFFF, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            Sleep, 2000
        }
        else
        {
            Goto, script_start
        }

    }

    ; <======================== Hunt Start ==============================>
hunt_start:

    ; enterning events tab start
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 256, 643, 269, 654, 0xFFFFFF, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Text:="|<>*137$15.zzw01U0A01XzwTzXzwTzXzwTzXzw07U0w07XzwTzXzwTzXzwTzXzw01U0A01zzw"

        if (ok:=FindText(X, Y, 498, 635, 528, 680, 0, 0, Text))
        {
            Loop, 2{

                Click , 465, 643 left, 1
                Sleep, 1000
            }
        }else{
            Goto, script_start
        }
    }Else{

        Goto, script_start
    }
    ; enterning events tab end

    Sleep, 3000

    ; green underline check to verify events tab start
    Loop, 3{
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 71, 690, 95, 700, 0xC3FB12, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            Break
        }
        Else
        {
            Click, 778, 372 Left, 1
            Sleep, 700
        }
    }

    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 71, 690, 95, 700, 0xC3FB12, 0, Fast RGB
    If (ErrorLevel = 0)
    {
    }Else{
        Sleep, 1000
        Loop, 20{
            WinActivate, Asphalt 9: Legends
            Send, {PgUp}
            Sleep, 500
        }
    }

    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 71, 690, 95, 700, 0xC3FB12, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Sleep, 250
    }
    Else
    {
        Goto , main_menu_loaded_check_start
    }
    ; green underline check to verify events tab end

hunt_card_check_start:

    ; hunt card

    Text:="|<>*128$130.000TU00TzzkDzzz1zzy00w001y000zzw0zzzk3zzk00k007s001zzU3zzw0Dzy001000TU003zs0DzzU0zzk0043zzy1zkDz00zzw03zy0T00Tzzs7zUTw03zzk0Dzs7z01zzzUTz1zkMDzz30zzUzy07zzy1zw7z7UzzwQ3zy3zs0Tzzs7zkTxy3zzrkDzsDzU1zzzUTz1zzsDzzz0zzUzy07zzy1zw7zzUzzzw3zy3zs0Tzzs7zkTzy3zzzkDzsDzU1zzzUTy1zzsDzzz0zzUzy07zzy1zkDzzUzzzw3zy3zs000Ts000zzy3zzzkDzsDzU001zU007zzsDzzz0zzUzy0007y000zzzUzzzw3zy3zs000Ts001zzy3zzzkDzsDzU001zU003zzsDzzz0zzUzy03zzy1zs7zzUzzzw3zy3zs0Tzzs7zkTzy3zzzkDzsDzU1zzzUTz1zzsDzzz0zzUzy07zzy1zw7zzUzzzw3zy3zs0Tzzs7zkTzy3zzzkDzsDzU0zzzUTz1zzsDzzz0zzUzy03zzy1zw7zzUzzzw3zy3zs0Tzzs7zkTzy3zzzkDzsDzU1zzzUTz1zzsDzzz0zzUTy03zzy1zs7zzUzzzw3zy1zk0007s000Tzy3zzzkDzw000000TU003zzsDzzz0zzk004001y000TzzUzzzw3zzU00k007s003zzy3zzzkDzz007U00zk01zzzsTzzzVzzzU1y"

    if (ok:=FindText(X, Y, 322, 220, 465, 265, 0, 0, Text))
    {
        Loop, 2{
            Send, {Enter}
            Sleep, 1000
        }

    }Else{

        Send, {PgDn}
        Sleep, 1800

        ; weekly competition
        Text:="|<>*147$106.y3s000y3zw00zy3zy3sDU003sDz001zs7zs7Uy000DUzs003zUTzUy3s000y3zU007y0zy3sDzk7zsDw1z0Ts3zsDUzzUzzUzkDz0zU7zUy3zy3zy3z1zy3y0Ty3sDzsDzsDw7zsDs0zsDUzzUzzUzkTzUzU3zUy3zy3zy3z1zy3y07y3sDzsDzsDw7zsDs0DsDUzzUzzUzkTzUzU0zUy3zy3zy3z1zy3y31y3sDzsDzsDw7zsDsA7sDUzzUzzUzkTzUzUsDUy3zy3zy3z1zy3y3Uy3sDzsDzsDw7zsDsD1sDUzzUzzUzkTzUzUw3Uy3zy3zy3z1zy3y3sC3sDzsDzsDw7zsDsDUMDUzzUzzUzkTzUzUz1Uy3zy3zy3z1zy3y3y23sDzsDzsDw7zsDsDs0DUzzUzzUzkTzUzUzk0y3zy3zy3z1zy3y3z03sDzsDzsDw7zsDsDy0DUzzUzzUzkTzUzUzs0y3zy3zy3z1zw3y3zk3sDzsDzsDw3zUDsDzUDUzzUzzUzk001zUzy0y3zy3zy3zU007y3zw3sDzsDzsDz000zsDzkDUzzUzzUzy007zUzzUz7zz7zz7zz03zz7zz6"

        if (ok:=FindText(X, Y, 445, 217, 559, 270, 0, 0, Text))
        {
            goto, hunt_ended
        }

        ; elite B
        Text:="|<>*123$105.zzzzzzzzzzzzzzzzzy003z7zzz7s000y003U00DkTzzkT0007k00A001y3zzy3s000y001U00DkTzzkT0007k00A003y3zzy3s000y001UzzzkTzzkTzkTzkTzw7zzy3zzy3zy3zy3zzUzzzkTzzkTzkTzkTzw7zzy3zzy3zy3zy3zzUzzzkTzzkTzkTzkTzw7zzy3zzy3zy3zy3zzUzzzkTzzkTzkTzkTzw7zzy3zzy3zy3zy3zzUzzzkTzzkTzkTzkTzw3zzy3zzy3zy3zy3zzU00zkTzzkTzkTzk00w007y3zzy3zy3zy003U00zkTzzkTzkTzk00Q007y3zzy3zy3zy007UTzzkTzzkTzkTzkTzw7zzy3zzy3zy3zy3zzUzzzkTzzkTzkTzkTzw7zzy3zzy3zy3zy3zzUzzzkTzzkTzkTzkTzw7zzy3zzy3zy3zy3zzUzzzkTzzkTzkTzkTzw7zzy3zzy3zy3zy3zzUzzzkTzzkTzkTzkTzw7zzy3zzy3zy3zy3zzUTzzkDzzkTzkTzkTzw003y000y3zy3zy001U00Dk007kTzkTzk00A001y000y3zy3zy001U00Tk007kTzkTzk00DzzzzzzzzzzzzzzzzzU"

        if (ok:=FindText(X, Y, 84, 214, 211, 273, 0, 0, Text))
        {
            goto, hunt_ended
        }

        Goto, hunt_card_check_start

    }
hunt_card_check_end:

    ; verify race screen

race_screen_check:

    Sleep, 2000

    Loop, 10{

        ; Normal hunt
        Text:="|<>*121$62.zzzzzzzzzzzsDzzVzy0DzU0TzkDz00Dk03zs3zk01w00Ty0zw00C3y3zU7z3y3VzkzsVzkzksTwDw8TwDwC7z3z37z3z3VzkzkkzkzksTzzsQDwDwC7zzy73z3z3VzzzVsTkzksTzzsy7wDsC7zzwDVz003Vzzz3wTk01sTzzkz3w01y7zzsTkz3sTVzky00Dky7sTwDU01wDky7z3s00T3wDVzkwDy7kzVsTsD3zUwDsS007kzwD3y3k01sTz3kzky00y7zkwDw7s0zVzyD3zVzzzzzzzzzzs"

        if (ok:=FindText(X, Y, 61, 147, 140, 198, 0, 0, Text))
        {
            Break
        }Else{

            ; Legendry Hunt
            Text:="|<>*119$16.k0C00M01U067zsTzVzy7zsTzVzy7zs07U0C00s03Vzy7zsTzVzy7zsTzVzy00s01U0600TzzU"

            if (ok:=FindText(X, Y, 81, 153, 107, 192, 0, 0, Text))
            {
                Break
            }

            Sleep, 1000

            ; star up check it later
            Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"

            if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text))
            {
                Sleep, 1000
                Send, {Escape}

            }
        }
    }

    ; ticket check

ticket_check_start:

    ; Normal hunt
    Text:="|<>*121$62.zzzzzzzzzzzsDzzVzy0DzU0TzkDz00Dk03zs3zk01w00Ty0zw00C3y3zU7z3y3VzkzsVzkzksTwDw8TwDwC7z3z37z3z3VzkzkkzkzksTzzsQDwDwC7zzy73z3z3VzzzVsTkzksTzzsy7wDsC7zzwDVz003Vzzz3wTk01sTzzkz3w01y7zzsTkz3sTVzky00Dky7sTwDU01wDky7z3s00T3wDVzkwDy7kzVsTsD3zUwDsS007kzwD3y3k01sTz3kzky00y7zkwDw7s0zVzyD3zVzzzzzzzzzzs"

    if (ok:=FindText(X, Y, 61, 147, 140, 198, 0, 0, Text))
    {
        Sleep, 1000
        Click, 1162, 135 Left, 1
        Sleep, 2000

    }Else{

        ; Legendry Hunt
        Text:="|<>*119$16.k0C00M01U067zsTzVzy7zsTzVzy7zs07U0C00s03Vzy7zsTzVzy7zsTzVzy00s01U0600TzzU"

        if (ok:=FindText(X, Y, 81, 153, 107, 192, 0, 0, Text))
        {
            Sleep, 1000
            Click, 1162, 135 Left, 1
            Sleep, 2000

        }Else{
            Goto , main_menu_loaded_check_start
        }
    }

    ; 0
    Text:="|<>*119$28.zzzzzz00TzU00Tw000zU001w0003k00060Ty0M3zw1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM3zw1U7zk70000Q0003s000Tk003zU00Tzk07zzzzzs"

    if (ok:=FindText(X, Y, 625, 310, 676, 370, 0, 0, Text))
    {
        Click, 578, 501 Left, 1
        Sleep, 1000
        Send, {Escape}
    }Else{
        ; 1
        Text:="|<>*113$17.zzzzkDy0Ds0T00s01U030060UA70MS0nw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs7zzy"

        if (ok:=FindText(X, Y, 627, 308, 671, 369, 0, 0, Text))
        {
            Click, 578, 501 Left, 1
            Sleep, 1000
            Send, {Escape}
        }Else{
            Send, {Escape}
            Sleep, 1000
        }
    }

ticket_check_end:

    Sleep, 1000

    Loop, 100{
        ; Normal hunt
        Text:="|<>*121$62.zzzzzzzzzzzsDzzVzy0DzU0TzkDz00Dk03zs3zk01w00Ty0zw00C3y3zU7z3y3VzkzsVzkzksTwDw8TwDwC7z3z37z3z3VzkzkkzkzksTzzsQDwDwC7zzy73z3z3VzzzVsTkzksTzzsy7wDsC7zzwDVz003Vzzz3wTk01sTzzkz3w01y7zzsTkz3sTVzky00Dky7sTwDU01wDky7z3s00T3wDVzkwDy7kzVsTsD3zUwDsS007kzwD3y3k01sTz3kzky00y7zkwDw7s0zVzyD3zVzzzzzzzzzzs"

        if (ok:=FindText(X, Y, 61, 147, 140, 198, 0, 0, Text))
        {
            Break
        }Else{
            ; Legendry Hunt
            Text:="|<>*119$16.k0C00M01U067zsTzVzy7zsTzVzy7zs07U0C00s03Vzy7zsTzVzy7zsTzVzy00s01U0600TzzU"

            if (ok:=FindText(X, Y, 81, 153, 107, 192, 0, 0, Text))
            {
                Break
            }
            Sleep, 100
        }
    }
    ; Normal hunt
    Text:="|<>*121$62.zzzzzzzzzzzsDzzVzy0DzU0TzkDz00Dk03zs3zk01w00Ty0zw00C3y3zU7z3y3VzkzsVzkzksTwDw8TwDwC7z3z37z3z3VzkzkkzkzksTzzsQDwDwC7zzy73z3z3VzzzVsTkzksTzzsy7wDsC7zzwDVz003Vzzz3wTk01sTzzkz3w01y7zzsTkz3sTVzky00Dky7sTwDU01wDky7z3s00T3wDVzkwDy7kzVsTsD3zUwDsS007kzwD3y3k01sTz3kzky00y7zkwDw7s0zVzyD3zVzzzzzzzzzzs"

    if (ok:=FindText(X, Y, 61, 147, 140, 198, 0, 0, Text))
    {
        ; race button click
        Click, 1160, 644 Left, 1
        Sleep, 1000
    }Else{
        ; Legendry Hunt
        Text:="|<>*119$16.k0C00M01U067zsTzVzy7zsTzVzy7zs07U0C00s03Vzy7zsTzVzy7zsTzVzy00s01U0600TzzU"

        if (ok:=FindText(X, Y, 81, 153, 107, 192, 0, 0, Text))
        {
            ; race button click
            Click, 1160, 644 Left, 1
            Sleep, 1000
        }
        Else{
            Goto , main_menu_loaded_check_start
        }
    }
    ; car selection screen check
    Loop, 10{

        Text:="|<>*131$43.zzzzzzzz07zXzsy00zkzwC00DsTy6003w7z31z1y1zVVzkz0zkkzsTUDsMTwDk7wADy7s1y67z3w0z33zVy4DVVzkz23kkzsTVVsMTwDkkQADy7sQC67z3wD333zVy7VVVzkz3sEkzsTVw0MTwDkz0ADy7sTU67z3wDs31z1y7y1U00z3z0s00zVzkS00zkzsDk1zszyDzzzzzzz"

        if (ok:=FindText(X, Y, 307, 113, 365, 153, 0, 0, Text))
        {
            Break
        }Else{
            Sleep, 1000
        }

    }
random_select:

    ; car selection screen check to select car
    Text:="|<>*131$43.zzzzzzzz07zXzsy00zkzwC00DsTy6003w7z31z1y1zVVzkz0zkkzsTUDsMTwDk7wADy7s1y67z3w0z33zVy4DVVzkz23kkzsTVVsMTwDkkQADy7sQC67z3wD333zVy7VVVzkz3sEkzsTVw0MTwDkz0ADy7sTU67z3wDs31z1y7y1U00z3z0s00zVzkS00zkzsDk1zszyDzzzzzzz"

    if (ok:=FindText(X, Y, 307, 113, 365, 153, 0, 0, Text))
    {
        ; car selection start
        WinActivate, Asphalt 9: Legends
        Sleep, 250
        Click , 880, 293, 0
        Sleep , 2000
        Loop , 200
        {
            Click , WheelUp, 1
            Sleep , 15
        }
        Click, 338, 389 Left, 1
        reselect_car:
            Sleep , 2500
            IniRead, maxcars, %myinipath%, HUNT, max_cars
            Random , selectedcar, 1, maxcars
            IniRead, currcar, %myinipath%, HUNT, car_%selectedcar%

            If (currcar > 0){
                Loop, %currcar%{
                    Send, {PgDn 1}
                    Sleep, 250
                }
            }Else{
                Goto, reselect_car
            }
            ; car selection end

        }Else{
            Goto , main_menu_loaded_check_start
        }

        Sleep, 1000

        hunt_play_button:
            ; td check start
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 897, 647, 916, 677, 0xC0F712, 0, Fast RGB
            If (ErrorLevel = 0)
            {
                Sleep, 500
                Click, 858, 657 Left, 1
                Sleep, 1000
            }
            ; td check end

            ; re select random car if the car is on refueling or locked
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 1200, 630, 1214, 657, 0xFFFFFF, 0, Fast RGB
            If (ErrorLevel = 0)
            {
                Sleep, 1000
                Send, {Escape}
                Sleep, 4000
                Goto, random_select
            }
            Else
            {
                ; upgrade text color check to verify car selection screen
                CoordMode, Pixel, Screen
                PixelSearch, FoundX, FoundY, 114, 628, 151, 656, 0x0D2240, 0, Fast RGB
                If (ErrorLevel = 0)
                {
                    ; click on play button to start the race
                    Sleep, 150
                    Click, 1183, 634 Left, 1
                    Sleep, 250
                }
                else
                {
                    Sleep, 2000
                    IfWinExist, Asphalt 9: Legends
                    {
                        WinActivate, Asphalt 9: Legends
                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                        WinRestore, Asphalt 9: Legends
                    }
                    else
                    {
                        ToolTip, play buttton, 640, 0,
                        Sleep, 1000
                        Goto, script_start
                    }

                    Goto, script_start
                }
            }

            Sleep, 5000

        hunt_Space_loop_in_race_start:

            Sleep, 1000

            Text:="|<>*127$64.00000000000k1UTwA0Azz7UC3zsw1nzyS0sDzVkDDztw3Us07Us3k7sC3U0C7UD0TUsC00wQ0w1z3Us01nU3k7wC3U07i0D0SssC00Dk0w1vXUzw0z03k7bC3zk1s0D0SQsDz0Dk0w1svUs00z03k7Xy3U07i0D0S7sC00Qs0w1sTUs03lk3k7Uy3U0C70D0S1sC01sC0w1s7Uzy70w3k7UC3zsw1kD0A0sDzXU70Q000000000008"

            if (ok:=FindText(X, Y, 1001, 621, 1079, 656, 0, 0, Text))
            {
                Sleep, 300
                Click, 1176, 645 Left, 1
                Sleep, 1000
            } Else
            {

                ; nitro x2 bottle left

                Text:="|<>*155$28.zzzzzzzDzzzsDzzzkzzzs3zzy0zzzs1zzz03zzw0DzzU0zzy03zzk0SDz01UDsCS0TUa9lw2Nb7k4bwS0EzXs0XsT04D3w0GMTk2NXy09W0Q1zs1w1zzzw7zzzyzzzzzzzy"

                if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
                {
                    Send, {Left 5}
                    Goto, hunt_barrel_ramp_nitro_end
                }

                ; nitro x2 bottle right

                Text:="|<>*155$28.zzzzzzzDzzzsDzzzkzzzs3zzy0zzzs1zzz03zzw0DzzU0zzy03zzk0SDz01UDsCS0TUa9lw2Nb7k4bwS0EzXs0XsT04D3w0GMTk2NXy09W0Q1zs1w1zzzw7zzzyzzzzzzzy"

                if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
                {
                    Send, {Right 5}
                    Goto, hunt_barrel_ramp_nitro_end
                }

                ; nitro blue left

                Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"

                if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
                {
                    Send, {Left 5}
                    Goto, hunt_barrel_ramp_nitro_end
                }

                ; nitro blue right

                Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"

                if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
                {
                    Send, {Right 5}
                    Goto, hunt_barrel_ramp_nitro_end
                }

                ; barrel left

                Text:="|<>*142$23.zzzzzzxzzzvzzznzzz7zzyDzzsDzzkTzz0Tzy0zzs0zzU1zy03zs07z00Ds00S002k005k00PU01rU0DjU0zTU7yzU01zzzz"

                if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
                {
                    Send, {Left 5}
                    Goto, hunt_barrel_ramp_nitro_end
                }

                ; barrel right

                Text:="|<>*167$23.zzzzyzzzxzzznzzzbzzy7zzwDzzkDzzUTzz0Tzw0Tzs0TzU0TzU0Ty00Dw003t000m001q007C00DT00wz03w00DzzzzU"

                if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
                {
                    Send, {Right 5}
                    Goto, hunt_barrel_ramp_nitro_end
                }

                ; ramp left

                Text:="|<>*147$26.zzzzzzzbzzzUzzzk7zzk0zzk07zs00zs007s001s006M003b003tk01yS01zbU1ztw1zyT0007s001zzzzs"

                if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
                {
                    Send, {Left 5}
                    Goto, hunt_barrel_ramp_nitro_end

                }

                ; ramp right

                Text:="|<>*147$26.zzzzzzzbzzzUzzzk7zzk0zzk07zs00zs007s001s006M003b003tk01yS01zbU1ztw1zyT0007s001zzzzs"

                if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
                {
                    Send, {Right 5}
                    Goto, hunt_barrel_ramp_nitro_end

                }

                ; switch to right route

                Text:="|<>*151$24.zzzzzzxzzzsTzzU7zz01zzs7zzs7zzs3zzs3zzk3zzU3zw07zk0Dz00Ty03zw07zs0Dzk0Tzk0Tzk0zzk0zzk0zzU0zzU0zzU0zzU0TzzzzzU"

                if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
                {
                    Send, {Right 5}
                    Goto, hunt_barrel_ramp_nitro_end
                }
                hunt_barrel_ramp_nitro_end:

                    ; Sleep, 1000

                    ; almost end
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 668, 61, 800, 98, 0xFFFF00, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Send, {Space 2}
                    }
                    Else
                    {
                        ; mid
                        CoordMode, Pixel, Screen
                        PixelSearch, FoundX, FoundY, 554, 59, 667, 97, 0xFFFF00, 0, Fast RGB
                        If (ErrorLevel = 0)
                        {
                            Send, {Space}
                            Sleep, 1000
                            Send, {Space}
                        }
                        Else
                        {
                            ; start
                            CoordMode, Pixel, Screen
                            PixelSearch, FoundX, FoundY, 437, 62, 555, 97, 0xFFFF00, 0, Fast RGB
                            If (ErrorLevel = 0)
                            {
                                Send, {Space 2}
                            }
                            else
                            {
                                ; shockwave
                                Send, {Space 2}

                            }
                        }
                    }

                    ; Sleep, 1000

                    ; you have been disconnected from server start
                    ; still disconnected
                    Text:="|<>*117$71.7z7zUzkzwQ00DwDz0zVzks00TsTw1zXzVk00zkzs3z3z3VzlzVzl7y7wD3zXz3zW7yDsS7z7y7y4DwDkwDyDwDwQTsTXsTwTsTssTky7kzszkzVkzlwDVzk01z3lzXsT00U03yDXz3ly01007wT3y7Xw02DwDky7yC7sTwTsTVyDwQDkzszkz00DsMzVzlzVw00Tklz3zXz3s00zl3y7z7y7lzlzWDwDyDwDXzVz0TsTwTsS7z3z0zk00zkwDz7y1zU01zVszy7w7z00E"

                    if (ok:=FindText(X, Y, 331, 103, 410, 128, 0, 0, Text))
                    {
                        Sleep, 2500
                        Goto, script_start
                    }
                    ; you have been disconnected from server end

                    ; no internet {Retry}
                    Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"

                    if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text))
                    {
                        Sleep, 1000
                        Click, 693, 500 Left, 1
                        Sleep, 2500
                        Goto, script_start
                    }

                    ; token color check to verify home screen

                    Text:="|<>*72$29.zzrzzzy3zzzs3zzz01zzw01zzk00zy000zs0k0z03k0Q07k0E0Tk0E0nU1U37U3067070Tz0S1zy0w3zy1wA0S7sM0QDk000Tk001zU003z0007z000Ty000zw001y"

                    if (ok:=FindText(X, Y, 787, 42, 823, 80, 0, 0, Text))
                    {
                        Goto , main_menu_loaded_check_start
                    }

                    ; where to get bps screen

                    Text:="|<>*160$32.zzzzzyTzzyD3zzz3UTzzUy3zzkTkTzsDy3zw7zUTy3zw3z1zzkTUzzy3kTzzkMDzzy07zzzU3zzzw1zzzzUTzzzk3zzzs0Tzzw43zzy3UTzz1y3zzUzkTzkTy3zsDzkTw7zw3y3zzkT1zzy3UzzzkQTzzyDjzzzrzzzzzs"

                    if (ok:=FindText(X, Y, 1142, 92, 1188, 136, 0, 0, Text))
                    {
                        Click, 1163, 116 Left, 1
                        Goto , main_menu_loaded_check_start
                    }

                    ; TD check in race
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 208, 133, 244, 150, 0xFE0101, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Send, {Tab}
                    }

                    ; Resume
                    Text:="|<>*152$13.zzTzzzzzvU1k0s0Q0C0703ztzwzyQ0C0703U1k0s0Q0D07zzzzzyU"

                    if (ok:=FindText(X, Y, 1130, 227, 1150, 257, 0, 0, Text))
                    {
                        Send, {Escape}
                    }

                    ; connecting to the server mp start
                    Loop, 60
                    {

                        Text:="|<>*71$43.zzzzzzzs0Dzzzzs00zzzzw00Dzzzy007zzzz3z3zzzzVzkzzzzkzsTzzzsTwDzzzwDy7zzzy7z3zzzz3zVzzzzVzUzzzzkTUzzzzs00Tzzzw00Tzzzy00zzzzz1sTzzzzVw7zzzzkz3zzzzsTUzzzzwDsTVsS67w7kwD33z3sS7VVzUwD3kkzsS7VsQTwD3kwDzzzzzzy"

                        if (ok:=FindText(X, Y, 578, 624, 628, 658, 0, 0, Text))
                        {
                            Sleep, 1000
                        }
                        else
                        {
                            Break
                        }
                    }
                    Text:="|<>*71$43.zzzzzzzs0Dzzzzs00zzzzw00Dzzzy007zzzz3z3zzzzVzkzzzzkzsTzzzsTwDzzzwDy7zzzy7z3zzzz3zVzzzzVzUzzzzkTUzzzzs00Tzzzw00Tzzzy00zzzzz1sTzzzzVw7zzzzkz3zzzzsTUzzzzwDsTVsS67w7kwD33z3sS7VVzUwD3kkzsS7VsQTwD3kwDzzzzzzy"

                    if (ok:=FindText(X, Y, 578, 624, 628, 658, 0, 0, Text))
                    {
                        Goto, script_start
                    }
                    ; connecting to the server mp end

                    IfWinExist, Asphalt 9: Legends
                    {
                        WinActivate, Asphalt 9: Legends
                        Sleep, 250
                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                        WinRestore, Asphalt 9: Legends
                    }
                    else
                    {
                        ToolTip, spaceloop end, 640, 0,
                        Sleep, 1000
                        Goto, script_start
                    }
                    ; GOTO hunt spaceloop start
                    Goto, hunt_Space_loop_in_race_start
                }

                hunt_Space_loop_in_race_end:

                    Sleep, 1000

                hunt_rewards_skip_start:

                    Sleep, 1000

                    Loop,30{
                        Text:="|<>*153$70.000000000001s1sDzls1tzzbU7Uzz3k7bzyT0S3zwD0wTztw1sC00S3k3k7s7Us00sS0D0TkS3U03ls0w1z1sC007D03k7y7Us00Sw0D0SsS3U00zU0w1vlsDzU3w03k7b7Uzy07k0D0SSS3zs0z00w1stsC003y03k7XrUs00Ts0D0S7y3U01vk0w1sDsC00D703k7UzUs00wS0D0S1y3U07Us0w1s7sC00S3k3k7UDUzy3kD0D0S0y3zwD0S0w1s1sDzls0w3k3030zz701U60000000000002"

                        if (ok:=FindText(X, Y, 1107, 631, 1187, 670, 0, 0, Text))
                        {
                            Sleep, 1000
                            Click, 1211, 643 Left, 1
                            Sleep, 1000
                            Goto, hunt_rewards_skip_end
                            Break
                        }Else{

                            IfWinExist, Asphalt 9: Legends
                            {
                                WinActivate, Asphalt 9: Legends
                                WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                WinRestore, Asphalt 9: Legends
                            }
                            else
                            {
                                ToolTip, rewards skip start, 640, 0,
                                Sleep, 1000
                                Goto, script_start
                            }
                            Sleep, 1000
                            Click, 1211, 643 Left, 1
                            Sleep, 1000
                            ; goto, hunt_rewards_skip_start
                        }
                    }

                    Text:="|<>*121$62.zzzzzzzzzzzsDzzVzy0DzU0TzkDz00Dk03zs3zk01w00Ty0zw00C3y3zU7z3y3VzkzsVzkzksTwDw8TwDwC7z3z37z3z3VzkzkkzkzksTzzsQDwDwC7zzy73z3z3VzzzVsTkzksTzzsy7wDsC7zzwDVz003Vzzz3wTk01sTzzkz3w01y7zzsTkz3sTVzky00Dky7sTwDU01wDky7z3s00T3wDVzkwDy7kzVsTsD3zUwDsS007kzwD3y3k01sTz3kzky00y7zkwDw7s0zVzyD3zVzzzzzzzzzzs"

                    if (ok:=FindText(X, Y, 61, 147, 140, 198, 0, 0, Text))
                    {
                        Sleep, 250
                    }Else{
                        Goto, script_start
                    }

                hunt_rewards_skip_end:

                    Goto, race_screen_check

                hunt_ended:

                    ; <======================== Hunt ended ==============================>

                    ; Goto, main_menu_loaded_check_start
                ExitApp
                ^p:: Pause
                ^q::
                    SoundSet, 0, , mute
                ExitApp

                ; <========================================>

                ;  Example 1: FindText(X:="wait", Y:=3, 0,0,0,0,0,0,Text)   ; Wait 3 seconds for appear
                ;  Example 2: FindText(X:="wait0", Y:=-1, 0,0,0,0,0,0,Text) ; Wait indefinitely for disappear
                ;--------------------------------

                FindText(ByRef x:="FindTextClass", ByRef y:="", args*)
                {
                    global FindTextClass
                    if (x=="FindTextClass")
                        return FindTextClass
                    else
                        return FindTextClass.FindText(x, y, args*)
                }
                Class FindTextClass
                {

                    static bind:=[], bits:=[], Lib:=[], Cursor:=0

                    __New()
                    {
                        this.bind:=[], this.bits:=[], this.Lib:=[], this.Cursor:=0
                    }

                    __Delete()
                    {
                        if (this.bits.hBM)
                            DllCall("DeleteObject", "Ptr",this.bits.hBM)
                    }

                    FindText(ByRef OutputX:="", ByRef OutputY:=""
                    , x1:=0, y1:=0, x2:=0, y2:=0, err1:=0, err0:=0
                    , text:="", ScreenShot:=1, FindAll:=1
                    , JoinText:=0, offsetX:=20, offsetY:=10, dir:=1)
                    {
                        local
                        if RegExMatch(OutputX, "i)^\s*wait[10]?\s*$")
                        {
                            found:=!InStr(OutputX,"0"), time:=OutputY
                            , timeout:=A_TickCount+Round(time*1000)
                            , OutputX:=OutputY:=""
                            Loop
                            {
                                ; Wait for the image to remain stable
                                While (ok:=this.FindText(OutputX, OutputY
                                    , x1, y1, x2, y2, err1, err0, text, ScreenShot, FindAll
                                , JoinText, offsetX, offsetY, dir)) and (found)
                                {
                                    v:=ok[1], x:=v[1], y:=v[2], w:=v[3], h:=v[4]
                                    hash:=this.GetPicHash(x, y, x+w-1, y+h-1, 0)
                                    Sleep, 10
                                    if (hash=this.GetPicHash(x, y, x+w-1, y+h-1, 1))
                                        return ok
                                }
                                if (!found and !ok)
                                    return 1
                                if (time>=0 and A_TickCount>=timeout)
                                    Break
                                Sleep, 100
                            }
                            return 0
                        }
                        SetBatchLines, % (bch:=A_BatchLines)?"-1":"-1"
                            centerX:=Round(x1+x2)//2, centerY:=Round(y1+y2)//2
                            if (x1*x1+y1*y1+x2*x2+y2*y2<=0)
                                n:=150000, x:=y:=-n, w:=h:=2*n
                            else
                                x:=Min(x1,x2), y:=Min(y1,y2), w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
                            bits:=this.GetBitsFromScreen(x,y,w,h,ScreenShot,zx,zy,zw,zh)
                            , x-=zx, y-=zy, info:=[], this.ok:=0
                            Loop Parse, text, |
                                if IsObject(j:=this.PicInfo(A_LoopField))
                                info.Push(j)
                            if (w<1 or h<1 or !(num:=info.Length()) or !bits.Scan0)
                            {
                                SetBatchLines, %bch%
                                return 0
                            }
                            arr:=[], info2:=[], k:=0, s:=""
                            , mode:=(IsObject(JoinText) ? 2 : JoinText ? 1 : 0)
                            For i,j in info
                            {
                                k:=Max(k, j[2]*j[3]), v:=(mode=1 ? i : j[11])
                                if (mode and v!="")
                                    s.="|" v, (!info2[v] && info2[v]:=[]), info2[v].Push(j)
                            }
                            JoinText:=(mode=1 ? [s] : JoinText)
                            , VarSetCapacity(s1, k*4), VarSetCapacity(s0, k*4)
                            , VarSetCapacity(ss, 2*(w+2)*(h+2))
                            , FindAll:=(dir=9 ? 1 : FindAll)
                            , allpos_max:=(FindAll or JoinText ? 10240 : 1)
                            , ini:={sx:x, sy:y, sw:w, sh:h, zx:zx, zy:zy, zw:zw, zh:zh
                                , mode:mode, bits:bits, ss:&ss, s1:&s1, s0:&s0
                            , allpos_max:allpos_max}
                            Loop 2
                            {
                                if (err1=0 and err0=0) and (num>1 or A_Index>1)
                                    err1:=0.05, err0:=0.05
                                ini.err1:=err1, ini.err0:=err0
                                if (!JoinText)
                                {
                                    VarSetCapacity(allpos, allpos_max*8)
                                    For i,j in info
                                        Loop % this.PicFind(ini, j, dir, allpos
                                        , ini.sx, ini.sy, ini.sw, ini.sh)
                                    {
                                        x:=NumGet(allpos, 8*A_Index-8, "uint") + zx
                                        , y:=NumGet(allpos, 8*A_Index-4, "uint") + zy
                                        , w:=j[2], h:=j[3], comment:=j[11]
                                        , arr.Push({1:x, 2:y, 3:w, 4:h, x:x+w//2, y:y+h//2, id:comment})
                                        if (!FindAll)
                                            Break, 3
                                    }
                                }
                                else
                                    For k,v in JoinText
                                {
                                    v:=RegExReplace(v, "\s*\|[|\s]*", "|")
                                    , v:=StrSplit(Trim(v,"|"), (InStr(v,"|")?"|":""), " `t")
                                    , this.JoinText(ini, arr, info2, v, offsetX, offsetY, FindAll
                                    , 1, v.Length(), dir, 0, 0, ini.sx, ini.sy, ini.sw, ini.sh)
                                    if (!FindAll and arr.Length())
                                        Break, 2
                                }
                                if (err1!=0 or err0!=0 or arr.Length()
                                    or info[1][8]=5 or info[1][12])
                                Break
                            }
                            if (dir=9)
                                arr:=this.Sort2(arr, centerX, centerY)
                            SetBatchLines, %bch%
                            if (arr.Length())
                            {
                                OutputX:=arr[1].x, OutputY:=arr[1].y, this.ok:=arr
                                return arr
                            }
                        return 0
                    }

                    ; the join text object <==> [ "abc", "xyz", "a1|a2|a3" ]

                    JoinText(ini, arr, info2, text, offsetX, offsetY, FindAll
                    , index:="", Len:="", dir:="", minY:="", maxY:=""
                    , sx:="", sy:="", sw:="", sh:="")
                    {
                        VarSetCapacity(allpos, ini.allpos_max*8)
                        For i,j in info2[text[index]]
                            if (ini.mode=1 or text[index]==j[11])
                            Loop % this.PicFind(ini, j, dir, allpos, sx, sy
                            , (index=1 ? sw : Min(sx+offsetX+j[2],ini.sx+ini.sw)-sx), sh)
                        {
                            x:=NumGet(allpos, 8*A_Index-8, "uint")
                            , y:=NumGet(allpos, 8*A_Index-4, "uint"), w:=j[2], h:=j[3]
                            , (index=1) && (ini.x:=x, minY:=y, maxY:=y+h)
                            if (index<Len)
                            {
                                if this.JoinText(ini, arr, info2, text, offsetX, offsetY, FindAll
                                    , index+1, Len, 5, (y1:=Min(y,minY)), (y2:=Max(y+h,maxY)), x+w
                                , (y:=Max(y1-offsetY,ini.sy)), 0, Min(y2+offsetY,ini.sy+ini.sh)-y)
                                and (index>1 or !FindAll)
                                return 1
                            }
                            else
                            {
                                comment:=""
                                For k,v in text
                                    comment.=(ini.mode=1 ? info2[v][1][11] : v)
                                w:=x+w-ini.x, x:=ini.x+ini.zx
                                , h:=Max(y+h,maxY)-Min(y,minY), y:=Min(y,minY)+ini.zy
                                , arr.Push({1:x, 2:y, 3:w, 4:h, x:x+w//2, y:y+h//2, id:comment})
                                if (index>1 or !FindAll)
                                    return 1
                            }
                        }
                    }

                    PicFind(ini, j, dir, ByRef allpos, sx, sy, sw, sh)
                    {
                        local
                        static MyFunc:=""
                        if (!MyFunc)
                        {
                            x32:=""
                            . "5557565383EC6C8BAC248000000083FD050F84DB0800008B8424C4000000C744"
                            . "24100000000085C00F8E6B0D000031FF31C089AC2480000000C744240C000000"
                            . "0031C9C744241800000000897C241489C58B5C24148BBC24C00000008B742418"
                            . "8B54241001DF89D829DE8B9C24C000000003B424BC00000085DB7E68897C2404"
                            . "89EB89D7EB248D76008DBC27000000008BAC24B800000083C70483C00189548D"
                            . "0083C10139442404742D83BC24800000000389FA0F45D0803C063175D38BAC24"
                            . "B400000083C70483C00189549D0083C3013944240475D38BB424C00000000174"
                            . "241889DD8344240C018BBC24A80000008B44240C017C24148B9C249400000001"
                            . "5C2410398424C40000000F8541FFFFFF896C240C8BAC2480000000894C241031"
                            . "C08B74240C39B424C80000008B7C24100F4DF039BC24CC0000008974240C0F4C"
                            . "C739C6894424100F4DC683FD03894424040F84AF0800008B8424940000008BB4"
                            . "24A00000000FAF8424A4000000C1E6028974243801F08BB42494000000894424"
                            . "348B8424A8000000F7D885ED8D0486894424240F858B0300008B842484000000"
                            . "C744242000000000C744242800000000C1E8100FB6E88B8424840000000FB6C4"
                            . "894424140FB6842484000000894424188B8424A8000000C1E002894424308B84"
                            . "24AC00000085C00F8EC70000008B7C24088B442434896C241C8BAC24A8000000"
                            . "85ED0F8E8E0000008BB424900000008B6C242803AC24B000000001C603442430"
                            . "8944242C0384249000000089442408900FB67E028B4C241C0FB6160FB646012B"
                            . "5424182B44241489FB01CF29CB8D8F000400000FAFC00FAFCBC1E00B0FAFCBBB"
                            . "FE05000029FB0FAFDA01C10FAFD301CA399424880000000F93450083C60483C5"
                            . "013B74240875A98B9C24A8000000015C24288B44242C8344242001034424248B"
                            . "74242039B424AC0000000F8549FFFFFF897C24088B8424A80000002B8424C000"
                            . "0000C644244F00C644244E00C744245400000000C74424600000000089442458"
                            . "8B8424AC0000002B8424C40000008944243C8B84248C00000083E80183F8070F"
                            . "87D005000083F803894424440F8ECB0500008B4424608B742454894424548974"
                            . "24608B742458397424540F8F760A00008B4424588B74240CC744243000000000"
                            . "8944245C8B8424B40000008D04B08B7424448944245089F083E0018944244889"
                            . "F08BB4249000000083E003894424648B4424608B7C243C39F80F8F7F01000083"
                            . "7C2464018B5C24540F4F5C245C897C242C89442420895C24408DB42600000000"
                            . "8B7C24488B44242C85FF0F44442420837C244403894424240F8FD2020000807C"
                            . "244E008B442440894424288B4424280F85DA020000807C244F000F8580030000"
                            . "0FAF8424A80000008B5424048B5C242485D28D2C180F8E840000008BBC24CC00"
                            . "00008B9424B000000031C08B9C24C8000000896C24348B4C240C8974241C01EA"
                            . "897C24188B6C24048B7C2410895C241439C17E1C8B9C24B40000008B348301D6"
                            . "803E00750B836C2414010F886004000039C77E1C8B9C24B80000008B348301D6"
                            . "803E00740B836C2418010F884004000083C00139E875B98B6C24348B74241C8B"
                            . "44240C85C074278BBC24B00000008B8424B40000008B5C24508D0C2F8D742600"
                            . "8B1083C00401CA39D8C6020075F28B442424038424A00000008B5C24308BBC24"
                            . "D00000008904DF8B442428038424A40000008944DF0483C3013B9C24D4000000"
                            . "895C24307D308344242001836C242C018B4424203944243C0F8DA2FEFFFF8344"
                            . "245401836C245C018B442454394424580F8D59FEFFFF8B44243083C46C5B5E5F"
                            . "5DC2580083FD010F849507000083FD020F84F90400008B8424840000000FB6BC"
                            . "2484000000C744242C00000000C744243000000000C1E8100FB6D08B84248400"
                            . "000089D50FB6DC8B842488000000C1E8100FB6C88B84248800000029CD01D189"
                            . "6C243C89DD894C24140FB6F40FB684248800000029F501DE896C241889FD8974"
                            . "241C29C501F8894424288B8424A8000000896C2420C1E002894424388B8424AC"
                            . "00000085C00F8EE9FCFFFF8B4C24348B6C243C8B8424A800000085C00F8E8F00"
                            . "00008B8424900000008B542430039424B000000001C8034C243889CF894C2434"
                            . "03BC2490000000EB3B8DB42600000000395C24147C3D394C24187F37394C241C"
                            . "7C3189F30FB6F3397424200F9EC3397424280F9DC183C00483C20121D9884AFF"
                            . "39C7741E0FB658020FB648010FB63039DD7EBD31C983C00483C201884AFF39C7"
                            . "75E28BB424A8000000017424308B4C24348344242C01034C24248B44242C3984"
                            . "24AC0000000F8548FFFFFFE924FCFFFF8B442424807C244E00894424288B4424"
                            . "40894424248B4424280F8426FDFFFF0FAF8424940000008B5C24048B4C242485"
                            . "DB8D2C880F8EE4FDFFFF8BBC24C800000031C9896C241489F68DBC2700000000"
                            . "8B8424B40000008B5C2414031C888B8424B80000008B2C880FB6441E0289EAC1"
                            . "EA100FB6D229D00FB6541E010FB61C1E0FAFC03B4424087F2789E80FB6C429C2"
                            . "0FAFD23B5424087F1789E80FB6C029C30FAFDB3B5C24087E108DB42600000000"
                            . "83EF010F887701000083C1013B4C2404758E89AC2484000000E950FDFFFF6690"
                            . "0FAF8424940000008B4C24248D048889442414038424840000000FB64C06010F"
                            . "B67C06020FB60406894C24188B4C24048944241C85C90F8E12FDFFFF8B8424CC"
                            . "00000031DB894424388B8424C8000000894424348B442408897C24088D742600"
                            . "395C240C7E658B8424B40000008B4C24148B7C2408030C980FB6440E020FB654"
                            . "0E010FB60C0E2B5424182B4C241C89C501F829FD8DB8000400000FAFD20FAFFD"
                            . "C1E20B0FAFFDBDFE05000029C50FAFE901FA0FAFCD01D1398C2488000000730B"
                            . "836C2434010F88A1000000395C24107E618B8424B80000008B4C24148B7C2408"
                            . "030C980FB6440E020FB6540E010FB60C0E2B5424182B4C241C89C501F829FD8D"
                            . "B8000400000FAFD20FAFFDC1E20B0FAFFDBDFE05000029C50FAFE901FA0FAFCD"
                            . "01D1398C24880000007207836C243801783A83C3013B5C24040F8521FFFFFF89"
                            . "442408E906FCFFFF908DB426000000008B74241CE92DFCFFFF8DB42600000000"
                            . "89AC2484000000E91AFCFFFF89442408E911FCFFFFC7442444000000008B4424"
                            . "3C8B742458894424588974243CE930FAFFFF8B84248800000031FF89AC248000"
                            . "00008BB424BC00000031D289FD894424048B8424840000000FAFC08944240831"
                            . "C0EB18B90A0000006BFA0AF7E189D9C1FB1F01FA01C811DA83C6010FBE0E85C9"
                            . "744A8D59D083FB0976D983F92F75E989D389C10FB7C00FACD9108B9C24B40000"
                            . "008D3CAD000000000FB7C90FAF8C24940000008D04818904AB8B9C24B8000000"
                            . "83C50131C089143B31D2EBAC8BAC248000000083FD058B8424A80000000F9444"
                            . "244E83FD030F9444244F038424A00000002B8424C0000000894424588B8424A4"
                            . "000000038424AC0000002B8424C40000008944243C8B8424A4000000C78424A4"
                            . "00000000000000894424548B8424A0000000C78424A000000000000000894424"
                            . "60E9ECF8FFFF8B8424840000000FB7942484000000C1E8100FAF842494000000"
                            . "8D049089842484000000E964FFFFFF8B8424A80000008BB424A40000000FAF84"
                            . "24AC00000083EE01038424B0000000897424148944241C8B8424A80000000384"
                            . "24A0000000894424208B8424A4000000038424AC00000039F00F8C0A0100008B"
                            . "B424A000000083C0012BAC24A00000008944242C8B442420C744242800000000"
                            . "83EE01897424308B74241401C50FAFB424940000008D7801896C243489742424"
                            . "8B442430394424200F8C9D0000008B4C24148B5C24248B742428035C24382BB4"
                            . "24A0000000039C2490000000C1E91F0374241C894C2418EB528DB42600000000"
                            . "398424980000007E4B807C24180075448B4C2414398C249C0000007E370FB64B"
                            . "FE0FB653FD83C3040FB66BF86BD24B6BC92601D189EAC1E20429EA01CAC1FA07"
                            . "8854060183C00139F8741889C2C1EA1F84D274ACC64406010083C00183C30439"
                            . "F875E88B7424340174242883442414018B9C24940000008B442414015C242439"
                            . "44242C0F8537FFFFFF8B8424A80000008B8C24AC00000083C00285C989442420"
                            . "0F8E0EF7FFFF8B8424AC0000008B6C241C036C2420C744241C01000000C74424"
                            . "240000000083C001894424288B8424A8000000896C241883C0048944242C8B84"
                            . "24880000008B9424A800000085D20F8EA70000008B4424188B5C24248B74242C"
                            . "039C24B000000089C12B8C24A800000089C201C6894C2414908DB42600000000"
                            . "0FB642010FB62ABF010000000384248400000039E8723D0FB66A0239E872358B"
                            . "4C24140FB669FF39E872290FB66EFF39E872210FB669FE39E872190FB62939E8"
                            . "72120FB66EFE39E8720A0FB63E39F80F92C189CF89F9834424140183C201880B"
                            . "83C60183C3018B7C2414397C241875908BBC24A8000000017C24248344241C01"
                            . "8B5C24208B74241C015C2418397424280F852FFFFFFF89842488000000E9F2F5"
                            . "FFFF8B8424840000008BB424AC00000031EDC74424180000000083C001C1E007"
                            . "898424840000008B8424A8000000C1E00285F68944241C0F8EB7F5FFFF896C24"
                            . "148B4424348BAC24840000008B9C24A800000085DB7E638B8C24900000008B5C"
                            . "2418039C24B000000001C10344241C894424200384249000000089C78D742600"
                            . "0FB651020FB641010FB6316BC04B6BD22601C289F0C1E00429F001D039C50F97"
                            . "0383C10483C30139F975D58BBC24A8000000017C24188B442420834424140103"
                            . "4424248B74241439B424AC0000000F8578FFFFFFE91BF5FFFFC744240C000000"
                            . "00E979F3FFFFC744243000000000E963F7FFFF90909090909090909090909090"
                            x64:=""
                            . "4157415641554154555756534881EC88000000488BBC24F0000000488BB42430"
                            . "01000083F90589542468448944240844898C24E8000000488B9C243801000048"
                            . "8BAC24400100000F84300900008B8424580100004531ED4531E485C00F8EDC00"
                            . "000044897C240C448BBC245001000031D231C04889BC24F00000004889B42430"
                            . "0100004531F64531ED4531E4C704240000000089D789C6660F1F840000000000"
                            . "4585FF7E6548631424478D1C374489F048039424480100004189F8EB1F0F1F00"
                            . "83C0014D63D54183C0044183C5014883C2014139C346894C9500742A83F90345"
                            . "89C1440F45C8803A3175D583C0014D63D44183C0044183C4014883C2014139C3"
                            . "46890C9375D644013C2483C6014403B4242001000003BC24F800000039B42458"
                            . "0100000F8577FFFFFF448B7C240C488BBC24F0000000488BB4243001000031C0"
                            . "4439A42460010000440F4DE04439AC2468010000440F4DE84539EC4589EE450F"
                            . "4DF483F9030F848A0800008B8424F80000008B9424100100000FAF8424180100"
                            . "008D04908B9424F8000000894424208B842420010000F7D885C98D0482890424"
                            . "0F85C40300008B4C24684889C84189CB0FB6C441C1EB1089C20FB6C1450FB6DB"
                            . "4189C28B84242801000085C00F8E370100008B842420010000448964242831C9"
                            . "44896C24304889B42430010000448B6C2420448B6424088BB42420010000C1E0"
                            . "0244897424184889BC24F00000004889AC24400100004189CEC744240C000000"
                            . "008944241089D748899C24380100004489D585F60F8E8A000000488B9C24F000"
                            . "00004963C54531D24C8D4C030248635C240C48039C2430010000660F1F440000"
                            . "450FB639410FB651FE410FB641FF29EA4489F94501DF4189D0418D9700040000"
                            . "4429D929F80FAFD10FAFC00FAFD1C1E00B8D0402BAFE0500004429FA410FAFD0"
                            . "410FAFD001D04139C4420F9304134983C2014983C1044439D67FA544036C2410"
                            . "0174240C4183C60144032C244439B424280100000F8558FFFFFF448B74241844"
                            . "8B642428448B6C2430488BBC24F0000000488BB42430010000488B9C24380100"
                            . "00488BAC24400100008B8424200100002B842450010000C644245700C644244C"
                            . "00C744246C00000000C744247800000000894424708B8424280100002B842458"
                            . "010000894424408B8424E800000083E80183F8070F870606000083F803894424"
                            . "480F8E010600008B4424788B4C246C8944246C894C24788B4C2470394C246C0F"
                            . "8F050B00008B4424708B4C244848899C24380100004889AC24400100004489ED"
                            . "4589E5C74424300000000089442474418D4424FF4C8BA42440010000488D4483"
                            . "044889F3488BB42438010000488944246089C883E0018944245089C883E00389"
                            . "44247C4489F04589FE4189C78B4424788B4C244039C80F8F3E010000837C247C"
                            . "018B54246C0F4F542474894C2428890424895424448B44245085C08B4424280F"
                            . "440424837C2448038944240C0F8FCF020000807C244C008B442444894424100F"
                            . "85D7020000807C2457000F85700300008B4C24100FAF8C2420010000034C240C"
                            . "4585FF7E59448B942468010000448B8C246001000031C0660F1F840000000000"
                            . "4139C589C27E184189C84403048642803C0300750A4183E9010F888500000039"
                            . "D57E1289CA41031484803C130074064183EA01786F4883C0014139C77FC24585"
                            . "ED741E4C8B4424604889F00F1F44000089CA03104883C0044C39C0C604130075"
                            . "EF8B4C24308B54240C039424100100004C8B94247001000089C801C048984189"
                            . "14828B54241003942418010000418954820489C883C0013B8424780100008944"
                            . "24307D2E83042401836C2428018B0424394424400F8DDBFEFFFF8344246C0183"
                            . "6C2474018B44246C394424700F8D9AFEFFFF8B4424304881C4880000005B5E5F"
                            . "5D415C415D415E415FC383F9010F844108000083F9020F84070500008B542468"
                            . "448B542408C744241000000000C74424180000000089D0440FB6C2C1E810440F"
                            . "B6C84889D00FB6CC4489D04589CBC1E810894C240C0FB6D04C89D00FB6C44129"
                            . "D34401CA89C18B44240C29C8034C240C89442430410FB6C24589C24129C24401"
                            . "C0448B8424280100008944240C8B842420010000C1E0024585C0894424280F8E"
                            . "05FDFFFF448974243C44896C244448899C2438010000448B742420448B6C2430"
                            . "8B9C242001000044897C243844896424404189CF4889AC24400100004189D444"
                            . "89D585DB7E784C635424184963C631D2488D4407024901F2EB37660F1F440000"
                            . "4539C47C3E4139CD7F394139CF7C344439CD410F9EC044394C240C0F9DC14883"
                            . "C0044421C141880C124883C20139D37E24440FB6000FB648FF440FB648FE4539"
                            . "C37EBD31C94883C00441880C124883C20139D37FDC4403742428015C24188344"
                            . "241001440334248B442410398424280100000F856AFFFFFF448B7C2438448B74"
                            . "243C448B642440448B6C2444488B9C2438010000488BAC2440010000E908FCFF"
                            . "FF8B44240C807C244C00894424108B4424448944240C0F8429FDFFFF8B442410"
                            . "8B4C240C0FAF8424F80000004585FF448D14880F8EA8FDFFFF448B8C24600100"
                            . "004531C04989DB660F1F840000000000428B1486438B1C844401D289D98D4202"
                            . "C1E9100FB6C948980FB6040729C88D4A014863D20FAFC00FB614174863C90FB6"
                            . "0C0F4439F07F1A0FB6C729C10FAFC94439F17F0D0FB6C329C20FAFD24439F27E"
                            . "0A4183E9010F88950100004983C0014539C77F9C895C24684C89DBE921FDFFFF"
                            . "8B4424108B4C240C0FAF8424F80000008D048889C1034424684585FF8D500248"
                            . "63D2440FB614178D500148980FB604074863D20FB614170F8EE4FCFFFF448B9C"
                            . "246801000048895C24584531C948897424184C8964242089CB89C64189D44489"
                            . "5C243C448B9C246001000044895C24384539CD4589C87E6E488B442418428B14"
                            . "8801DA8D42024898440FB634078D42014863D20FB6141748980FB604074589F3"
                            . "4501D6418D8E000400004529D329F2410FAFCB4429E00FAFC0410FAFCB41BBFE"
                            . "050000C1E00B4529F3440FAFDA01C8410FAFD301C239542408730B836C243801"
                            . "0F88A60000004439C57E6A488B442420428B148801DA8D42024898440FB63407"
                            . "8D42014863D20FB6141748980FB604074589F04501D6418D8E000400004529D0"
                            . "29F2410FAFC84429E00FAFC0410FAFC841B8FE050000C1E00B4529F0440FAFC2"
                            . "01C8410FAFD001C2395424087207836C243C0178374983C1014539CF0F8F0EFF"
                            . "FFFF488B5C2458488B7424184C8B642420E9ABFBFFFF662E0F1F840000000000"
                            . "895C24684C89DBE9D8FBFFFF488B5C2458488B7424184C8B642420E9C4FBFFFF"
                            . "C7442448000000008B4424408B4C247089442470894C2440E9FAF9FFFF8B4424"
                            . "68448B7424084531D24531DB4189C7440FAFF8488B842448010000EB0F4B8D14"
                            . "924D63C04D8D14504883C0010FBE1085D2745D448D42D04183F80976E083FA2F"
                            . "75E64C89D2450FB7CA4D63C348C1EA1049C1EA204183C3010FB7D20FAF9424F8"
                            . "000000428D148A4289148346895485004531D2EBB38B54246889D00FB7D2C1E8"
                            . "100FAF8424F80000008D04908944246883F9058B8424200100000F9444244C83"
                            . "F9030F94442457038424100100002B842450010000894424708B842418010000"
                            . "038424280100002B842458010000894424408B842418010000C7842418010000"
                            . "000000008944246C8B842410010000C78424100100000000000089442478E9C4"
                            . "F8FFFF8B8424200100008B9424180100000FAF842428010000448D5AFF489848"
                            . "01F0488904248B842420010000038424100100008944240C8B84241801000003"
                            . "8424280100004439D80F8C610100008B94241001000083C001448B9424F80000"
                            . "00894424282B8C24100100004489642448448BA4240001000083EA01C7442418"
                            . "0000000044897C24408D049500000000895424384489742444450FAFD344896C"
                            . "244C48899C243801000089442420489848894424308B44240C448954241001C1"
                            . "448D5001894C243C8B4424383944240C0F8CA40000008B4C24108B5424204589"
                            . "DE488B5C24304C6344241841C1EE1F4C03042401CA4C63F94863D24C8D0C1748"
                            . "29D3EB514139C47E554584F6755044399C24080100007E46410FB64902410FB6"
                            . "510183C0014983C0016BD24B6BC92601D14A8D140B4983C104460FB62C3A4489"
                            . "EAC1E2044429EA01D1C1F907418848FF4139C2741D89C2C1EA1F84D274A683C0"
                            . "0141C600004983C1044983C0014139C275E38B5C243C015C24184183C3018B9C"
                            . "24F8000000015C241044395C24280F8534FFFFFF448B7C2440448B742444448B"
                            . "642448448B6C244C488B9C24380100008B842420010000448B94242801000083"
                            . "C0024585D20F8EBEF6FFFF488B0C24489844897C24384889442410448B7C2468"
                            . "48899C2438010000C7042401000000488D440101C744240C0000000044897424"
                            . "3C4889C18B8424280100004889CB83C001894424184863842420010000488D50"
                            . "0348F7D048894424288B84242001000048895424208B54240883E8014883C001"
                            . "4889442430448B8C24200100004585C90F8EAD000000488B44242048634C240C"
                            . "4C8D0C18488B4424284801F14C8D0418488B4424304C8D34184889D80F1F4000"
                            . "0FB610440FB650FF41BB010000004401FA4439D2724A440FB650014439D27240"
                            . "450FB650FF4439D27236450FB651FF4439D2722C450FB650FE4439D27222450F"
                            . "B6104439D27219450FB651FE4439D2720F450FB6114439D2410F92C30F1F4000"
                            . "4883C0014488194983C1014883C1014983C0014C39F075888B8C242001000001"
                            . "4C240C8304240148035C24108B0424394424180F852CFFFFFF448B7C2438448B"
                            . "74243C89542408488B9C2438010000E955F5FFFF8B8424200100008B54246845"
                            . "31DBC744240C00000000C1E00283C201894424108B842428010000C1E2078954"
                            . "246885C00F8E1FF5FFFF44897C241848899C2438010000448B7C2468448B9424"
                            . "200100008B5C242044897424284585D27E504C6374240C4863C34531C0488D4C"
                            . "07024901F60FB6110FB641FF440FB649FE6BC04B6BD22601C24489C8C1E00444"
                            . "29C801D04139C7430F9704064983C0014883C1044539C27FCC035C2410440154"
                            . "240C4183C301031C2444399C2428010000759A448B7C2418448B742428488B9C"
                            . "2438010000E97FF4FFFFC744243000000000E9BBF6FFFF909090909090909090"
                            this.MCode(MyFunc, A_PtrSize=8 ? x64:x32)
                        }
                        text:=j[1], w:=j[2], h:=j[3]
                        , e1:=(j[12] ? j[6] : Floor(j[4] * ini.err1))
                        , e0:=(j[12] ? j[7] : Floor(j[5] * ini.err0))
                        , mode:=j[8], color:=j[9], n:=j[10]
                        return (!ini.bits.Scan0) ? 0 : DllCall(&MyFunc
                        , "int",mode, "uint",color, "uint",n, "int",dir
                        , "Ptr",ini.bits.Scan0, "int",ini.bits.Stride
                        , "int",ini.zw, "int",ini.zh
                        , "int",sx, "int",sy, "int",sw, "int",sh
                        , "Ptr",ini.ss, "Ptr",ini.s1, "Ptr",ini.s0
                        , "AStr",text, "int",w, "int",h, "int",e1, "int",e0
                        , "Ptr",&allpos, "int",ini.allpos_max)
                    }

                    GetBitsFromScreen(ByRef x:=0, ByRef y:=0, ByRef w:=0, ByRef h:=0
                    , ScreenShot:=1, ByRef zx:="", ByRef zy:="", ByRef zw:="", ByRef zh:="")
                    {
                        local
                        (!IsObject(this.bits) && this.bits:=[]), bits:=this.bits
                        if (!ScreenShot and bits.Scan0)
                        {
                            zx:=bits.zx, zy:=bits.zy, zw:=bits.zw, zh:=bits.zh
                            if IsByRef(x)
                                w:=Min(x+w,zx+zw), x:=Max(x,zx), w-=x
                            , h:=Min(y+h,zy+zh), y:=Max(y,zy), h-=y
                        return bits
                    }
                    bch:=A_BatchLines, cri:=A_IsCritical
                    Critical
                    if (id:=this.BindWindow(0,0,1))
                    {
                        WinGet, id, ID, ahk_id %id%
                        WinGetPos, zx, zy, zw, zh, ahk_id %id%
                    }
                    if (!id)
                    {
                        SysGet, zx, 76
                        SysGet, zy, 77
                        SysGet, zw, 78
                        SysGet, zh, 79
                    }
                    bits.zx:=zx, bits.zy:=zy, bits.zw:=zw, bits.zh:=zh
                    , w:=Min(x+w,zx+zw), x:=Max(x,zx), w-=x
                    , h:=Min(y+h,zy+zh), y:=Max(y,zy), h-=y
                    if (zw>bits.oldzw or zh>bits.oldzh or !bits.hBM)
                    {
                        DllCall("DeleteObject", "Ptr",bits.hBM)
                        , bits.hBM:=this.CreateDIBSection(zw, zh, bpp:=32, ppvBits)
                        , bits.Scan0:=(!bits.hBM ? 0:ppvBits)
                        , bits.Stride:=((zw*bpp+31)//32)*4
                        , bits.oldzw:=zw, bits.oldzh:=zh
                    }
                    if (!ScreenShot or w<1 or h<1 or !bits.hBM)
                    {
                        Critical, %cri%
                        SetBatchLines, %bch%
                        return bits
                    }
                    if IsFunc(k:="GetBitsFromScreen2")
                        and %k%(bits, x-zx, y-zy, w, h)
                    {
                        zx:=bits.zx, zy:=bits.zy, zw:=bits.zw, zh:=bits.zh
                        Critical, %cri%
                        SetBatchLines, %bch%
                        return bits
                    }
                    mDC:=DllCall("CreateCompatibleDC", "Ptr",0, "Ptr")
                    oBM:=DllCall("SelectObject", "Ptr",mDC, "Ptr",bits.hBM, "Ptr")
                    if (id)
                    {
                        if (mode:=this.BindWindow(0,0,0,1))<2
                        {
                            hDC2:=DllCall("GetDCEx", "Ptr",id, "Ptr",0, "int",3, "Ptr")
                            DllCall("BitBlt","Ptr",mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
                            , "Ptr",hDC2, "int",x-zx, "int",y-zy, "uint",0xCC0020|0x40000000)
                            DllCall("ReleaseDC", "Ptr",id, "Ptr",hDC2)
                        }
                        else
                        {
                            hBM2:=this.CreateDIBSection(zw, zh)
                            mDC2:=DllCall("CreateCompatibleDC", "Ptr",0, "Ptr")
                            oBM2:=DllCall("SelectObject", "Ptr",mDC2, "Ptr",hBM2, "Ptr")
                            DllCall("PrintWindow", "Ptr",id, "Ptr",mDC2, "uint",(mode>3)*3)
                            DllCall("BitBlt","Ptr",mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
                            , "Ptr",mDC2, "int",x-zx, "int",y-zy, "uint",0xCC0020|0x40000000)
                            DllCall("SelectObject", "Ptr",mDC2, "Ptr",oBM2)
                            DllCall("DeleteDC", "Ptr",mDC2)
                            DllCall("DeleteObject", "Ptr",hBM2)
                        }
                    }
                    else
                    {
                        win:=DllCall("GetDesktopWindow", "Ptr")
                        hDC:=DllCall("GetWindowDC", "Ptr",win, "Ptr")
                        DllCall("BitBlt","Ptr",mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
                        , "Ptr",hDC, "int",x, "int",y, "uint",0xCC0020|0x40000000)
                        DllCall("ReleaseDC", "Ptr",win, "Ptr",hDC)
                    }
                    if this.CaptureCursor(0,0,0,0,0,1)
                        this.CaptureCursor(mDC, zx, zy, zw, zh)
                    DllCall("SelectObject", "Ptr",mDC, "Ptr",oBM)
                    DllCall("DeleteDC", "Ptr",mDC)
                    Critical, %cri%
                    SetBatchLines, %bch%
                    return bits
                }

                CreateDIBSection(w, h, bpp:=32, ByRef ppvBits:=0, ByRef bi:="")
                {
                    VarSetCapacity(bi, 40, 0), NumPut(40, bi, 0, "int")
                    , NumPut(w, bi, 4, "int"), NumPut(-h, bi, 8, "int")
                    , NumPut(1, bi, 12, "short"), NumPut(bpp, bi, 14, "short")
                    return DllCall("CreateDIBSection", "Ptr",0, "Ptr",&bi
                    , "int",0, "Ptr*",ppvBits:=0, "Ptr",0, "int",0, "Ptr")
                }

                PicInfo(text)
                {
                    local
                    static info:=[]
                    if !InStr(text,"$")
                        return
                    key:=(r:=StrLen(text))<10000 ? text
                    : DllCall("ntdll\RtlComputeCrc32", "uint",0
                    , "Ptr",&text, "uint",r*(1+!!A_IsUnicode), "uint")
                    if (info[key])
                        return info[key]
                    v:=text, comment:="", seterr:=e1:=e0:=0
                    ; You Can Add Comment Text within The <>
                    if RegExMatch(v,"<([^>\n]*)>",r)
                        v:=StrReplace(v,r), comment:=Trim(r1)
                    ; You can Add two fault-tolerant in the [], separated by commas
                    if RegExMatch(v,"\[([^\]\n]*)]",r)
                    {
                        v:=StrReplace(v,r), r:=StrSplit(r1, ",")
                        , seterr:=1, e1:=r[1], e0:=r[2]
                    }
                    color:=StrSplit(v,"$")[1], v:=Trim(SubStr(v,InStr(v,"$")+1))
                    mode:=InStr(color,"##") ? 5
                    : InStr(color,"-") ? 4 : InStr(color,"#") ? 3
                    : InStr(color,"**") ? 2 : InStr(color,"*") ? 1 : 0
                    color:=RegExReplace(color, "[*#\s]")
                    if (mode=5)
                    {
                        if (v~="[^\s\w/]") and FileExist(v) ; ImageSearch
                        {
                            if !(hBM:=LoadPicture(v))
                                return
                            this.GetBitmapWH(hBM, w, h)
                            if (w<1 or h<1)
                                return
                            hBM2:=this.CreateDIBSection(w, h, 32, Scan0)
                            this.CopyHBM(hBM2, 0, 0, hBM, 0, 0, w, h)
                            DllCall("DeleteObject", "Ptr",hBM)
                            if (!Scan0)
                                return
                            c1:=NumGet(Scan0+0,"uint")&0xFFFFFF
                            c2:=NumGet(Scan0+(w-1)*4,"uint")&0xFFFFFF
                            c3:=NumGet(Scan0+(w*h-w)*4,"uint")&0xFFFFFF
                            c4:=NumGet(Scan0+(w*h-1)*4,"uint")&0xFFFFFF
                            if (c1!=c2 or c1!=c3 or c1!=c4)
                                c1:=-1
                            VarSetCapacity(v, w*h*18*(1+!!A_IsUnicode)), i:=-4, n:=0
                            SetFormat, IntegerFast, d
                            Loop %h%
                            {
                                y:=A_Index-1
                                Loop %w%
                                    if (c:=NumGet(Scan0+(i+=4),"uint")&0xFFFFFF)!=c1
                                    v.=(A_Index-1)|y<<16|c<<32 . "/", n++
                            }
                            DllCall("DeleteObject", "Ptr",hBM2)
                        }
                        else
                        {
                            v:=Trim(StrReplace(RegExReplace(v,"\s"),",","/"),"/")
                            r:=StrSplit(v,"/"), n:=r.Length()//3
                            if (!n)
                                return
                            VarSetCapacity(v, n*18*(1+!!A_IsUnicode))
                            x1:=x2:=r[1], y1:=y2:=r[2]
                            SetFormat, IntegerFast, d
                            Loop % n + (i:=-2)*0
                                x:=r[i+=3], y:=r[i+1]
                            , (x<x1 && x1:=x), (x>x2 && x2:=x)
                            , (y<y1 && y1:=y), (y>y2 && y2:=y)
                            Loop % n + (i:=-2)*0
                                v.=(r[i+=3]-x1)|(r[i+1]-y1)<<16|(Floor("0x"
                            . StrReplace(r[i+2],"0x"))&0xFFFFFF)<<32 . "/"
                            w:=x2-x1+1, h:=y2-y1+1
                        }
                        len1:=n, len0:=0
                    }
                    else
                    {
                        r:=StrSplit(v,"."), w:=r[1]
                        , v:=this.base64tobit(r[2]), h:=StrLen(v)//w
                        if (w<1 or h<1 or StrLen(v)!=w*h)
                        return
                    if (mode=4)
                    {
                        r:=StrSplit(StrReplace(color,"0x"),"-")
                        , color:=Floor("0x" r[1]), n:=Floor("0x" r[2])
                    }
                    else
                    {
                        r:=StrSplit(color,"@")
                        , color:=r[1], n:=Round(r[2],2)+(!r[2])
                        , n:=Floor(512*9*255*255*(1-n)*(1-n))
                        if (mode=3)
                            color:=(((color-1)//w)<<16)|Mod(color-1,w)
                    }
                    StrReplace(v,"1","",len1), len0:=StrLen(v)-len1
                }
                e1:=Floor(len1*e1), e0:=Floor(len0*e0)
                return info[key]:=[v, w, h, len1, len0, e1, e0
                , mode, color, n, comment, seterr]
            }

            GetBitmapWH(hBM, ByRef w, ByRef h)
            {
                local
                VarSetCapacity(bm, size:=(A_PtrSize=8 ? 32:24), 0)
                r:=DllCall("GetObject", "Ptr",hBM, "int",size, "Ptr",&bm)
                w:=NumGet(bm,4,"int"), h:=Abs(NumGet(bm,8,"int"))
                return r
            }

            CopyHBM(hBM1, x1, y1, hBM2, x2, y2, w2, h2)
            {
                local
                if (w2<1 or h2<1 or !hBM1 or !hBM2)
                    return
                mDC1:=DllCall("CreateCompatibleDC", "Ptr",0, "Ptr")
                oBM1:=DllCall("SelectObject", "Ptr",mDC1, "Ptr",hBM1, "Ptr")
                mDC2:=DllCall("CreateCompatibleDC", "Ptr",0, "Ptr")
                oBM2:=DllCall("SelectObject", "Ptr",mDC2, "Ptr",hBM2, "Ptr")
                DllCall("BitBlt", "Ptr",mDC1
                , "int",x1, "int",y1, "int",w2, "int",h2, "Ptr",mDC2
                , "int",x2, "int",y2, "uint",0xCC0020)
                DllCall("SelectObject", "Ptr",mDC2, "Ptr",oBM2)
                DllCall("DeleteDC", "Ptr",mDC2)
                DllCall("SelectObject", "Ptr",mDC1, "Ptr",oBM1)
                DllCall("DeleteDC", "Ptr",mDC1)
            }

            CopyBits(Scan01,Stride1,x1,y1,Scan02,Stride2,x2,y2,w2,h2,Reverse:=0)
            {
                local
                if (w2<1 or h2<1 or !Scan01 or !Scan02)
                    return
                p1:=Scan01+(y1-1)*Stride1+x1*4
                , p2:=Scan02+(y2-1)*Stride2+x2*4, w2*=4
                if (Reverse)
                    p2+=(h2+1)*Stride2, Stride2:=-Stride2
                Loop % h2
                    DllCall("RtlMoveMemory","Ptr",p1+=Stride1,"Ptr",p2+=Stride2,"Ptr",w2)
            }

            ; Bind the window so that it can find images when obscured
            ; by other windows, it's equivalent to always being
            ; at the front desk. Unbind Window using FindText().BindWindow(0)

            BindWindow(bind_id:=0, bind_mode:=0, get_id:=0, get_mode:=0)
            {
                local
                (!IsObject(this.bind) && this.bind:=[]), bind:=this.bind
                if (get_id)
                    return bind.id
                if (get_mode)
                    return bind.mode
                if (bind_id)
                {
                    bind.id:=bind_id, bind.mode:=bind_mode, bind.oldStyle:=0
                    if (bind_mode & 1)
                    {
                        WinGet, oldStyle, ExStyle, ahk_id %bind_id%
                        bind.oldStyle:=oldStyle
                        WinSet, Transparent, 255, ahk_id %bind_id%
                        Loop 30
                        {
                            Sleep, 100
                            WinGet, i, Transparent, ahk_id %bind_id%
                        }
                        Until (i=255)
                    }
                }
                else
                {
                    bind_id:=bind.id
                    if (bind.mode & 1)
                        WinSet, ExStyle, % bind.oldStyle, ahk_id %bind_id%
                    bind.id:=0, bind.mode:=0, bind.oldStyle:=0
                }
            }

            ; Use FindText().CaptureCursor(1) to Capture Cursor
            ; Use FindText().CaptureCursor(0) to Cancel Capture Cursor

            CaptureCursor(hDC:=0, zx:=0, zy:=0, zw:=0, zh:=0, get_cursor:=0)
            {
                local
                if (get_cursor)
                    return this.Cursor
                if (hDC=1 or hDC=0) and (zw=0)
                {
                    this.Cursor:=hDC
                    return
                }
                VarSetCapacity(mi, 40, 0), NumPut(16+A_PtrSize, mi, "int")
                DllCall("GetCursorInfo", "Ptr",&mi)
                bShow := NumGet(mi, 4, "int")
                hCursor := NumGet(mi, 8, "Ptr")
                x := NumGet(mi, 8+A_PtrSize, "int")
                y := NumGet(mi, 12+A_PtrSize, "int")
                if (!bShow) or (x<zx or y<zy or x>=zx+zw or y>=zy+zh)
                    return
                VarSetCapacity(ni, 40, 0)
                DllCall("GetIconInfo", "Ptr",hCursor, "Ptr",&ni)
                xCenter := NumGet(ni, 4, "int")
                yCenter := NumGet(ni, 8, "int")
                hBMMask := NumGet(ni, (A_PtrSize=8?16:12), "Ptr")
                hBMColor := NumGet(ni, (A_PtrSize=8?24:16), "Ptr")
                DllCall("DrawIconEx", "Ptr",hDC
                , "int",x-xCenter-zx, "int",y-yCenter-zy, "Ptr",hCursor
                , "int",0, "int",0, "int",0, "int",0, "int",3)
                DllCall("DeleteObject", "Ptr",hBMMask)
                DllCall("DeleteObject", "Ptr",hBMColor)
            }

            MCode(ByRef code, hex)
            {
                local
                SetBatchLines, % (bch:=A_BatchLines)?"-1":"-1"
                    VarSetCapacity(code, len:=StrLen(hex)//2)
                    Loop % len
                        NumPut("0x" SubStr(hex,2*A_Index-1,2),code,A_Index-1,"uchar")
                    DllCall("VirtualProtect","Ptr",&code,"Ptr",len,"uint",0x40,"Ptr*",0)
                    SetBatchLines, %bch%
                }

                base64tobit(s)
                {
                    local
                    Chars:="0123456789+/ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    . "abcdefghijklmnopqrstuvwxyz"
                    SetFormat, IntegerFast, d
                    Loop Parse, Chars
                    {
                        s:=RegExReplace(s, "[" A_LoopField "]"
                        , ((i:=A_Index-1)>>5&1) . (i>>4&1)
                        . (i>>3&1) . (i>>2&1) . (i>>1&1) . (i&1))
                    }
                return RegExReplace(RegExReplace(s,"[^01]+"),"10*$")
            }

            bit2base64(s)
            {
                local
                s:=RegExReplace(s,"[^01]+")
                s.=SubStr("100000",1,6-Mod(StrLen(s),6))
                s:=RegExReplace(s,".{6}","|$0")
                Chars:="0123456789+/ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                . "abcdefghijklmnopqrstuvwxyz"
                SetFormat, IntegerFast, d
                Loop Parse, Chars
                {
                    s:=StrReplace(s, "|" . ((i:=A_Index-1)>>5&1)
                    . (i>>4&1) . (i>>3&1) . (i>>2&1) . (i>>1&1) . (i&1)
                    , A_LoopField)
                }
                return s
            }

            xywh2xywh(x1,y1,w1,h1, ByRef x, ByRef y, ByRef w, ByRef h
            , ByRef zx:="", ByRef zy:="", ByRef zw:="", ByRef zh:="")
            {
                SysGet, zx, 76
                SysGet, zy, 77
                SysGet, zw, 78
                SysGet, zh, 79
                w:=Min(x1+w1,zx+zw), x:=Max(x1,zx), w-=x
                , h:=Min(y1+h1,zy+zh), y:=Max(y1,zy), h-=y
            }

            ASCII(s)
            {
                local
                if RegExMatch(s,"\$(\d+)\.([\w+/]+)",r)
                {
                    s:=RegExReplace(this.base64tobit(r2),".{" r1 "}","$0`n")
                    s:=StrReplace(StrReplace(s,"0","_"),"1","0")
                }
                else s:=""
                return s
        }

        ; You can put the text library at the beginning of the script,
        ; and Use FindText().PicLib(Text,1) to add the text library to PicLib()'s Lib,
        ; Use FindText().PicLib("comment1|comment2|...") to get text images from Lib

        PicLib(comments, add_to_Lib:=0, index:=1)
        {
            local
            (!IsObject(this.Lib) && this.Lib:=[]), Lib:=this.Lib
            , (!Lib[index] && Lib[index]:=[]), Lib:=Lib[index]
            if (add_to_Lib)
            {
                re:="<([^>\n]*)>[^$\n]+\$\d+\.[\w+/]+"
                Loop Parse, comments, |
                    if RegExMatch(A_LoopField,re,r)
                {
                    s1:=Trim(r1), s2:=""
                    Loop Parse, s1
                        s2.="_" . Format("{:d}",Ord(A_LoopField))
                    Lib[s2]:=r
                }
                Lib[""]:=""
            }
            else
            {
                Text:=""
                Loop Parse, comments, |
                {
                    s1:=Trim(A_LoopField), s2:=""
                    Loop Parse, s1
                        s2.="_" . Format("{:d}",Ord(A_LoopField))
                    Text.="|" . Lib[s2]
                }
                return Text
            }
        }

        ; Decompose a string into individual characters and get their data

        PicN(Number, index:=1)
        {
            return this.PicLib(RegExReplace(Number,".","|$0"), 0, index)
        }

        ; Use FindText().PicX(Text) to automatically cut into multiple characters
        ; Can't be used in ColorPos mode, because it can cause position errors

        PicX(Text)
        {
            local
            if !RegExMatch(Text,"(<[^$\n]+)\$(\d+)\.([\w+/]+)",r)
                return Text
            v:=this.base64tobit(r3), Text:=""
            c:=StrLen(StrReplace(v,"0"))<=StrLen(v)//2 ? "1":"0"
                txt:=RegExReplace(v,".{" r2 "}","$0`n")
                While InStr(txt,c)
                {
                    While !(txt~="m`n)^" c)
                        txt:=RegExReplace(txt,"m`n)^.")
                    i:=0
                    While (txt~="m`n)^.{" i "}" c)
                        i:=Format("{:d}",i+1)
                    v:=RegExReplace(txt,"m`n)^(.{" i "}).*","$1")
                    txt:=RegExReplace(txt,"m`n)^.{" i "}")
                    if (v!="")
                        Text.="|" r1 "$" i "." this.bit2base64(v)
                }
            return Text
        }

        ; Screenshot and retained as the last screenshot.

        ScreenShot(x1:=0, y1:=0, x2:=0, y2:=0)
        {
            this.FindText(0, 0, x1, y1, x2, y2)
        }

        ; Get the RGB color of a point from the last screenshot.
        ; If the point to get the color is beyond the range of
        ; Screen, it will return White color (0xFFFFFF).

        GetColor(x, y, fmt:=1)
        {
            local
            bits:=this.GetBitsFromScreen(0,0,0,0,0,zx,zy,zw,zh)
            , c:=(x<zx or x>=zx+zw or y<zy or y>=zy+zh or !bits.Scan0)
            ? 0xFFFFFF : NumGet(bits.Scan0+(y-zy)*bits.Stride+(x-zx)*4,"uint")
            return (fmt ? Format("0x{:06X}",c&0xFFFFFF) : c)
        }

        ; Set the RGB color of a point in the last screenshot

        SetColor(x, y, color:=0x000000)
        {
            local
            bits:=this.GetBitsFromScreen(0,0,0,0,0,zx,zy,zw,zh)
            if !(x<zx or x>=zx+zw or y<zy or y>=zy+zh or !bits.Scan0)
                NumPut(color,bits.Scan0+(y-zy)*bits.Stride+(x-zx)*4,"uint")
        }

        ; Identify a line of text or verification code
        ; based on the result returned by FindText().
        ; offsetX is the maximum interval between two texts,
        ; if it exceeds, a "*" sign will be inserted.
        ; offsetY is the maximum height difference between two texts.
        ; overlapW is used to set the width of the overlap.
        ; Return Association array {text:Text, x:X, y:Y, w:W, h:H}

        Ocr(ok, offsetX:=20, offsetY:=20, overlapW:=0)
        {
            local
            ocr_Text:=ocr_X:=ocr_Y:=min_X:=dx:=""
            For k,v in ok
                x:=v[1]
            , min_X:=(A_Index=1 or x<min_X ? x : min_X)
            , max_X:=(A_Index=1 or x>max_X ? x : max_X)
            While (min_X!="" and min_X<=max_X)
            {
                LeftX:=""
                For k,v in ok
                {
                    x:=v[1], y:=v[2]
                    if (x<min_X) or Abs(y-ocr_Y)>offsetY
                        Continue
                    ; Get the leftmost X coordinates
                    if (LeftX="" or x<LeftX)
                        LeftX:=x, LeftY:=y, LeftW:=v[3], LeftH:=v[4], LeftOCR:=v.id
                }
                if (LeftX="")
                    Break
                if (ocr_X="")
                    ocr_X:=LeftX, min_Y:=LeftY, max_Y:=LeftY+LeftH
                ; If the interval exceeds the set value, add "*" to the result
                ocr_Text.=(ocr_Text!="" and LeftX>dx ? "*":"") . LeftOCR
                ; Update for next search
                min_X:=LeftX+LeftW-(overlapW>LeftW//2 ? LeftW//2:overlapW)
                , dx:=LeftX+LeftW+offsetX, ocr_Y:=LeftY
                , (LeftY<min_Y && min_Y:=LeftY)
                , (LeftY+LeftH>max_Y && max_Y:=LeftY+LeftH)
            }
            return {text:ocr_Text, x:ocr_X, y:min_Y
            , w: min_X-ocr_X, h: max_Y-min_Y}
        }

        ; Sort the results of FindText() from left to right
        ; and top to bottom, ignore slight height difference

        Sort(ok, dy:=10)
        {
            local
            if !IsObject(ok)
            return ok
        s:="", n:=150000, ypos:=[]
        For k,v in ok
        {
            x:=v.x, y:=v.y, add:=1
            For k1,v1 in ypos
                if Abs(y-v1)<=dy
            {
                y:=v1, add:=0
                Break
            }
            if (add)
                ypos.Push(y)
            s.=(y*n+x) "." k "|"
        }
        s:=Trim(s,"|")
        Sort, s, N D|
        ok2:=[]
        Loop Parse, s, |
            ok2.Push( ok[(StrSplit(A_LoopField,".")[2])] )
        return ok2
    }

    ; Sort the results of FindText() according to the nearest distance

    Sort2(ok, px, py)
    {
        local
        if !IsObject(ok)
            return ok
        s:=""
        For k,v in ok
            s.=((v.x-px)**2+(v.y-py)**2) "." k "|"
        s:=Trim(s,"|")
        Sort, s, N D|
        ok2:=[]
        Loop Parse, s, |
            ok2.Push( ok[(StrSplit(A_LoopField,".")[2])] )
        return ok2
    }

    ; Sort the results of FindText() according to the search direction

    Sort3(ok, dir:=1)
    {
        local
        if !IsObject(ok)
            return ok
        s:="", n:=150000
        For k,v in ok
            x:=v[1], y:=v[2]
        , s.=(dir=1 ? y*n+x
        : dir=2 ? y*n-x
        : dir=3 ? -y*n+x
        : dir=4 ? -y*n-x
        : dir=5 ? x*n+y
        : dir=6 ? x*n-y
        : dir=7 ? -x*n+y
        : dir=8 ? -x*n-y : y*n+x) "." k "|"
        s:=Trim(s,"|")
        Sort, s, N D|
        ok2:=[]
        Loop Parse, s, |
            ok2.Push( ok[(StrSplit(A_LoopField,".")[2])] )
        return ok2
    }

    ; Prompt mouse position in remote assistance

    MouseTip(x:="", y:="", w:=10, h:=10, d:=4)
    {
        local
        if (x="")
        {
            VarSetCapacity(pt,16,0), DllCall("GetCursorPos","ptr",&pt)
            x:=NumGet(pt,0,"uint"), y:=NumGet(pt,4,"uint")
        }
        Loop 4
        {
            this.RangeTip(x-w, y-h, 2*w+1, 2*h+1, (A_Index & 1 ? "Red":"Blue"), d)
            Sleep, 500
        }
        this.RangeTip()
    }

    ; Shows a range of the borders, similar to the ToolTip

    RangeTip(x:="", y:="", w:="", h:="", color:="Red", d:=2)
    {
        local
        static id:=0
        if (x="")
        {
            id:=0
            Loop 4
                Gui, Range_%A_Index%: Destroy
            return
        }
        if (!id)
        {
            Loop 4
                Gui, Range_%A_Index%: +Hwndid +AlwaysOnTop -Caption +ToolWindow
            -DPIScale +E0x08000000
        }
        x:=Floor(x), y:=Floor(y), w:=Floor(w), h:=Floor(h), d:=Floor(d)
        Loop 4
        {
            i:=A_Index
            , x1:=(i=2 ? x+w : x-d)
            , y1:=(i=3 ? y+h : y-d)
            , w1:=(i=1 or i=3 ? w+2*d : d)
            , h1:=(i=2 or i=4 ? h+2*d : d)
            Gui, Range_%i%: Color, %color%
            Gui, Range_%i%: Show, NA x%x1% y%y1% w%w1% h%h1%
        }
    }

    ; Quickly get the search data of screen image

    GetTextFromScreen(x1, y1, x2, y2, Threshold:=""
    , ScreenShot:=1, ByRef rx:="", ByRef ry:="")
    {
        local
        SetBatchLines, % (bch:=A_BatchLines)?"-1":"-1"
            x:=Min(x1,x2), y:=Min(y1,y2), w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
            this.GetBitsFromScreen(x,y,w,h,ScreenShot,zx,zy,zw,zh)
            if (w<1 or h<1)
            {
                SetBatchLines, %bch%
                return
            }
            gs:=[], k:=0
            Loop %h%
            {
                j:=y+A_Index-1
                Loop %w%
                    i:=x+A_Index-1, c:=this.GetColor(i,j,0)
                , gs[++k]:=(((c>>16)&0xFF)*38+((c>>8)&0xFF)*75+(c&0xFF)*15)>>7
            }
            if InStr(Threshold,"**")
            {
                Threshold:=StrReplace(Threshold,"*")
                if (Threshold="")
                    Threshold:=50
                s:="", sw:=w, w-=2, h-=2, x++, y++
                Loop %h%
                {
                    y1:=A_Index
                    Loop %w%
                        x1:=A_Index, i:=y1*sw+x1+1, j:=gs[i]+Threshold
                    , s.=( gs[i-1]>j || gs[i+1]>j
                    || gs[i-sw]>j || gs[i+sw]>j
                    || gs[i-sw-1]>j || gs[i-sw+1]>j
                    || gs[i+sw-1]>j || gs[i+sw+1]>j ) ? "1":"0"
                    }
                    Threshold:="**" Threshold
                }
                else
                {
                    Threshold:=StrReplace(Threshold,"*")
                    if (Threshold="")
                    {
                        pp:=[]
                        Loop 256
                            pp[A_Index-1]:=0
                        Loop % w*h
                            pp[gs[A_Index]]++
                        IP0:=IS0:=0
                        Loop 256
                            k:=A_Index-1, IP0+=k*pp[k], IS0+=pp[k]
                        Threshold:=Floor(IP0/IS0)
                        Loop 20
                        {
                            LastThreshold:=Threshold
                            IP1:=IS1:=0
                            Loop % LastThreshold+1
                                k:=A_Index-1, IP1+=k*pp[k], IS1+=pp[k]
                            IP2:=IP0-IP1, IS2:=IS0-IS1
                            if (IS1!=0 and IS2!=0)
                                Threshold:=Floor((IP1/IS1+IP2/IS2)/2)
                            if (Threshold=LastThreshold)
                                Break
                        }
                    }
                    s:=""
                    Loop % w*h
                    s.=gs[A_Index]<=Threshold ? "1":"0"
                    Threshold:="*" Threshold
                }
                ;--------------------
                w:=Format("{:d}",w), CutUp:=CutDown:=0
                re1:="(^0{" w "}|^1{" w "})"
                re2:="(0{" w "}$|1{" w "}$)"
                While RegExMatch(s,re1)
                    s:=RegExReplace(s,re1), CutUp++
                While RegExMatch(s,re2)
                    s:=RegExReplace(s,re2), CutDown++
                rx:=x+w//2, ry:=y+CutUp+(h-CutUp-CutDown)//2
                s:="|<>" Threshold "$" w "." this.bit2base64(s)
                ;--------------------
                SetBatchLines, %bch%
                return s
            }

            ; Quickly save screen image to BMP file for debugging

            SavePic(file, x1:=0, y1:=0, x2:=0, y2:=0, ScreenShot:=1)
            {
                local
                if (x1*x1+y1*y1+x2*x2+y2*y2<=0)
                    n:=150000, x:=y:=-n, w:=h:=2*n
                else
                    x:=Min(x1,x2), y:=Min(y1,y2), w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
                bits:=this.GetBitsFromScreen(x,y,w,h,ScreenShot,zx,zy), x-=zx, y-=zy
                if (w<1 or h<1 or !bits.Scan0)
                return
            hBM:=this.CreateDIBSection(w, -h, bpp:=24, ppvBits, bi)
            hBM2:=this.CreateDIBSection(w, h, 32, Scan0), Stride:=w*4
            this.CopyBits(Scan0,Stride,0,0,bits.Scan0,bits.Stride,x,y,w,h)
            this.CopyHBM(hBM, 0, 0, hBM2, 0, 0, w, h)
            DllCall("DeleteObject", "Ptr",hBM2)
            size:=((w*bpp+31)//32)*4*h, NumPut(size, bi, 20, "uint")
            VarSetCapacity(bf, 14, 0), StrPut("BM", &bf, "CP0")
            NumPut(54+size, bf, 2, "uint"), NumPut(54, bf, 10, "uint")
            f:=FileOpen(file,"w"), f.RawWrite(bf,14), f.RawWrite(bi,40)
            , f.RawWrite(ppvBits+0, size), f.Close()
            DllCall("DeleteObject", "Ptr",hBM)
        }

        ; Show the saved Picture file

        ShowPic(file:="", show:=1, ByRef x:="", ByRef y:="", ByRef w:="", ByRef h:="")
        {
            local
            if (file="")
            {
                this.ShowScreenShot()
                return
            }
            if !FileExist(file) or !(hBM:=LoadPicture(file))
                return
            this.GetBitmapWH(hBM, w, h)
            bits:=this.GetBitsFromScreen(0,0,0,0,0,x,y)
            if (w<1 or h<1 or !bits.Scan0)
            {
                DllCall("DeleteObject", "Ptr",hBM)
                return
            }
            hBM2:=this.CreateDIBSection(w, h, 32, Scan0), Stride:=w*4
            this.CopyHBM(hBM2, 0, 0, hBM, 0, 0, w, h)
            this.CopyBits(bits.Scan0,bits.Stride,0,0,Scan0,Stride,0,0,w,h)
            DllCall("DeleteObject", "Ptr",hBM2)
            DllCall("DeleteObject", "Ptr",hBM)
            if (show)
                this.ShowScreenShot(x, y, x+w-1, y+h-1, 0)
        }

        ; Show the memory Screenshot for debugging

        ShowScreenShot(x1:=0, y1:=0, x2:=0, y2:=0, ScreenShot:=1)
        {
            local
            static hPic, oldw, oldh
            if (x1*x1+y1*y1+x2*x2+y2*y2<=0)
            {
                Gui, FindText_Screen: Destroy
                return
            }
            x:=Min(x1,x2), y:=Min(y1,y2), w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
            bits:=this.GetBitsFromScreen(x,y,w,h,ScreenShot,zx,zy), x-=zx, y-=zy
            if (w<1 or h<1 or !bits.Scan0)
                return
            hBM:=this.CreateDIBSection(w, h, 32, Scan0), Stride:=w*4
            this.CopyBits(Scan0,Stride,0,0,bits.Scan0,bits.Stride,x,y,w,h)
            ;---------------
            Gui, FindText_Screen: +LastFoundExist
            IfWinNotExist
            {
                Gui, FindText_Screen: +AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x08000000
                Gui, FindText_Screen: Margin, 0, 0
                Gui, FindText_Screen: Add, Pic, HwndhPic w%w% h%h%
                Gui, FindText_Screen: Show, NA x%zx% y%zy% w%w% h%h%, Show Pic
                oldw:=w, oldh:=h
            }
            else if (oldw!=w or oldh!=h)
            {
                oldw:=w, oldh:=h
                GuiControl, FindText_Screen: Move, %hPic%, w%w% h%h%
                Gui, FindText_Screen: Show, NA w%w% h%h%
            }
            mDC:=DllCall("CreateCompatibleDC", "Ptr",0, "Ptr")
            oBM:=DllCall("SelectObject", "Ptr",mDC, "Ptr",hBM, "Ptr")
            DllCall("BitBlt", "Ptr",mDC, "int",0, "int",0, "int",w, "int",h
            , "Ptr",mDC, "int",0, "int",0, "uint",0xC000CA) ; MERGECOPY
            ;---------------
            hDC:=DllCall("GetDC", "Ptr",hPic, "Ptr")
            DllCall("BitBlt", "Ptr",hDC, "int",0, "int",0, "int",w, "int",h
            , "Ptr",mDC, "int",0, "int",0, "uint",0xCC0020)
            DllCall("ReleaseDC", "Ptr",hPic, "Ptr",hDC)
            ;---------------
            DllCall("SelectObject", "Ptr",mDC, "Ptr",oBM)
            DllCall("DeleteDC", "Ptr",mDC)
            DllCall("DeleteObject", "Ptr",hBM)
        }

        ; Wait for the screen image to change within a few seconds
        ; Take a Screenshot before using it: FindText().ScreenShot()

        WaitChange(time:=-1, x1:=0, y1:=0, x2:=0, y2:=0)
        {
            local
            hash:=this.GetPicHash(x1, y1, x2, y2, 0)
            timeout:=A_TickCount+Round(time*1000)
            Loop
            {
                if (hash!=this.GetPicHash(x1, y1, x2, y2, 1))
                return 1
            if (time>=0 and A_TickCount>=timeout)
                Break
            Sleep, 10
        }
        return 0
    }

    GetPicHash(x1:=0, y1:=0, x2:=0, y2:=0, ScreenShot:=1)
    {
        local
        static h:=DllCall("LoadLibrary", "Str","ntdll", "Ptr")
        if (x1*x1+y1*y1+x2*x2+y2*y2<=0)
            n:=150000, x:=y:=-n, w:=h:=2*n
        else
            x:=Min(x1,x2), y:=Min(y1,y2), w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
        bits:=this.GetBitsFromScreen(x,y,w,h,ScreenShot,zx,zy), x-=zx, y-=zy
        if (w<1 or h<1 or !bits.Scan0)
            return 0
        hash:=0, Stride:=bits.Stride, p:=bits.Scan0+(y-1)*Stride+x*4, w*=4
        Loop % h
            hash:=(hash*31+DllCall("ntdll\RtlComputeCrc32", "uint",0
        , "Ptr",p+=Stride, "uint",w, "uint"))&0xFFFFFFFF
        return hash
    }

    WindowToScreen(ByRef x, ByRef y, x1, y1, id:="")
    {
        local
        WinGetPos, winx, winy,,, % id ? "ahk_id " id : "A"
            x:=x1+Floor(winx), y:=y1+Floor(winy)
        }

        ScreenToWindow(ByRef x, ByRef y, x1, y1, id:="")
        {
            local
            this.WindowToScreen(dx,dy,0,0,id), x:=x1-dx, y:=y1-dy
        }

        ClientToScreen(ByRef x, ByRef y, x1, y1, id:="")
        {
            local
            if (!id)
                WinGet, id, ID, A
            VarSetCapacity(pt,8,0), NumPut(0,pt,"int64")
            , DllCall("ClientToScreen", "Ptr",id, "Ptr",&pt)
            , x:=x1+NumGet(pt,"int"), y:=y1+NumGet(pt,4,"int")
        }

        ScreenToClient(ByRef x, ByRef y, x1, y1, id:="")
        {
            local
            this.ClientToScreen(dx,dy,0,0,id), x:=x1-dx, y:=y1-dy
        }

        ; It is not like FindText always use Screen Coordinates,
        ; But like built-in command ImageSearch using CoordMode Settings

        ImageSearch(ByRef rx, ByRef ry, x1, y1, x2, y2, text
        , ScreenShot:=1, FindAll:=0)
        {
            local
            dx:=dy:=0
            if (A_CoordModePixel="Window")
                this.WindowToScreen(dx,dy,0,0)
            else if (A_CoordModePixel="Client")
                this.ClientToScreen(dx,dy,0,0)
            if FileExist(pic:=RegExReplace(text,"\*\S+\s+"))
                text:="|<>##10$" pic
            if (ok:=this.FindText(x, y, x1+dx, y1+dy, x2+dx, y2+dy
                , 0, 0, text, ScreenShot, FindAll))
            {
                For k,v in ok ; you can use ok:=FindText().ok
                    v[1]-=dx, v[2]-=dy, v.x-=dx, v.y-=dy
                rx:=x-dx, ry:=y-dy, ErrorLevel:=0
                return 1
            }
            else
            {
                rx:=ry:="", ErrorLevel:=1
                return 0
            }
        }

        Click(x:="", y:="", other:="")
        {
            local
            bak:=A_CoordModeMouse
            CoordMode, Mouse, Screen
            MouseMove, x, y, 0
            Click, %x%, %y%, %other%
            CoordMode, Mouse, %bak%
        }

        ; Running AHK code dynamically with new threads

        Class Thread
        {
            __New(args*)
            {
                this.pid:=this.Exec(args*)
            }
            __Delete()
            {
                DetectHiddenWindows, On
                WinWait, % "ahk_pid " this.pid,, 0.5
                IfWinExist, % "ahk_class AutoHotkey ahk_pid " this.pid
                {
                    PostMessage, 0x111, 65307
                    WinWaitClose,,, 0.5
                }
                Process, Close, % this.pid
            }
            Exec(s, Ahk:="", args:="")
            {
                local
                Ahk:=Ahk ? Ahk:A_IsCompiled ? A_ScriptDir "\AutoHotkey.exe":A_AhkPath
                s:="`nDllCall(""SetWindowText"",""Ptr"",A_ScriptHwnd,""Str"",""<AHK>"")`n"
                . "`nSetBatchLines,-1`n" . StrReplace(s,"`r")
                Try
                {
                    shell:=ComObjCreate("WScript.Shell")
                    oExec:=shell.Exec("""" Ahk """ /force * " args)
                    oExec.StdIn.Write(s)
                    oExec.StdIn.Close(), pid:=oExec.ProcessID
                }
                Catch
                {
                    f:=A_Temp "\~ahk.tmp"
                    s:="`n FileDelete, " f "`n" s
                    FileDelete, %f%
                    FileAppend, %s%, %f%
                    r:=this.Clear.Bind(this)
                    SetTimer, %r%, -3000
                    Run, "%Ahk%" /force "%f%" %args%,, UseErrorLevel, pid
                }
                return pid
            }
            Clear()
            {
                FileDelete, % A_Temp "\~ahk.tmp"
                SetTimer,, Off
            }
        }

        ; FindText().QPC() Use the same as A_TickCount

        QPC()
        {
            static f:=0, c:=DllCall("QueryPerformanceFrequency", "Int*",f)
        return (!DllCall("QueryPerformanceCounter","Int64*",c))*0+(c/f)*1000
    }

    ; FindText().ToolTip() Use the same as ToolTip

    ToolTip(s:="", x:="", y:="", num:=1, arg:="")
    {
        local
        static ini:=[]
        f:= "ToolTip_" . Round(num)
        if (s="")
        {
            ini.Delete(f)
            Gui, %f%: Destroy
        return
    }
    ;-----------------
    r1:=A_CoordModeToolTip
    r2:=A_CoordModeMouse
    CoordMode, Mouse, Screen
    MouseGetPos, x1, y1
    CoordMode, Mouse, %r1%
    MouseGetPos, x2, y2
    CoordMode, Mouse, %r2%
    x:=Round(x="" ? x1+16 : x+x1-x2)
    y:=Round(y="" ? y1+16 : y+y1-y2)
    ;-----------------
    bgcolor:=arg.bgcolor ? arg.bgcolor : "FAFBFC"
    color:=arg.color ? arg.color : "Black"
    font:=arg.font ? arg.font : "Consolas"
    size:=arg.size ? arg.size : "10"
    bold:=arg.bold ? arg.bold : ""
        trans:=arg.trans ? arg.trans : 255
        ;-----------------
        r:=bgcolor "|" color "|" font "|" size "|" bold "|" trans "|" s
        if (ini[f]!=r)
        {
            ini[f]:=r
            Gui, %f%: Destroy
            Gui, %f%: +AlwaysOnTop -Caption +ToolWindow
            -DPIScale +Hwndid +E0x08000020
            Gui, %f%: Margin, 2, 2
            Gui, %f%: Color, %bgcolor%
            Gui, %f%: Font, c%color% s%size% %bold%, %font%
            Gui, %f%: Add, Text,, %s%
            Gui, %f%: Show, Hide, %f%
            ;------------------
            dhw:=A_DetectHiddenWindows
            DetectHiddenWindows, On
            WinSet, Transparent, %trans%, ahk_id %id%
            DetectHiddenWindows, %dhw%
        }
        Gui, %f%: +AlwaysOnTop
        Gui, %f%: Show, NA x%x% y%y%
    }

    ; FindText().ObjView()  view object values for Debug

    ObjView(obj, keyname="")
    {
        if IsObject(obj) ; thanks lexikos's type(v)
        {
            s:=""
            For k,v in obj
                s.=this.ObjView(v, keyname "[" (StrLen(k)>1000
            || [k].GetCapacity(1) ? """" k """":k) "]")
        }
        else
            s:=keyname ": " (StrLen(obj)>1000
        || [obj].GetCapacity(1) ? """" obj """":obj) "`n"
        if (keyname!="")
            return s
        ;------------------
        Gui, Gui_DeBug_Gui: Destroy
        Gui, Gui_DeBug_Gui: +AlwaysOnTop +Hwndid
        Gui, Gui_DeBug_Gui: Add, Button, y270 w350 gCancel Default, OK
        Gui, Gui_DeBug_Gui: Add, Edit, xp y10 w350 h250 -Wrap -WantReturn
        GuiControl, Gui_DeBug_Gui:, Edit1, %s%
        Gui, Gui_DeBug_Gui: Show,, Debug view object values
        DetectHiddenWindows, Off
        WinWaitClose, ahk_id %id%
        Gui, Gui_DeBug_Gui: Destroy
    }
}
;================= The End =================

