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
    BackUpLeagueColors := [{id:1, label: "bronze", color: "0xD88560", clickX: 805, clickY: 142},{id:2, label: "silver", color: "0x96B2D4", clickX: 879, clickY: 135},{id:3, label: "gold", color: "0xF1CB30", clickX: 953, clickY: 141},{id:4, label: "platinum", color: "0x9365F8", clickX: 1023, clickY: 142},{id:5, label: "legend", color: "0xF5E2A4", clickX: 1095, clickY: 138}]

    for index, car in LeagueColors{
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 395, 343, 417, 368, car.color, 0, Fast RGB
        If (ErrorLevel = 0) {
            currLeague := car
            car.color := ""
            newindex := BackUpLeagueColors[index]
            MsgBox, % newindex.color
            Break
        }
    }

    PosX:=currLeague.clickX
    PosY:=currLeague.clickY

    Click, 927, 634 Left, 1

    ; car selection screen
    Text:="|<>*133$247.w0Tzw7zs07zzzk1zs01yDzy00Tw0Tk00wDz07zXzss03zw1zw00zzzU0Dw00y7zz00Ds03s00S7y00zkzw800zy0zy00DzzU03y00T3zzU07s00w00D3y00DsTy000Dz0Tz003zzk01z00DVzzk03s00C007Vy003w7z07w7z07zVz1zzkTkTVzzkzzsTzw7w7z3zkz1z1y1zU7z3zV3zkzkzzsTwDkzzsTzwDzy7z3zVzsTVzkz0zk3zVzkVzsTsTzwDy7sTzwDzy7zz3zVzkzwDkzsTUDs1zkzsMTwDwDzy7z3wDzy7zz3zzVzkzsTy7sTwDk7w0zsTsQDy7y7zz3zzy7zz3zzVzzkzsTwDz3wDy7s1y0TzzwC7z3z3zzVzzz3zzVzzkzzsTzzy7zVy7z3w0z0Dzzy73zVzVzzkTzzVzzkzzsTzwDzzz3zkz3zVy4DU7zzy3kzkzkzzs0zzkzzsTzwDzy7zzzVzsTVzkz23k3zzz3sTsTkTzy01zs03wDzy00z3zzzkzwDkzsTVVs1zzzVwDw00DzzU0Dw01y7zz00TVzzzsTy7sTwDkkQ0zzzkz3y00Dzzw03y00z3zzU0DkzzzwDz3wDy7sQC0TzzkTVz00Dzzzs0z3zzVzzkzzsTzzy7zVy7z3wD30DzzsTkzU0DzzzzkTVzzkzzsTzwDzzz3zkz3zVy7VU7zzw00Tky7zzzzwDkzzsTzwDzy7zzzVzsTVzkz3sE3zVy007sT3zzyTy7sTzwDzy7zz3zVzkzwDkzsTVw01zky003wDkzzy7z3wDzy7zz3zzVzkzsTy7sTwDkz00zsT001y7sTzz3zVy7zz3zzVzzkzsTwDz3wDy7sTU0TwDVzkT3w7zzVzkz3zzVzzkzzsTwDy7zVy7z3wDs07w7UzwDVz3zzkTkTVzzkzzsTzw7w7z3zkz1z1y7y0003kzy7kzUzzw00Dk03s00w00y003zVzsTU00z3z0U03sTz3sTsTzy00Ds01w00S00TU03zkzwDs00zVzkM03wDzkwDw7zzU0Dw00y00D00Ds03zsTy7y00zkzsD07yDzsSDz3zzw0Ty00TU07U07z07zwDz3zk1zszyA"
    if (ok:=FindText(X:="wait", Y:=10, 100, 109, 368, 155, 0, 0, Text))
    {
        Sleep, 2000
        Click, %PosX%, %PosY% Left, 1
        Sleep, 1000

        Click, 370, 331 Left, 1
        Sleep, 2000
    }

}