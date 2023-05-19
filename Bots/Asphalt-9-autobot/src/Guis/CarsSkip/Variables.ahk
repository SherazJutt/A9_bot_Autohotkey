cars := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]
;  *--------------------------------------------------*
;               |     Cars variables      |       
;  *--------------------------------------------------*

for index, car in cars {
    IniRead, ini%car%, %myinipath%, CarsSkip, %car%
    IniRead, ini%car%_to, %myinipath%, CarsSkipTo, %car%_to
    ; MsgBox, ini%car% and skip to: ini%car%_to 
}

;  *-----------------------------------------------------------------------*
;       |     Setting checkbox values whether its checked or not      |       
;  *------------------------------------------------------------------------*

for index, car in cars {
    %car% := (ini . %car% = 1) ? "Checked":0
}