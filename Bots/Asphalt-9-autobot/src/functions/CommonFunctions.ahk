PressEscape(count){
    Loop, %count%{
        Sleep, 500
        Send , {Escape}
        Sleep, 500
    }
}

CheckInternet(){
    Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"
    if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text)) {
        Sleep, 1000
        Click, 693, 500 Left, 1
        Sleep, 2500
        Return False
    }
    Return True
}

CheckGame(){

    isRunning := True

    IfWinExist, Asphalt 9: Legends
    {
        WinActivate, Asphalt 9: Legends
        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
        WinRestore, Asphalt 9: Legends
    }else{
        Gosub, ScriptStart
        isRunning := False
    }

    Return isRunning
}

FullScreenAD(){

    Text:="|<>*48$29.bzzzm7zzz07zzw47zzkQ7zz1w7zw7w7zkTw7z1zw7w7zw7kTzw71zzw07zzw0Tzzw1zzzs7zzzk7zzz07zzw47zzkQ7zz1w7zw7w7zkTw7z1zw7w7zw7kTzw71zzw47zzw0TzzwNzzzxk"

    if (ok:=FindText(X, Y, 1030, 124, 1074, 172, 0, 0, Text)){
        Click, 1052, 147 Left, 1
        Sleep, 1000
    }

    Text:="|<>*65$29.bzzzW7zzz07zzw47zzkQ7zz1w7zs7w7zkTw7z1zw7w7zw7kTzw71zzw07zzw0Tzzw1zzzs3zzzk7zzz07zzw47zzkQ7zy1w7zw7w7zkTw7z1zw7w7zw7UTzw71zzw47zzw4TzzwNzzzxk"

    if (ok:=FindText(X, Y, 1030, 124, 1073, 172, 0, 0, Text)){
        Click, 1052, 147 Left, 1
        Sleep, 1000
    }
}

RewardsNext(){

    Text:="|<>*149$70.000000000001s1sDzls1tzzbU7Uzz3k7bzyT0S3zwD0wTztw1sC00S3k3k7s7Us00sS0D0TkS3U03ls0w1z1sC007D03k7y7Us00Sw0D0SsS3U00zU0w1vlsDz03w03k7b7Uzy07k0D0SSS3zs0z00w1stsC003y03k7XrUs00Ts0D0S7y3U01vk0w1sDsC00D703k7UzUs00wS0D0S1y3U07Us0w1s7sC00S3k3k7UDUzy3k70D0S0y3zwD0S0w1s1sDzls0s3k3030zy301U60U"

    if (ok:=FindText(X, Y, 1103, 628, 1190, 672, 0, 0, Text))
    {
        Click, 1207, 642 Left, 1
        Sleep, 3000
    }
}

ExitGamePopUp(){

    Text:="|<>*116$63.U0D3zVwS00801sTsD1k0000D1z1sC00001wDsT1s011zzUy3sDw7sTzy7Uz1zkz3zzkQDsDy7sTzz31z1zkz3zzs8TsDy7sTzzU3z1zkz00zy0zsDy7s03zk7z1zkz00Ty0zsDy7s03zk7z1zkz1zzw0zsDy7sTzzU3z1zkz3zzs8TsDy7sTzz31z1zkz3zzkQ7sDy7sTzy7kz1zkz3zzUy3sDy7s3zwDsT1zkz00D1z1sDy7s01sTwD1zkz00D3zVwTyDw"

    if (ok:=FindText(X, Y, 556, 241, 633, 280, 0, 0, Text))
    {
        PressEscape(1)
        Sleep, 1000
    }

}
TdCheck(){
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 897, 647, 916, 677, 0xC0F712, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Click, 858, 657 Left, 1
        Sleep, 1000
    }
}

TdCheckInRace(){
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 208, 133, 244, 150, 0xFE0101, 0, Fast RGB
    If (ErrorLevel = 0) {
        Send, {Tab}
    }
}

