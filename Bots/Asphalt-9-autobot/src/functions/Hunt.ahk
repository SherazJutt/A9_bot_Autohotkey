EnterHuntTab(){

    isFound:= False

    Loop, 30{

        ; hunt card
        Text:="|<>*132$94.1zUzz1z001zzz0Tw7y3zw7w001zzs1zkTsDzkTk003zzU3z1zUzz1z0007zy0Dw7y3zw7w3z0Tzk0zkTsDzkTkTy1zz01z1zUzz1z1zw3zw47w7y3zw7w7zkDzUETkTsDzkTkTz0zy31z1zUzz1z1zw3zsC3w7y3zw7w7zkDzUsDkTsDzkTkTz0zw7Uz1zUzz1z1zw3zkT3w7y3zw7w7zkDz1w7kTsDzkTkTz1zs7kT1zUzz1z1zs7zUz1w7y3zw7w000Ty3y3kTsDzkTk003zsDsD1zUzz1z000Tz1zUw7y3zw7w003zw7y1kTsDzkTk00TzkTw71zUzz1z1y1zy1zUQ7y3zw7w7w3zs001kTsDzkTkTkDzU0031zUzz1z1zUTy000A7y3zw7w7y1zk000kTsDzkTkTw3z1zy11zUzy1z1zkDw7zs47y1zkDw7zUTUTzkETw000zkTy1y3zz11zk007z1zw3sDzw07zU00Tw7zkDUzzs0Tz007zkTzUw3zzUXzzU1zzVzz3sTzz2"

        if (ok:=FindText(X, Y, 359, 217, 466, 266, 0, 0, Text)) {
            Loop, 2{
                Send, {Enter}
                Sleep, 1000
            }

            isFound:= True
            Break

        }Else{

            Send, {PgDn}
            Sleep, 1800
            ; green underline check to verify events tab start
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 1088, 692, 1141, 703, 0xC3FB12, 0, Fast RGB
            If (ErrorLevel = 0){
                Break
            }
        }
    }

    Return isFound
}

isRaceScreen(){

    isRaceScreen:= False

    Text:="|<>*119$69.zz01y03zk7zzzw0Dk0zz0zzzzk1y0Dzw7zz0S0Ts1k7Us0s1k3z0C0Q7070C0Qs3k3Us0s1k3b0S0Q7070C0ww3k00s0s1k73US007070C0sQ3k00zyw3k73US007zrzw1sS3k00zyzz0C1kS00707zk1kC3k00s0sC0TzsS0Q7071s3zz3k3Us0s70TzsS0Q7070w7U71k3Us0s3Uw0wC0w7070S703VzzUzzs1ks0Q7zs7zz0DD03kTy0zzU"
    if (ok:=FindText(X:="wait", Y:=10, 1046, 638, 1123, 667, 0, 0, Text)) {
        isRaceScreen:= True
    }

    Return isRaceScreen
}

TicketCheck(){
    canPlay := True

    Click, 1162, 135 Left, 1

    Text:="|<>*131$127.003zs007s007kTsDzzUzzU00Tw003w003sDw7zzkTzk007y001y001w7y3zzsDzs003z000z000y3z1zzw7zw7y0zUzzzUzzz1zUzzy3zy3zkTkTzzkTzzUzkTzz1zz1zsDsDzzsDzzkTsDzzUzzUzw7w7zzw7zzsDw7zzkTzkTy3y3zzy3zzw7y3zzsDzsDz1z1zzz1zzy3z1zzw7zw7zUzUzzzUzzz1zUzzy3zy3zkTkTzzkTzzUzkTzz1zz1zsDsDzzsDzzkTsDzzUzzUzw7w7zzw7zzsDw7zzkTzkTy3y007y3zzw7y3zzsDzsDy1z003z003y3z1zzw7zw001zU01zU01z1zUzzy3zy000zk00zk00zUzkTzz1zz000zsDzzs00TkTsDzzUzzU01zw7zzw7zzsDw7zzkTzkTUzy3zzy3zzw7y3zzsDzsDkDz1zzz1zzy3z1zzw7zw7w7zUzzzUzzz1zUzzy3zy3y1zkTzzkTzzUzkTzz1zz1z0zsDzzsDzzkTsDzzUzzUzkDw7zzw7zzsDw7zzkTzkTw7y3zzy3zzw7y3zzsDzsDy3z1zzz1zzy3z1zzw7zw7z0zU00TUzzz1zU00S0003zkTk00DkTzzUzk00D0001zs7s007sDzzkTs007U000zy3w003w7zzsDw003k008zzVz003z7zzyDy003w00A"

    if (ok:=FindText(X:="wait", Y:=10, 433, 170, 578, 222, 0, 0, Text)) {

        ; 0
        Text:="|<>*119$28.zzzzzz00TzU00Tw000zU001w0003k00060Ty0M3zw1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM3zw1U7zk70000Q0003s000Tk003zU00Tzk07zzzzzs"
        if (ok:=FindText(X, Y, 625, 310, 676, 370, 0, 0, Text)){
            PressEscape(1)
            canPlay := False
        }

        ; 1
        Text:="|<>*113$17.zzzzkDy0Ds0T00s01U030060UA70MS0nw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs7zzy"
        if (ok:=FindText(X, Y, 627, 308, 671, 369, 0, 0, Text)){
            PressEscape(1)
            canPlay := False
        }
    }

    If (canPlay){
        PressEscape(1)
    }

    Return canPlay
}

