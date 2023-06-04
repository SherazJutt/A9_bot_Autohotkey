SeasonalEvents(){

    isLoaded := False

    ; seasonal events red
    Loop, 60 {
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 240, 603, 270, 625, 0xFF0049, 0, Fast RGB
        If (ErrorLevel = 0){
            ; click on seasonal events tabe to active
            Click, 349, 637 Left, 1
            Sleep, 1000
        }else{
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 251, 648, 276, 674, 0xFFFFFF, 0, Fast RGB
            If (ErrorLevel = 0){
                isLoaded := True
                Break
            }else{
                If (MainMenuLoadedCheck()) {
                    Click, 349, 637 Left, 1
                    Sleep, 1500
                }Else{
                    Gosub, ScriptStart
                }
            }
        }
    }
    Return isLoaded
}

EnterEventsTab(){

    isEventsLoaded := False

    ; if SeasonalEvents tab is active and loaded
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 256, 643, 269, 654, 0xFFFFFF, 0, Fast RGB
    If (ErrorLevel = 0){
        ; click on events tab
        Loop, 2{
            Click , 465, 643 left, 1
            Sleep, 1000
        }
    }Else{
        Gosub, ScriptStart
    }

    Sleep, 3000

    ; green underline check to verify events tab start
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 71, 690, 95, 700, 0xC3FB12, 0, Fast RGB
    If (ErrorLevel = 0){
        isEventsLoaded := True
    }Else{
        ; captured claim to check if there is event claim screen
        Text:="|<>*168$54.Tss0S1lsDzws0T1nsDwws0T1nsDsQs0T1nwTsAs0zVnwTs0s0zVnwTs0s0vVnyzs0s1lVnrzs0s1llnbrs0s1zlnbnsAs3zlnXXsQs3ztnXXwww3UtnU3zwzzUtnU3TsTz0NlU3U"

        if (ok:=FindText(X:="wait", Y:=18, 653, 411, 722, 438, 0, 0, Text)){
            Click, 778, 372 Left, 1
            Sleep, 750
            Loop, 20{
                Send, {PgUp}
                Sleep, 250
            }
        }Else{
            Gosub, ScriptStart
        }
    }
    Return isEventsLoaded
}