Resume(){
    Text:="|<>*152$13.zzTzzzzzvU1k0s0Q0C0703ztzwzyQ0C0703U1k0s0Q0D07zzzzzyU"
    if (ok:=FindText(X, Y, 1130, 227, 1150, 257, 0, 0, Text)){
        Send, {Escape}
    }
}
WhereToGetBpsScreen(){
    Text:="|<>*160$32.zzzzzyTzzyD3zzz3UTzzUy3zzkTkTzsDy3zw7zUTy3zw3z1zzkTUzzy3kTzzkMDzzy07zzzU3zzzw1zzzzUTzzzk3zzzs0Tzzw43zzy3UTzz1y3zzUzkTzkTy3zsDzkTw7zw3y3zzkT1zzy3UzzzkQTzzyDjzzzrzzzzzs"
    if (ok:=FindText(X, Y, 1142, 92, 1188, 136, 0, 0, Text))
    {
        Click, 1163, 116 Left, 1
        Return True
    }
    Return False
}

LockedOrRefueling(){

    isRefuelingOrLocked := False

    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 1200, 630, 1214, 657, 0xFFFFFF, 0, Fast RGB
    If (ErrorLevel = 0) {
        isRefuelingOrLocked := True
    }

    Return isRefuelingOrLocked
}

TokensColorCheckToVerifyHomeScreen(){

    Text:="|<>*72$29.zzrzzzy3zzzs3zzz01zzw01zzk00zy000zs0k0z03k0Q07k0E0Tk0E0nU1U37U3067070Tz0S1zy0w3zy1wA0S7sM0QDk000Tk001zU003z0007z000Ty000zw001y"
    if (ok:=FindText(X, Y, 787, 42, 823, 80, 0, 0, Text)){
        Return True
    }

    Return False
}

; This shows sometimes After the MP race is completed
ConnectingToTheServer(){
    isError := True

    Loop, 60{
        Text:="|<>*71$43.zzzzzzzs0Dzzzzs00zzzzw00Dzzzy007zzzz3z3zzzzVzkzzzzkzsTzzzsTwDzzzwDy7zzzy7z3zzzz3zVzzzzVzUzzzzkTUzzzzs00Tzzzw00Tzzzy00zzzzz1sTzzzzVw7zzzzkz3zzzzsTUzzzzwDsTVsS67w7kwD33z3sS7VVzUwD3kkzsS7VsQTwD3kwDzzzzzzy"
        if (ok:=FindText(X, Y, 578, 624, 628, 658, 0, 0, Text))
        {
            Sleep, 1000
        }Else{
            isError := False
            Break
        }
    }

    if(isError){
        Gosub, ScriptStart
    }
}

PlayButton(){
    isPlayButton:= False

    Text:="|<>*148$145.s1kTz01z07zU0DU1zs0zz0DsQ0sDzs3zs7zw07k1zz0TzUTzC0Q7zy3zy3zz07s0zzkDzkTzr0C3kD1sD1s7U3y0S1w700T1vU71s3Vs3kw1s1r0D0S3U0D0Rk3Uw1kw1sS0w1vU7U71k070Cs1kS0sS0wD0S0xs3k3Us03U7Q0sD0QD0A7UD0QQ1s1kQ01k0C0Q7UC7U03k7UCC0w0sC00w070C3k73k01s3kD7US0Q700TU3U71s3Vs00w1k73kD0C3zs7z1k3Uw3kwTsTzs3Us7U71zw1zws1kTzsSDwDzs3kQ3k3Uzy0DzQ0sDzsD3y7zs1sD1s1kQ000Ti0Q7zk7UD3kw0s7Uw0sC0001z0C3k03k7VsS0TzkS0Q70000zU71s01s3kw7UTzsD0C3U0C0Tk3Uw00w1sS3kDzy7U71k070Ds1kS00S0wD0s7073k7Us03k7y1sD00DUw7US7U3Vs7kQ01s7jzw7U03zy3k73k1szzkDzkTznzw3k00zy1s3lk0wTzk7zsDzkTs1k007w0w0ss0CDzk3zw1zV"
    if (ok:=FindText(X:="wait", Y:=10, 103, 617, 274, 663, 0, 0, Text)){
        isPlayButton:= True
    }
    Return isPlayButton
}

; need to include funtions like if gotany rewards or completed milestone or any other
; add network check