SelectCarToPlayHunt(){

    Click, 1177, 643 Left, 1

    ; click on race button
    Text:="|<>*134$247.w0Tzw7zs07zzzk1zs01yDzy00Tw0Tk00wDz07zXzss03zw1zw00zzzU0Dw00y7zz00Ds03s00S7y00zkzw800zy0zy00DzzU03y00T3zzU07s00w00D3y00DsTy000Dz0Tz003zzk01z00DVzzk03s00C007Vy003w7z07w7z07zVz1zzkTkTVzzkzzsTzw7w7z3zkz3z1y1zU7z3zV3zkzkzzsTwDkzzsTzwDzy7z3zVzsTVzkz0zk3zVzkVzsTsTzwDy7sTzwDzy7zz3zVzkzwDkzsTUDs1zkzsMTwDwDzy7z3wDzy7zz3zzVzkzsTy7sTwDk7w0zsTsQDy7y7zz3zzy7zz3zzVzzkzsTwDz3wDy7s1y0TzzwC7z3z3zzVzzz3zzVzzkzzsTzzy7zVy7z3w0z0Dzzy73zVzVzzkTzzVzzkzzsTzwDzzz3zkz3zVy4DU7zzy3kzkzkzzs0zzkzzsTzwDzy7zzzVzsTVzkz23k3zzz3sTsTkTzy01zs03wDzy00z3zzzkzwDkzsTVVs1zzzVwDw00DzzU0Dw01y7zz00TVzzzsTy7sTwDksQ0zzzkz3y00Dzzw03y00z3zzU0DkzzzwDz3wDy7sQC0TzzkTVz00Dzzzs0z3zzVzzkzzsTzzy7zVy7z3wD30DzzsTkzU0DzzzzkTVzzkzzsTzwDzzz3zkz3zVy7VU7zzw00Tky7zzzzwDkzzsTzwDzy7zzzVzsTVzkz3sE3zVy007sT3zzyTy7sTzwDzy7zz3zVzkzwDkzsTVw01zky003wDkzzy7z3wDzy7zz3zzVzkzsTy7sTwDkz00zsT001y7sTzz3zVy7zz3zzVzzkzsTwDz3wDy7sTU0TwDVzkT3w7zzVzkz3zzVzzkzzsTwDy7zVy7z3wDs07w7UzwDVz3zzkTkTVzzkzzsTzw7w7z3zkz1z1y7y0003kzy7kzUzzw00Dk03s00w00y003zVzsTU00z3z0U03sTz3sTsTzy00Ds01w00S00TU03zkzwDs00zVzkM03wDzkwDw7zzU0Dw00y00D00Ds03zsTy7y00zkzsD07yDzsSDz3zzw0Ty00TU07U07z07zwDz3zk1zszyA"
    if (ok:=FindText(X:="wait", Y:=10, 102, 114, 367, 153, 0, 0, Text)){

        RandomSelect:
            ReselectIndex := 0

            Sleep, 2000
            ; move mosue to scroll
            Click , 880, 293, 0
            ; scroll back to select 1st car
            Loop , 200{
                Click , WheelUp, 1
                Sleep , 15
            }

            ; click on first car
            Click, 338, 389 Left, 1

            ; check upgrade text to verify selected car screeb
            Text:="|<>*148$145.s1kTz01z07zU0DU1zs0zz0DsQ0sDzs3zs7zw07k1zz0TzUTzC0Q7zy3zy3zz07s0zzkDzkTzr0C3kD1sD1s7U3y0S1w700T1vU71s3Vs3kw1s1r0D0S3U0D0Rk3Uw1kw1sS0w1vU7U71k070Cs1kS0sS0wD0S0xs3k3Us03U7Q0sD0QD0A7UD0QQ1s1kQ01k0C0Q7UC7U03k7UCC0w0sC00w070C3k73k01s3kD7US0Q700TU3U71s3Vs00w1k73kD0C3zs7z1k3Uw3kwTsTzs3Us7U71zw1zws1kTzsSDwDzs3kQ3k3Uzy0DzQ0sDzsD3y7zs1sD1s1kQ000Ti0Q7zk7UD3kw0s7Uw0sC0001z0C3k03k7VsS0TzkS0Q70000zU71s01s3kw7UTzsD0C3U0C0Tk3Uw00w1sS3kDzy7U71k070Ds1kS00S0wD0s7073k7Us03k7y1sD00DUw7US7U3Vs7kQ01s7jzw7U03zy3k73k1szzkDzkTznzw3k00zy1s3lk0wTzk7zsDzkTs1k007w0w0ss0CDzk3zw1zV"
            if (ok:=FindText(X:="wait", Y:=10, 103, 617, 274, 663, 0, 0, Text)){
                Sleep, 1000
                ; random select car function
                IniRead, maxcars, %SettingsIni%, HUNT, max_cars
                Random, selectedcar, 1, maxcars
                IniRead, currcar, %SettingsIni%, HUNT, car_%selectedcar%
                Loop, %currcar%{
                    Send, {PgDn 1}
                    Sleep, 250
                }

                Sleep, 1000
                If (LockedOrRefueling()){
                    if(ReselectIndex == 8){
                        ReselectIndex := 0
                        loop 30{
                            Send, {PgDn 1}
                            Sleep, 1000
                            If (!LockedOrRefueling()){
                                Break
                            }
                        }
                    }Else{
                        ReselectIndex ++
                        PressEscape(1)
                        Sleep, 2000
                        Goto, RandomSelect
                    }

                }Else{
                    ReselectIndex := 0
                }

            }Else{
                Reload
            }
    }Else{
        Reload
    }

}
