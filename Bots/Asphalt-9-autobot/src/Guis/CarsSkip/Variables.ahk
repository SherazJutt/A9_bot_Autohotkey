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