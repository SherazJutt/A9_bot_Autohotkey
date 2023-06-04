LeagueDetection(){

    ; (i) icon to confirm mp screen
    Text:="|<>*144$3.zz0zzzzzzzzU"
    if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text)){
        isMpScreen := False

        Loop, 30{
            ; leaderboard last chracters check to confirm if leaderboard button is available
            Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"
            if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text)) {
                Sleep, 1000
                isMpScreen := True
                Break
            }Else{
                Click, 977, 632 Left, 1
                Sleep, 1000
            }
        }
        If (!isMpScreen){
            Gosub, ScriptStart
        }
    }

    ; league detection main
    currLeague := {label:"", color:"red"}
    LeagueColors := [
        {id:1,label: "bronze", color: "0xD88560"},
        {id:2,label: "silver", color: "0x96B2D4"},
        {id:3,label: "gold", color: "0xF1CB30"},
        {id:4,label: "platinum", color: "0x9365F8"},
        {id:5,label: "legend", color: "0xF5E2A4"},
    ]

    Loop, % LeagueColors.Length()
    {
        LeagueColor := LeagueColors[A_Index]
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 395, 343, 417, 368, % LeagueColor.color, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            currLeague := LeagueColor
        }
    }

    ; MsgBox, % currLeague["label"] . " => " . currLeague["color"]

    ; check upgrade text to verify selected car screen
    Text:="|<>*148$145.s1kTz01z07zU0DU1zs0zz0DsQ0sDzs3zs7zw07k1zz0TzUTzC0Q7zy3zy3zz07s0zzkDzkTzr0C3kD1sD1s7U3y0S1w700T1vU71s3Vs3kw1s1r0D0S3U0D0Rk3Uw1kw1sS0w1vU7U71k070Cs1kS0sS0wD0S0xs3k3Us03U7Q0sD0QD0A7UD0QQ1s1kQ01k0C0Q7UC7U03k7UCC0w0sC00w070C3k73k01s3kD7US0Q700TU3U71s3Vs00w1k73kD0C3zs7z1k3Uw3kwTsTzs3Us7U71zw1zws1kTzsSDwDzs3kQ3k3Uzy0DzQ0sDzsD3y7zs1sD1s1kQ000Ti0Q7zk7UD3kw0s7Uw0sC0001z0C3k03k7VsS0TzkS0Q70000zU71s01s3kw7UTzsD0C3U0C0Tk3Uw00w1sS3kDzy7U71k070Ds1kS00S0wD0s7073k7Us03k7y1sD00DUw7US7U3Vs7kQ01s7jzw7U03zy3k73k1szzkDzkTznzw3k00zy1s3lk0wTzk7zsDzkTs1k007w0w0ss0CDzk3zw1zV"
    if (ok:=FindText(X:="wait", Y:=10, 103, 617, 274, 663, 0, 0, Text)){

    }

}