
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

; Lancer
IniRead, iniLancer, %myinipath%, CarsSkip, Lancer
IniRead, iniLancer_to, %myinipath%, CarsSkipTo, Lancer_to
; Hellcat
IniRead, iniHellcat, %myinipath%, CarsSkip, Hellcat
IniRead, iniHellcat_to, %myinipath%, CarsSkipTo, Hellcat_to
; Peugeotsr1
IniRead, iniPeugeotsr1, %myinipath%, CarsSkip, Peugeotsr1
IniRead, iniPeugeotsr1_to, %myinipath%, CarsSkipTo, Peugeotsr1_to
; Lamborghinicountach25th
IniRead, iniLamborghinicountach25th, %myinipath%, CarsSkip, Lamborghinicountach25th
IniRead, iniLamborghinicountach25th_to, %myinipath%, CarsSkipTo, Lamborghinicountach25th_to
; Srt8
IniRead, iniSrt8, %myinipath%, CarsSkip, Srt8
IniRead, iniSrt8_to, %myinipath%, CarsSkipTo, Srt8_to
; Saleens1
IniRead, iniSaleens1, %myinipath%, CarsSkip, Saleens1
IniRead, iniSaleens1_to, %myinipath%, CarsSkipTo, Saleens1_to
; Ferrarimonzasp1
IniRead, iniFerrarimonzasp1, %myinipath%, CarsSkip, Ferrarimonzasp1
IniRead, iniFerrarimonzasp1_to, %myinipath%, CarsSkipTo, Ferrarimonzasp1_to
; Jaguarxesvproject
IniRead, iniJaguarxesvproject, %myinipath%, CarsSkip, Jaguarxesvproject
IniRead, iniJaguarxesvproject_to, %myinipath%, CarsSkipTo, Jaguarxesvproject_to
; Lamborghinimiura
IniRead, iniLamborghinimiura, %myinipath%, CarsSkip, Lamborghinimiura
IniRead, iniLamborghinimiura_to, %myinipath%, CarsSkipTo, Lamborghinimiura_to
; Bugattieb110
IniRead, iniBugattieb110, %myinipath%, CarsSkip, Bugattieb110
IniRead, iniBugattieb110_to, %myinipath%, CarsSkipTo, Bugattieb110_to
; Porsche911gscoupe
IniRead, iniPorsche911gscoupe, %myinipath%, CarsSkip, Porsche911gscoupe
IniRead, iniPorsche911gscoupe_to, %myinipath%, CarsSkipTo, Porsche911gscoupe_to
; Nissanr390
IniRead, iniNissanr390, %myinipath%, CarsSkip, Nissanr390
IniRead, iniNissanr390_to, %myinipath%, CarsSkipTo, Nissanr390_to
; Ferrarienzo
IniRead, iniFerrarienzo, %myinipath%, CarsSkip, Ferrarienzo
IniRead, iniFerrarienzo_to, %myinipath%, CarsSkipTo, Ferrarienzo_to
; Lamborghiniessenza
IniRead, iniLamborghiniessenza, %myinipath%, CarsSkip, Lamborghiniessenza
IniRead, iniLamborghiniessenza_to, %myinipath%, CarsSkipTo, Lamborghiniessenza_to
; Porschecarrera
IniRead, iniPorschecarrera, %myinipath%, CarsSkip, Porschecarrera
IniRead, iniPorschecarrera_to, %myinipath%, CarsSkipTo, Porschecarrera_to
; Vulkan
IniRead, iniVulkan, %myinipath%, CarsSkip, Vulkan
IniRead, iniVulkan_to, %myinipath%, CarsSkipTo, Vulkan_to
; Sennagtr
IniRead, iniSennagtr, %myinipath%, CarsSkip, Sennagtr
IniRead, iniSennagtr_to, %myinipath%, CarsSkipTo, Sennagtr_to
; Zondar
IniRead, iniZondar, %myinipath%, CarsSkip, Zondar
IniRead, iniZondar_to, %myinipath%, CarsSkipTo, Zondar_to
; Centenario
IniRead, iniCentenario, %myinipath%, CarsSkip, Centenario
IniRead, iniCentenario_to, %myinipath%, CarsSkipTo, Centenario_to
; RaesrTacheon
IniRead, iniRaesrTacheon, %myinipath%, CarsSkip, RaesrTacheon
IniRead, iniRaesrTacheon_to, %myinipath%, CarsSkipTo, RaesrTacheon_to
; Trion
IniRead, iniTrion, %myinipath%, CarsSkip, Trion
IniRead, iniTrion_to, %myinipath%, CarsSkipTo, Trion_to
; Naran
IniRead, iniNaran, %myinipath%, CarsSkip, Naran
IniRead, iniNaran_to, %myinipath%, CarsSkipTo, Naran_to

;  *-----------------------------------------------------------------------*
;       |     Setting checkbox values whether its checked or not      |       
;  *------------------------------------------------------------------------*

Lancer := (iniLancer = 1) ? "Checked":0
Hellcat := (iniHellcat = 1) ? "Checked":0
Peugeotsr1 := (iniPeugeotsr1 = 1) ? "Checked":0
Lamborghinicountach25th := (iniLamborghinicountach25th = 1) ? "Checked":0
Srt8 := (iniSrt8 = 1) ? "Checked":0
Saleens1 := (iniSaleens1 = 1) ? "Checked":0
Ferrarimonzasp1 := (iniFerrarimonzasp1 = 1) ? "Checked":0
Jaguarxesvproject := (iniJaguarxesvproject = 1) ? "Checked":0
Lamborghinimiura := (iniLamborghinimiura = 1) ? "Checked":0
Bugattieb110 := (iniBugattieb110 = 1) ? "Checked":0
Porsche911gscoupe := (iniPorsche911gscoupe = 1) ? "Checked":0
Nissanr390 := (iniNissanr390 = 1) ? "Checked":0
Ferrarienzo := (iniFerrarienzo = 1) ? "Checked":0
Lamborghiniessenza := (iniLamborghiniessenza = 1) ? "Checked":0
Porschecarrera := (iniPorschecarrera = 1) ? "Checked":0
Vulkan := (iniVulkan = 1) ? "Checked":0
Sennagtr := (iniSennagtr = 1) ? "Checked":0
Zondar := (iniZondar = 1) ? "Checked":0
Centenario := (iniCentenario = 1) ? "Checked":0
RaesrTacheon := (iniRaesrTacheon = 1) ? "Checked":0
Trion := (iniTrion = 1) ? "Checked":0
Naran := (iniNaran = 1) ? "Checked":0

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
