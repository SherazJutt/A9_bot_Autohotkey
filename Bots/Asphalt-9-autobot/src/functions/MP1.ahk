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
    currLeague := {}
    LeagueColors := [{id:1, label: "bronze", color: "0xD88560", clickX: 805, clickY: 142},{id:2, label: "silver", color: "0x96B2D4", clickX: 879, clickY: 135},{id:3, label: "gold", color: "0xF1CB30", clickX: 953, clickY: 141},{id:4, label: "platinum", color: "0x9365F8", clickX: 1023, clickY: 142},{id:5, label: "legend", color: "0xF5E2A4", clickX: 1095, clickY: 138}]
    BackUpLeagueColors := ["0xD88560", "0x96B2D4", "0xF1CB30", "0x9365F8", "0xF5E2A4"]

    for index, car in LeagueColors{
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 395, 343, 417, 368, car.color, 0, Fast RGB
        If (ErrorLevel = 0) {
            ; ResetColors
            for index, color in BackUpLeagueColors{
                LeagueColors[index].color := color
                ; MsgBox, "=> " . %color% . "=> " . %oldColor%
            }

            currLeague := car
            car.color := ""
            ; MsgBox, % car.color
            ; MsgBox, % newindex.color

            PosX:=currLeague.clickX
            PosY:=currLeague.clickY

            Click, 927, 634 Left, 1

            ; car selection screen
            Text:="|<>*133$247.w0Tzw7zs07zzzk1zs01yDzy00Tw0Tk00wDz07zXzss03zw1zw00zzzU0Dw00y7zz00Ds03s00S7y00zkzw800zy0zy00DzzU03y00T3zzU07s00w00D3y00DsTy000Dz0Tz003zzk01z00DVzzk03s00C007Vy003w7z07w7z07zVz1zzkTkTVzzkzzsTzw7w7z3zkz1z1y1zU7z3zV3zkzkzzsTwDkzzsTzwDzy7z3zVzsTVzkz0zk3zVzkVzsTsTzwDy7sTzwDzy7zz3zVzkzwDkzsTUDs1zkzsMTwDwDzy7z3wDzy7zz3zzVzkzsTy7sTwDk7w0zsTsQDy7y7zz3zzy7zz3zzVzzkzsTwDz3wDy7s1y0TzzwC7z3z3zzVzzz3zzVzzkzzsTzzy7zVy7z3w0z0Dzzy73zVzVzzkTzzVzzkzzsTzwDzzz3zkz3zVy4DU7zzy3kzkzkzzs0zzkzzsTzwDzy7zzzVzsTVzkz23k3zzz3sTsTkTzy01zs03wDzy00z3zzzkzwDkzsTVVs1zzzVwDw00DzzU0Dw01y7zz00TVzzzsTy7sTwDkkQ0zzzkz3y00Dzzw03y00z3zzU0DkzzzwDz3wDy7sQC0TzzkTVz00Dzzzs0z3zzVzzkzzsTzzy7zVy7z3wD30DzzsTkzU0DzzzzkTVzzkzzsTzwDzzz3zkz3zVy7VU7zzw00Tky7zzzzwDkzzsTzwDzy7zzzVzsTVzkz3sE3zVy007sT3zzyTy7sTzwDzy7zz3zVzkzwDkzsTVw01zky003wDkzzy7z3wDzy7zz3zzVzkzsTy7sTwDkz00zsT001y7sTzz3zVy7zz3zzVzzkzsTwDz3wDy7sTU0TwDVzkT3w7zzVzkz3zzVzzkzzsTwDy7zVy7z3wDs07w7UzwDVz3zzkTkTVzzkzzsTzw7w7z3zkz1z1y7y0003kzy7kzUzzw00Dk03s00w00y003zVzsTU00z3z0U03sTz3sTsTzy00Ds01w00S00TU03zkzwDs00zVzkM03wDzkwDw7zzU0Dw00y00D00Ds03zsTy7y00zkzsD07yDzsSDz3zzw0Ty00TU07U07z07zwDz3zk1zszyA"
            if (ok:=FindText(X:="wait", Y:=10, 100, 109, 368, 155, 0, 0, Text)){
                Sleep, 2000
                Click, %PosX%, %PosY% Left, 1
                Sleep, 1000

                Click, 370, 331 Left, 1
                Sleep, 2000
                Return True
            }

            Break
        }
    }

    Return False

}

