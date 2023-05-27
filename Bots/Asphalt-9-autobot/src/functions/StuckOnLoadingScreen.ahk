StuckOnLoadingScreen() {

    isStuck := true 

    Loop, 60 {
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 650, 356, 679, 378, 0x000000, 0, Fast RGB
        If (ErrorLevel = 0) {
            Sleep, 1000
        } Else {
            isStuck := False 
            Break
        }
    }

    return isStuck 
}
