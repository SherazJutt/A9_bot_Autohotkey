PressEscape(count){
    Loop, %count%{
        Sleep, 500
        Send , {Escape}
        Sleep, 500
    }
}

CheckGame(){
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
}

FullScreenAD(){

    Text:="|<>*117$61.zk600C0k1XTy3U0DUQ1lzzVk07kD1ky1ks03s3UsT0MQ03g1sMDUAC01r0QQ7k6700nUCC3s33U0sk3i1w3Vk0QQ1z0z1ks0CC0T0PzsQ0630DUBzsC071k3U6s0703zs1k0M03U1zw0s0A01k1sC0Q0q00s0s3UC0T00TyQ1k70DU0DzA0s3U7k07za0A1k3E"

    if (ok:=FindText(X, Y, 909, 544, 997, 585, 0, 0, Text))
    {
        Click, 1058, 138 Left, 1
    }
}

RewardsNext(){

    Text:="|<>*149$70.000000000001s1sDzls1tzzbU7Uzz3k7bzyT0S3zwD0wTztw1sC00S3k3k7s7Us00sS0D0TkS3U03ls0w1z1sC007D03k7y7Us00Sw0D0SsS3U00zU0w1vlsDz03w03k7b7Uzy07k0D0SSS3zs0z00w1stsC003y03k7XrUs00Ts0D0S7y3U01vk0w1sDsC00D703k7UzUs00wS0D0S1y3U07Us0w1s7sC00S3k3k7UDUzy3k70D0S0y3zwD0S0w1s1sDzls0s3k3030zy301U60U"

    if (ok:=FindText(X, Y, 1103, 628, 1190, 672, 0, 0, Text))
    {
        Click, 1207, 642 Left, 1
    }
}

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
            isLoaded := True
            Loop, 10{
                ; check if seasonal events tabe active
                CoordMode, Pixel, Screen
                PixelSearch, FoundX, FoundY, 251, 648, 276, 674, 0xFFFFFF, 0, Fast RGB
                If (ErrorLevel = 0){
                    PressEscape(1)
                    Break
                }else{
                    ; click on seasonal events tabe to active
                    Click, 349, 637 Left, 1
                    PressEscape(1)
                }
            }
            Break
        }
    }
}
; need to include funtions like if gotany rewards or completed milestone or any other