PressEscape(count){
    Loop, %count%{
        Sleep, 500
        Send , {Escape}
        Sleep, 500
    }
}

CheckGame(){

    isRunning := True

    IfWinExist, Asphalt 9: Legends
    {
        WinActivate, Asphalt 9: Legends
        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
        WinRestore, Asphalt 9: Legends
    }else{
        Reload ; Restart the script
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

exitGamePopUp(){

    Text:="|<>*116$63.U0D3zVwS00801sTsD1k0000D1z1sC00001wDsT1s011zzUy3sDw7sTzy7Uz1zkz3zzkQDsDy7sTzz31z1zkz3zzs8TsDy7sTzzU3z1zkz00zy0zsDy7s03zk7z1zkz00Ty0zsDy7s03zk7z1zkz1zzw0zsDy7sTzzU3z1zkz3zzs8TsDy7sTzz31z1zkz3zzkQ7sDy7sTzy7kz1zkz3zzUy3sDy7s3zwDsT1zkz00D1z1sDy7s01sTwD1zkz00D3zVwTyDw"

    if (ok:=FindText(X, Y, 556, 241, 633, 280, 0, 0, Text))
    {
        PressEscape(1)
        Sleep, 1000
    }

}

; need to include funtions like if gotany rewards or completed milestone or any other