TiersCheck(){
    isSkipped := False
    ; silver
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 1024, 619, 1042, 635, 0x96B2D4, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Sleep, 350
        Send, {Escape}
        Sleep, 2000
        Click, 807, 141 Left, 1
        Sleep, 1000
        Click, 363, 323 Left, 1
        Sleep, 3000
        isSkipped := True
    }
    ; Gold
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 1042, 617, 1062, 637, 0xF1CB30, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Sleep, 350
        Send, {Escape}
        Sleep, 2000
        Click, 882, 143 Left, 1
        Sleep, 1000
        Click, 363, 323 Left, 1
        Sleep, 3000
        isSkipped := True
    }
    ; Platinum
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 992, 618, 1006, 635, 0x9365F8, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Sleep, 350
        Send, {Escape}
        Sleep, 2000
        Click, 953, 141 Left, 1
        Sleep, 1000
        Click, 363, 323 Left, 1
        Sleep, 3000
        isSkipped := True
    }
    ; Legend
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 1018, 619, 1034, 635, 0xF0DDA1, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Sleep, 350
        Send, {Escape}-
        Sleep, 2000
        Click, 1025, 144 Left, 1
        Sleep, 1000
        Click, 363, 323 Left, 1
        Sleep, 3000
        isSkipped := True
    }

    Return isSkipped
}

isRefueling(){
    ; check if car have no fuel
    Text:="|<>*147$65.7zU70D1kDzkzzUS0w3UTzlzzUw1s70zzrkD1s7UC1k7j0C3kS0Q3U7y0Q7Vs0s70Dw0sD3k1kC0Ts00SD03UQ0zk00ww070s1vw01ts0C1k3rzU3rU0Q3U77zs7zU0s70S3zsDzU1kDzw0DkTj03UTzk07UyD070zz007VwD0C1k0D0D3kS0Q3U0S0S7US0s700w0wD0S1kC01s3kS0w3UQ01zzUw0w70s03zy1s1sC1k01zs1k1sQ3U0E"
    if (ok:=FindText(X, Y, 1049, 612, 1157, 668, 0, 0, Text)){
        Return True
    }

}

OwnsThisCar(){
    ; get blueprint
    Text:="|<>*148$68.zzU3US073zzzzw1s7k1kzzzzzUS1w0QDzzw1w7UTU707kD0D1s7s1k0w3k3kS1z0Q0D0w0w7UTk703kD0D1s7y1k0w3k3kS1vUQ0D0w0w7USw703kD0D1s7bVk0w3k3kS1tsQ0D0zzw7USD703kDzy1s7Xlk0w3zz0S1sSQ0D0zzU7US7b03kD1s1s7Uxk0w3kS0S1s7w0D0w3k7US1z03kD0w1s7UDk0w3k7US1s3w0D0w1s7US0T03kD0D1s7U7k0w3k3kS1s0w0D0w0S3US0D03k8"
    if (ok:=FindText(X, Y, 1135, 609, 1222, 648, 0, 0, Text)){
        Sleep, 1000
        Return False
    }Else{
        ; get KEY
        Text:="|<>*151$99.T00Ds3zzzVz007wDzw03y0zzzw7w00zVzzU0zU7zzzUzU0DsDzw07w0zzzw3w01z1zzU1z07zzzUTk0TkDzw0Tk0zU001y03y1zzU7w07w000Ds0TUDzw0zU0zU000z07w1zzUDs07w0007w0z0Dzw3y00zU000TUDs1zzUTU07w0003w1y0Dzw7w00zU000TkTk1zzVz007w0001y3w0DzwTk00zU000DszU1zzXy007w0000z7s0DzwzU00zU0007wz00zzjs007zzw00Tjk07zxz000zzzk03zy00zzzw007zzy00DzU07zzzU00zzzk01zw00yzzy007zzy007z007rzzs00zU0000zs00yzwz007w00003y007rz3w00zU0000Tk00yzkTk07w00003y007ry1y00zU0000Dk000zUDs07w00001y0007w0zU0zU0000Dk000zU3w07w00001y0007w0Tk0zU0000Dk00yzU1z07w00001y007zw07s0zU0000Dk00zzU0zU7w00001y007zw03y0zk0000Dk00zzU0Dk7zzzU01y007zw01z0zzzw00Dk00zzU07w7zzzU01y007vs00TUTzzw00DU00zT001w3zzz001w007o"
        if (ok:=FindText(X, Y, 1089, 606, 1203, 657, 0, 0, Text)){
            Sleep, 1000
            Return False
        }
    }

    Return True
}

