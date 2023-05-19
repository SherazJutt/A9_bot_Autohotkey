
Skip_MP_Cars_Label:

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
    Gui Add, Button, gSave_Skip_MP_Cars x10 y660 w100 h25 , Save

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

Save_Skip_MP_Cars:
    Gui, Submit, NoHide
    IniWrite, %Lancer_to_input%, %myinipath%, CarsSkipTo, Lancer_to
    IniWrite, %Hellcat_to_input%, %myinipath%, CarsSkipTo, Hellcat_to
    IniWrite, %Peugeotsr1_to_input%, %myinipath%, CarsSkipTo, Peugeotsr1_to
    IniWrite, %Lamborghinicountach25th_to_input%, %myinipath%, CarsSkipTo, Lamborghinicountach25th_to
    IniWrite, %Srt8_to_input%, %myinipath%, CarsSkipTo, Srt8_to
    IniWrite, %Saleens1_to_input%, %myinipath%, CarsSkipTo, Saleens1_to
    IniWrite, %Ferrarimonzasp1_to_input%, %myinipath%, CarsSkipTo, Ferrarimonzasp1_to
    IniWrite, %Jaguarxesvproject_to_input%, %myinipath%, CarsSkipTo, Jaguarxesvproject_to
    IniWrite, %Lamborghinimiura_to_input%, %myinipath%, CarsSkipTo, Lamborghinimiura_to
    IniWrite, %Bugattieb110_to_input%, %myinipath%, CarsSkipTo, Bugattieb110_to
    IniWrite, %Porsche911gscoupe_to_input%, %myinipath%, CarsSkipTo, Porsche911gscoupe_to
    IniWrite, %Nissanr390_to_input%, %myinipath%, CarsSkipTo, Nissanr390_to
    IniWrite, %Ferrarienzo_to_input%, %myinipath%, CarsSkipTo, Ferrarienzo_to
    IniWrite, %Lamborghiniessenza_to_input%, %myinipath%, CarsSkipTo, Lamborghiniessenza_to
    IniWrite, %Porschecarrera_to_input%, %myinipath%, CarsSkipTo, Porschecarrera_to
    IniWrite, %Vulkan_to_input%, %myinipath%, CarsSkipTo, Vulkan_to
    IniWrite, %Sennagtr_to_input%, %myinipath%, CarsSkipTo, Sennagtr_to
    IniWrite, %Zondar_to_input%, %myinipath%, CarsSkipTo, Zondar_to
    IniWrite, %Centenario_to_input%, %myinipath%, CarsSkipTo, Centenario_to
    IniWrite, %RaesrTacheon_to_input%, %myinipath%, CarsSkipTo, RaesrTacheon_to
    IniWrite, %Trion_to_input%, %myinipath%, CarsSkipTo, Trion_to
    IniWrite, %Naran_to_input%, %myinipath%, CarsSkipTo, Naran_to
    ; MsgBox, %Lancer_to_input%

    Gui, Destroy
Return

; include required files with labels and variables
#Include, %A_ScriptDir%\src\Guis\CarsSkip\Labels.ahk
#Include, %A_ScriptDir%\src\Guis\CarsSkip\Variables.ahk
