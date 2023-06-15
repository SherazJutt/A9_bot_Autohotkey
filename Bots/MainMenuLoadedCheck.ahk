MainMenuLoadedCheck(){

    isLoaded := false

    Loop, 20 {
        CoordMode , Pixel, Screen
        PixelSearch, FoundX, FoundY, 10, 61, 35, 87, 0xB00039, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            isLoaded := True
            Break
        } Else
        {
            sleep, 1000
            Send, {Escape}
            sleep, 1000
            CheckGame()
            ExitGamePopUp()
            RewardsNext()
        }
        Sleep, 1000
    }
    return isLoaded
}
CheckGame(){
    If WinExist("Asphalt 9: Legends"){
        WinActivate, Asphalt 9: Legends
        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
        WinRestore, Asphalt 9: Legends
    } Else {
        Gosub, script_start
    }
}
ExitGamePopUp(){

    Text:="|<>*116$63.U0D3zVwS00801sTsD1k0000D1z1sC00001wDsT1s011zzUy3sDw7sTzy7Uz1zkz3zzkQDsDy7sTzz31z1zkz3zzs8TsDy7sTzzU3z1zkz00zy0zsDy7s03zk7z1zkz00Ty0zsDy7s03zk7z1zkz1zzw0zsDy7sTzzU3z1zkz3zzs8TsDy7sTzz31z1zkz3zzkQ7sDy7sTzy7kz1zkz3zzUy3sDy7s3zwDsT1zkz00D1z1sDy7s01sTwD1zkz00D3zVwTyDw"

    if (ok:=FindText(X, Y, 556, 241, 633, 280, 0, 0, Text))
    {
        Sleep, 1000
        Send, {Escape}
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