SelectMPCarToPlay(){

    ; (i) icon to confirm mp screen
    Text:="|<>*144$3.zz0zzzzzzzzU"
    if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text)){
        isMpCarToPlayScreen := False

        Loop, 30{
            ; leaderboard last chracters check to confirm if leaderboard button is available
            Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"
            if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text)) {
                Sleep, 1000
                isMpCarToPlayScreen := True
                Break
            }Else{
                Click, 977, 632 Left, 1
                Sleep, 1000
            }
        }

        If (isMpCarToPlayScreen){

            Click, 927, 634 Left, 1

            ; car selection screen
            Text:="|<>*133$247.w0Tzw7zs07zzzk1zs01yDzy00Tw0Tk00wDz07zXzss03zw1zw00zzzU0Dw00y7zz00Ds03s00S7y00zkzw800zy0zy00DzzU03y00T3zzU07s00w00D3y00DsTy000Dz0Tz003zzk01z00DVzzk03s00C007Vy003w7z07w7z07zVz1zzkTkTVzzkzzsTzw7w7z3zkz1z1y1zU7z3zV3zkzkzzsTwDkzzsTzwDzy7z3zVzsTVzkz0zk3zVzkVzsTsTzwDy7sTzwDzy7zz3zVzkzwDkzsTUDs1zkzsMTwDwDzy7z3wDzy7zz3zzVzkzsTy7sTwDk7w0zsTsQDy7y7zz3zzy7zz3zzVzzkzsTwDz3wDy7s1y0TzzwC7z3z3zzVzzz3zzVzzkzzsTzzy7zVy7z3w0z0Dzzy73zVzVzzkTzzVzzkzzsTzwDzzz3zkz3zVy4DU7zzy3kzkzkzzs0zzkzzsTzwDzy7zzzVzsTVzkz23k3zzz3sTsTkTzy01zs03wDzy00z3zzzkzwDkzsTVVs1zzzVwDw00DzzU0Dw01y7zz00TVzzzsTy7sTwDkkQ0zzzkz3y00Dzzw03y00z3zzU0DkzzzwDz3wDy7sQC0TzzkTVz00Dzzzs0z3zzVzzkzzsTzzy7zVy7z3wD30DzzsTkzU0DzzzzkTVzzkzzsTzwDzzz3zkz3zVy7VU7zzw00Tky7zzzzwDkzzsTzwDzy7zzzVzsTVzkz3sE3zVy007sT3zzyTy7sTzwDzy7zz3zVzkzwDkzsTVw01zky003wDkzzy7z3wDzy7zz3zzVzkzsTy7sTwDkz00zsT001y7sTzz3zVy7zz3zzVzzkzsTwDz3wDy7sTU0TwDVzkT3w7zzVzkz3zzVzzkzzsTwDy7zVy7z3wDs07w7UzwDVz3zzkTkTVzzkzzsTzw7w7z3zkz1z1y7y0003kzy7kzUzzw00Dk03s00w00y003zVzsTU00z3z0U03sTz3sTsTzy00Ds01w00S00TU03zkzwDs00zVzkM03wDzkwDw7zzU0Dw00y00D00Ds03zsTy7y00zkzsD07yDzsSDz3zzw0Ty00TU07U07z07zwDz3zk1zszyA"
            if (ok:=FindText(X:="wait", Y:=10, 100, 109, 368, 155, 0, 0, Text)){
                Sleep, 2000
                loop 2{
                    Sleep, 350
                    Send, {enter}
                }

                Return True
            }
        }Else{
            Gosub, ScriptStart
        }
    }
}

PlayMPRace(){
    ; Play Button

    Text:="|<>*123$71.zz0S003s1s0zzz0w007s1s1vzz1s00Tk3k3r0S3k00zU3kDC0S7U01rU7USQ0wD003j07Vss1sS00DC0D3lk3kw00SS0DD3U7Vs00sw0SS70D3k03ks0RsC0S7U07Vk0zkQ1sD00C3k0z0zzkS00Q7U1y1zz0w01s701s3zw1s03kD03k7003k07zy07UC007U0Tzw0D0Q00D00zzs0S0s00S01s1s0w1k00w03U3k1s3U01zzD03U3k7003zyS07U7UC007zws0D0D0E"

    if (ok:=FindText(X:="wait", Y:=10, 1058, 624, 1146, 657, 0, 0, Text)){
        Click, 1183, 634 Left, 1
    }Else{
        Gosub, ScriptStart
    }
}
