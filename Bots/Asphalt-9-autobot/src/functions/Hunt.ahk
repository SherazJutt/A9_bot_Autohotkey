EnterHuntTab(){

    isFound:= False

    Loop, 25{
        ; hunt card
        Text:="|<>*128$130.000TU00TzzkDzzz1zzy00w001y000zzw0zzzk3zzk00k007s001zzU3zzw0Dzy001000TU003zs0DzzU0zzk0043zzy1zkDz00zzw03zy0T00Tzzs7zUTw03zzk0Dzs7z01zzzUTz1zkMDzz30zzUzy07zzy1zw7z7UzzwQ3zy3zs0Tzzs7zkTxy3zzrkDzsDzU1zzzUTz1zzsDzzz0zzUzy07zzy1zw7zzUzzzw3zy3zs0Tzzs7zkTzy3zzzkDzsDzU1zzzUTy1zzsDzzz0zzUzy07zzy1zkDzzUzzzw3zy3zs000Ts000zzy3zzzkDzsDzU001zU007zzsDzzz0zzUzy0007y000zzzUzzzw3zy3zs000Ts001zzy3zzzkDzsDzU001zU003zzsDzzz0zzUzy03zzy1zs7zzUzzzw3zy3zs0Tzzs7zkTzy3zzzkDzsDzU1zzzUTz1zzsDzzz0zzUzy07zzy1zw7zzUzzzw3zy3zs0Tzzs7zkTzy3zzzkDzsDzU0zzzUTz1zzsDzzz0zzUzy03zzy1zw7zzUzzzw3zy3zs0Tzzs7zkTzy3zzzkDzsDzU1zzzUTz1zzsDzzz0zzUTy03zzy1zs7zzUzzzw3zy1zk0007s000Tzy3zzzkDzw000000TU003zzsDzzz0zzk004001y000TzzUzzzw3zzU00k007s003zzy3zzzkDzz007U00zk01zzzsTzzzVzzzU1y"

        if (ok:=FindText(X, Y, 322, 220, 465, 265, 0, 0, Text)){
            Loop, 2{
                Send, {Enter}
                Sleep, 3000
            }
            isFound:= True
            Break
        }Else{

            Send, {PgDn}
            Sleep, 1800
            ; green underline check to verify events tab start
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 1048, 690, 1187, 702, 0xC3FB12, 0, Fast RGB
            If (ErrorLevel = 0){
                Break
            }
        }
    }
    Return isFound
}

isRaceScreen(){
    isRaceScreen:= False
    Text:="|<>*133$68.zz01w07zkDzzzs0zU3zy3zzzy0Ds1zzUzyw3k3y0S0wD0C0w1vk7UD3k3UD0Sw1s3kw0s3k7j0S0wD0C0w1lk7U03k3UD0wS1s00w0s3kD7US00Dzjzs3ls7U03zvzy0sC1s00zyzz0S3kS00D0DzU7Uw7U03k3ls1zz1s1kw0sD0zzkS0wD0C3kDzy7UD3k3US3k7Vs3kw0s7Us0sTVwDUC0wS0D3zy3zzUD7U3kTz0zzk1Uk0M3z07zs"

    if (ok:=FindText(X:="wait", Y:=10, 1035, 632, 1129, 669, 0, 0, Text))
    {
        isRaceScreen:= True
    }

    Return isRaceScreen
}