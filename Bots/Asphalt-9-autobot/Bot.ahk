#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
CoordMode , Mouse, Screen
SendMode Input
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 0
SetMouseDelay -1
SetBatchLines -1

t1:=A_TickCount, X:=Y:=""

global SettingsIni := A_ScriptDir "\settings.ini"

global carNames := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]

; #Include, %A_  ScriptDir%\src\Boot.ahk
; #Include, %A_ScriptDir%\src\Guis\Main.ahk
; #Include, %A_ScriptDir%\src\Guis\HuntCars.ahk
; #Include, %A_ScriptDir%\src\Guis\CarsSkip.ahk

script_start:

    Gui, Destroy

    If (Mute_System != 0){
        SoundSet,+1,,Mute
    }

    t1:=A_TickCount, X:=Y:=""

    Sleep, 1000

    start_game()
    Sleep, 5000

    If (StuckOnGlLogo()) {
        Goto, script_start
    }

    If (StuckOnLoadingScreen()) {
        Goto, script_start
    }

main_menu_loaded_check_start:

    If (!MainMenuLoadedCheck()) {
        Goto, script_start
    }

    Sleep, 3000

    CheckGame()
    FullScreenAD()
    ExitGamePopUp()
    RewardsNext()

    If (!SeasonalEvents()) {
        Goto, script_start
    }

    Sleep, 1000

    ; <======================== Hunt Start ==============================>

    if (Hunt == 0){
        Goto, hunt_ended
    }

hunt_start:

    If (!EnterEventsTab()) {
        Goto, main_menu_loaded_check_start
    }

    If (!EnterHuntTab()) {
        If (!MainMenuLoadedCheck()) {
            Goto, script_start
        }
        Goto, hunt_ended
    }

HuntRaceScreen:

    If (!isRaceScreen()) {
        Goto, script_start
    }

    Sleep, 2000

    If (!TicketCheck()) {
        Goto, hunt_ended
    }

    Sleep, 1000
    SelectCarToPlayHunt()

    Sleep, 1000
    TdCheck()

    if(PlayButton()){
        Click, 1183, 634 Left, 1
    }Else{
        Goto, script_start
    }
    Sleep, 8000

    If (!PlayHuntRace()){
        Goto, script_start
    }

    Sleep, 8000

hunt_Space_loop_in_race_start:

    Sleep, 1000

    Text:="|<>*127$64.00000000000k1UTwA0Azz7UC3zsw1nzyS0sDzVkDDztw3Us07Us3k7sC3U0C7UD0TUsC00wQ0w1z3Us01nU3k7wC3U07i0D0SssC00Dk0w1vXUzw0z03k7bC3zk1s0D0SQsDz0Dk0w1svUs00z03k7Xy3U07i0D0S7sC00Qs0w1sTUs03lk3k7Uy3U0C70D0S1sC01sC0w1s7Uzy70w3k7UC3zsw1kD0A0sDzXU70Q000000000008"

    if (ok:=FindText(X, Y, 1001, 621, 1079, 656, 0, 0, Text))
    {
        Sleep, 300
        Click, 1176, 645 Left, 1
        Sleep, 1000
    } Else
    {

        ; nitro x2 bottle left

        Text:="|<>*155$28.zzzzzzzDzzzsDzzzkzzzs3zzy0zzzs1zzz03zzw0DzzU0zzy03zzk0SDz01UDsCS0TUa9lw2Nb7k4bwS0EzXs0XsT04D3w0GMTk2NXy09W0Q1zs1w1zzzw7zzzyzzzzzzzy"

        if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
        {
            Send, {Left 5}
            Goto, hunt_barrel_ramp_nitro_end
        }

        ; nitro x2 bottle right

        Text:="|<>*155$28.zzzzzzzDzzzsDzzzkzzzs3zzy0zzzs1zzz03zzw0DzzU0zzy03zzk0SDz01UDsCS0TUa9lw2Nb7k4bwS0EzXs0XsT04D3w0GMTk2NXy09W0Q1zs1w1zzzw7zzzyzzzzzzzy"

        if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
        {
            Send, {Right 5}
            Goto, hunt_barrel_ramp_nitro_end
        }

        ; nitro blue left

        Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"

        if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
        {
            Send, {Left 5}
            Goto, hunt_barrel_ramp_nitro_end
        }

        ; nitro blue right

        Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"

        if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
        {
            Send, {Right 5}
            Goto, hunt_barrel_ramp_nitro_end
        }

        ; barrel left

        Text:="|<>*142$23.zzzzzzxzzzvzzznzzz7zzyDzzsDzzkTzz0Tzy0zzs0zzU1zy03zs07z00Ds00S002k005k00PU01rU0DjU0zTU7yzU01zzzz"

        if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
        {
            Send, {Left 5}
            Goto, hunt_barrel_ramp_nitro_end
        }

        ; barrel right

        Text:="|<>*167$23.zzzzyzzzxzzznzzzbzzy7zzwDzzkDzzUTzz0Tzw0Tzs0TzU0TzU0Ty00Dw003t000m001q007C00DT00wz03w00DzzzzU"

        if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
        {
            Send, {Right 5}
            Goto, hunt_barrel_ramp_nitro_end
        }

        ; ramp left

        Text:="|<>*147$26.zzzzzzzbzzzUzzzk7zzk0zzk07zs00zs007s001s006M003b003tk01yS01zbU1ztw1zyT0007s001zzzzs"

        if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
        {
            Send, {Left 5}
            Goto, hunt_barrel_ramp_nitro_end

        }

        ; ramp right

        Text:="|<>*147$26.zzzzzzzbzzzUzzzk7zzk0zzk07zs00zs007s001s006M003b003tk01yS01zbU1ztw1zyT0007s001zzzzs"

        if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
        {
            Send, {Right 5}
            Goto, hunt_barrel_ramp_nitro_end

        }

        ; switch to right route

        Text:="|<>*151$24.zzzzzzxzzzsTzzU7zz01zzs7zzs7zzs3zzs3zzk3zzU3zw07zk0Dz00Ty03zw07zs0Dzk0Tzk0Tzk0zzk0zzk0zzU0zzU0zzU0zzU0TzzzzzU"

        if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
        {
            Send, {Right 5}
            Goto, hunt_barrel_ramp_nitro_end
        }
        hunt_barrel_ramp_nitro_end:

            ; Sleep, 1000

            ; almost end
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 668, 61, 800, 98, 0xFFFF00, 0, Fast RGB
            If (ErrorLevel = 0)
            {
                Send, {Space 2}
            }
            Else
            {
                ; mid
                CoordMode, Pixel, Screen
                PixelSearch, FoundX, FoundY, 554, 59, 667, 97, 0xFFFF00, 0, Fast RGB
                If (ErrorLevel = 0)
                {
                    Send, {Space}
                    Sleep, 1000
                    Send, {Space}
                }
                Else
                {
                    ; start
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 437, 62, 555, 97, 0xFFFF00, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Send, {Space 2}
                    }
                    else
                    {
                        ; shockwave
                        Send, {Space 2}

                    }
                }
            }

            ; Sleep, 1000

            ; you have been disconnected from server start
            ; still disconnected
            Text:="|<>*117$71.7z7zUzkzwQ00DwDz0zVzks00TsTw1zXzVk00zkzs3z3z3VzlzVzl7y7wD3zXz3zW7yDsS7z7y7y4DwDkwDyDwDwQTsTXsTwTsTssTky7kzszkzVkzlwDVzk01z3lzXsT00U03yDXz3ly01007wT3y7Xw02DwDky7yC7sTwTsTVyDwQDkzszkz00DsMzVzlzVw00Tklz3zXz3s00zl3y7z7y7lzlzWDwDyDwDXzVz0TsTwTsS7z3z0zk00zkwDz7y1zU01zVszy7w7z00E"

            if (ok:=FindText(X, Y, 331, 103, 410, 128, 0, 0, Text))
            {
                Sleep, 2500
                Goto, script_start
            }
            ; you have been disconnected from server end

            ; no internet {Retry}
            Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"

            if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text))
            {
                Sleep, 1000
                Click, 693, 500 Left, 1
                Sleep, 2500
                Goto, script_start
            }

            ; token color check to verify home screen

            Text:="|<>*72$29.zzrzzzy3zzzs3zzz01zzw01zzk00zy000zs0k0z03k0Q07k0E0Tk0E0nU1U37U3067070Tz0S1zy0w3zy1wA0S7sM0QDk000Tk001zU003z0007z000Ty000zw001y"

            if (ok:=FindText(X, Y, 787, 42, 823, 80, 0, 0, Text))
            {
                Goto , main_menu_loaded_check_start
            }

            ; where to get bps screen

            Text:="|<>*160$32.zzzzzyTzzyD3zzz3UTzzUy3zzkTkTzsDy3zw7zUTy3zw3z1zzkTUzzy3kTzzkMDzzy07zzzU3zzzw1zzzzUTzzzk3zzzs0Tzzw43zzy3UTzz1y3zzUzkTzkTy3zsDzkTw7zw3y3zzkT1zzy3UzzzkQTzzyDjzzzrzzzzzs"

            if (ok:=FindText(X, Y, 1142, 92, 1188, 136, 0, 0, Text))
            {
                Click, 1163, 116 Left, 1
                Goto , main_menu_loaded_check_start
            }

            ; TD check in race
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 208, 133, 244, 150, 0xFE0101, 0, Fast RGB
            If (ErrorLevel = 0)
            {
                Send, {Tab}
            }

            ; Resume
            Text:="|<>*152$13.zzTzzzzzvU1k0s0Q0C0703ztzwzyQ0C0703U1k0s0Q0D07zzzzzyU"

            if (ok:=FindText(X, Y, 1130, 227, 1150, 257, 0, 0, Text))
            {
                Send, {Escape}
            }

            ; connecting to the server mp start
            Loop, 60
            {

                Text:="|<>*71$43.zzzzzzzs0Dzzzzs00zzzzw00Dzzzy007zzzz3z3zzzzVzkzzzzkzsTzzzsTwDzzzwDy7zzzy7z3zzzz3zVzzzzVzUzzzzkTUzzzzs00Tzzzw00Tzzzy00zzzzz1sTzzzzVw7zzzzkz3zzzzsTUzzzzwDsTVsS67w7kwD33z3sS7VVzUwD3kkzsS7VsQTwD3kwDzzzzzzy"

                if (ok:=FindText(X, Y, 578, 624, 628, 658, 0, 0, Text))
                {
                    Sleep, 1000
                }
                else
                {
                    Break
                }
            }
            Text:="|<>*71$43.zzzzzzzs0Dzzzzs00zzzzw00Dzzzy007zzzz3z3zzzzVzkzzzzkzsTzzzsTwDzzzwDy7zzzy7z3zzzz3zVzzzzVzUzzzzkTUzzzzs00Tzzzw00Tzzzy00zzzzz1sTzzzzVw7zzzzkz3zzzzsTUzzzzwDsTVsS67w7kwD33z3sS7VVzUwD3kkzsS7VsQTwD3kwDzzzzzzy"

            if (ok:=FindText(X, Y, 578, 624, 628, 658, 0, 0, Text))
            {
                Goto, script_start
            }
            ; connecting to the server mp end

            IfWinExist, Asphalt 9: Legends
            {
                WinActivate, Asphalt 9: Legends
                Sleep, 250
                WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                WinRestore, Asphalt 9: Legends
            }
            else
            {
                ToolTip, spaceloop end, 640, 0,
                Sleep, 1000
                Goto, script_start
            }
            ; GOTO hunt spaceloop start
            Goto, hunt_Space_loop_in_race_start
        }

        hunt_Space_loop_in_race_end:
            Sleep, 1000

            If (HuntRewardsSkip()){
                Goto, HuntRaceScreen
            }Else{
                Goto, script_start
            }

        hunt_ended:

        ; <======================== Hunt ended ==============================>

        starting_mp1:

            Loop,50{
                sleep, 1000
                CoordMode , Pixel, Screen
                PixelSearch, FoundX, FoundY, 10, 61, 35, 87, 0xB00039, 0, Fast RGB
                If (ErrorLevel = 0)
                {
                    Break
                }Else{
                    Send, {Escape}
                }
            }

        entering_mp_1_start:

            ; check seasonal events whether its active or not
            Loop, 20{

                CoordMode, Pixel, Screen
                PixelSearch, FoundX, FoundY, 251, 648, 276, 674, 0xFFFFFF, 0, Fast RGB
                If (ErrorLevel = 0)
                {
                    Break
                }
                else
                {
                    sleep, 250
                    Send, {Escape}
                }
            }
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 251, 648, 276, 674, 0xFFFFFF, 0, Fast RGB
            If (ErrorLevel != 0)
            {
                Click, 349, 637 Left, 1
                Goto, entering_mp_1_start
            }

            Sleep, 1000

            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 256, 643, 269, 654, 0xFFFFFF, 0, Fast RGB
            If (ErrorLevel = 0)
            {
                Loop, 2
                {
                    Click, 686, 644 Left, 1
                    Sleep, 1000
                }
            }else
            {
                Goto, script_start
            }

            Sleep, 3000

            ; xbox authentication
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 1081, 241, 1088, 250, 0xFF0153, 0, Fast RGB
            If (ErrorLevel = 0)
            {
                Click, 1086, 258 Left, 1
                Sleep, 100
                Goto , entering_mp_1_start
            }Else{

                Text:="|<>*144$3.zz0zzzzzzzzU"

                if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                {
                    Sleep, 250
                }Else{
                    Goto , entering_mp_1_start
                }
            }

        entering_mp_1_end:

            if (LeagueDetection !== 0){
                bronze = 0xD88560
                silver = 0x96B2D4
                gold = 0xF1CB30
                platinum = 0x9365F8
                legend = 0xF5E2A4
            }

            Loop, 25{

                Goto, entering_mp_1_end1

                entering_mp_1_start1:

                    Loop, 5 {
                        sleep, 1000
                        Send, {Escape}
                    }

                    ; check seasonal events whether its active or not
                    Loop, 20{

                        CoordMode, Pixel, Screen
                        PixelSearch, FoundX, FoundY, 251, 648, 276, 674, 0xFFFFFF, 0, Fast RGB
                        If (ErrorLevel = 0)
                        {
                            Break
                        }
                        else
                        {
                            sleep, 250
                            Send, {Escape}
                        }
                    }
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 251, 648, 276, 674, 0xFFFFFF, 0, Fast RGB
                    If (ErrorLevel != 0)
                    {
                        Click, 349, 637 Left, 1
                        Goto, entering_mp_1_start1
                    }

                    Sleep, 1000

                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 256, 643, 269, 654, 0xFFFFFF, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Loop, 2
                        {
                            Click, 686, 644 Left, 1
                            Sleep, 1000
                        }
                    }else
                    {
                        Goto, script_start
                    }

                    Sleep, 3000

                    ; xbox authentication
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 1081, 241, 1088, 250, 0xFF0153, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Click, 1086, 258 Left, 1
                        Sleep, 100
                        Goto , entering_mp_1_start1
                    }Else{

                        Text:="|<>*144$3.zz0zzzzzzzzU"

                        if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                        {
                            Sleep, 250
                        }Else{
                            Goto , entering_mp_1_start1
                        }
                    }

                entering_mp_1_end1:

                    ; ============== Bronze =============
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 395, 343, 417, 368, %bronze%, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        i_check_to_play_start00:

                            Sleep, 1000

                            Text:="|<>*144$3.zz0zzzzzzzzU"

                            if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                            {
                                Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                                if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                                {
                                    ;///////
                                }
                                else
                                {
                                    Sleep, 500
                                    Click, 977, 632 Left, 1
                                    Sleep, 1000
                                    Goto, i_check_to_play_start00
                                }
                                Click, 927, 634 Left, 1
                            }
                            else
                            {
                                Sleep, 1000
                                IfWinExist, Asphalt 9: Legends
                                {
                                    WinActivate, Asphalt 9: Legends
                                    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                    WinRestore, Asphalt 9: Legends
                                }
                                else
                                {
                                    ToolTip, i check to play, 640, 0,
                                    Sleep, 1000
                                    Goto, script_start
                                }

                            }

                        i_check_to_play_end00:

                            Loop, 100
                            {
                                ; car selection screen
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Sleep, 750
                                    Break
                                }
                                else
                                {
                                    Sleep, 100
                                    IfWinExist, Asphalt 9: Legends
                                    {
                                        WinActivate, Asphalt 9: Legends
                                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                        WinRestore, Asphalt 9: Legends
                                    }
                                    else
                                    {
                                        ToolTip, car selection screen, 640, 0,
                                        Sleep, 1000
                                        Goto, script_start
                                    }
                                }
                            }

                            Sleep, 1000

                            Click, 805, 142 Left, 1
                            Sleep, 1000

                            Click, 370, 331 Left, 1
                            Sleep, 2000

                            bronze = ""
                            silver = 0x96B2D4
                            gold = 0xF1CB30
                            platinum = 0x9365F8
                            legend = 0xF5E2A4

                            Goto, cars_skip_start
                        }
                    ; ============== Silver =============
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 395, 343, 417, 368, %silver%, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        i_check_to_play_start0:

                            Sleep, 1000

                            Text:="|<>*144$3.zz0zzzzzzzzU"

                            if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                            {
                                Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                                if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                                {
                                }
                                else
                                {
                                    Sleep, 500
                                    Click, 977, 632 Left, 1
                                    Sleep, 1000
                                    Goto, i_check_to_play_start0
                                }
                                Click, 927, 634 Left, 1
                            }
                            else
                            {
                                Sleep, 1000
                                IfWinExist, Asphalt 9: Legends
                                {
                                    WinActivate, Asphalt 9: Legends
                                    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                    WinRestore, Asphalt 9: Legends
                                }
                                else
                                {
                                    ToolTip, i check to play, 640, 0,
                                    Sleep, 1000
                                    Goto, script_start
                                }

                            }

                        i_check_to_play_end0:

                            Loop, 100
                            {
                                ; car selection screen
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Sleep, 750
                                    Break
                                }
                                else
                                {
                                    Sleep, 100
                                    IfWinExist, Asphalt 9: Legends
                                    {
                                        WinActivate, Asphalt 9: Legends
                                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                        WinRestore, Asphalt 9: Legends
                                    }
                                    else
                                    {
                                        ToolTip, car selection screen, 640, 0,
                                        Sleep, 1000
                                        Goto, script_start
                                    }
                                }
                            }

                            Sleep, 1000

                            Click, 879, 135 Left, 1
                            Sleep, 1000

                            Click, 370, 331 Left, 1
                            Sleep, 2000

                            bronze = 0xD88560
                            silver = ""
                            gold = 0xF1CB30
                            platinum = 0x9365F8
                            legend = 0xF5E2A4

                            Goto, cars_skip_start
                        }
                    ; ============== Gold =============
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 395, 343, 417, 368, %gold%, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        i_check_to_play_start1:

                            Sleep, 1000

                            Text:="|<>*144$3.zz0zzzzzzzzU"

                            if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                            {
                                Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                                if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                                {
                                }
                                else
                                {
                                    Sleep, 500
                                    Click, 977, 632 Left, 1
                                    Sleep, 1000
                                    Goto, i_check_to_play_start1
                                }
                                Click, 927, 634 Left, 1
                            }
                            else
                            {
                                Sleep, 1000
                                IfWinExist, Asphalt 9: Legends
                                {
                                    WinActivate, Asphalt 9: Legends
                                    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                    WinRestore, Asphalt 9: Legends
                                }
                                else
                                {
                                    ToolTip, i check to play, 640, 0,
                                    Sleep, 1000
                                    Goto, script_start
                                }

                            }

                        i_check_to_play_end1:

                            Loop, 100
                            {
                                ; car selection screen
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Sleep, 750
                                    Break
                                }
                                else
                                {
                                    Sleep, 100
                                    IfWinExist, Asphalt 9: Legends
                                    {
                                        WinActivate, Asphalt 9: Legends
                                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                        WinRestore, Asphalt 9: Legends
                                    }
                                    else
                                    {
                                        ToolTip, car selection screen, 640, 0,
                                        Sleep, 1000
                                        Goto, script_start
                                    }
                                }
                            }

                            Sleep, 1000

                            Click, 953, 141 Left, 1
                            Sleep, 1000

                            Click, 370, 331 Left, 1
                            Sleep, 2000

                            bronze = 0xD88560
                            silver = 0x96B2D4
                            gold = ""
                            platinum = 0x9365F8
                            legend = 0xF5E2A4

                            Goto, cars_skip_start
                        }

                    ; ============== Platinum =============
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 395, 343, 417, 368, %platinum%, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        i_check_to_play_start2:

                            Sleep, 1000

                            Text:="|<>*144$3.zz0zzzzzzzzU"

                            if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                            {
                                Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                                if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                                {
                                }
                                else
                                {
                                    Sleep, 500
                                    Click, 977, 632 Left, 1
                                    Sleep, 1000
                                    Goto, i_check_to_play_start2
                                }
                                Click, 927, 634 Left, 1
                            }
                            else
                            {
                                Sleep, 1000
                                IfWinExist, Asphalt 9: Legends
                                {
                                    WinActivate, Asphalt 9: Legends
                                    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                    WinRestore, Asphalt 9: Legends
                                }
                                else
                                {
                                    ToolTip, i check to play, 640, 0,
                                    Sleep, 1000
                                    Goto, script_start
                                }

                            }

                        i_check_to_play_end2:

                            Loop, 100
                            {
                                ; car selection screen
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Sleep, 750
                                    Break
                                }
                                else
                                {
                                    Sleep, 100
                                    IfWinExist, Asphalt 9: Legends
                                    {
                                        WinActivate, Asphalt 9: Legends
                                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                        WinRestore, Asphalt 9: Legends
                                    }
                                    else
                                    {
                                        ToolTip, car selection screen, 640, 0,
                                        Sleep, 1000
                                        Goto, script_start
                                    }
                                }
                            }

                            Sleep, 1000

                            Click, 1023, 142 Left, 1
                            Sleep, 1000

                            Click, 370, 331 Left, 1
                            Sleep, 2000

                            bronze = 0xD88560
                            silver = 0x96B2D4
                            gold = 0xF1CB30
                            platinum = ""
                            legend = 0xF5E2A4

                            Goto, cars_skip_start
                        }
                    ; ============== Legend =============

                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 395, 343, 417, 368, %legend%, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        i_check_to_play_start3:

                            Sleep, 1000

                            Text:="|<>*144$3.zz0zzzzzzzzU"

                            if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                            {
                                Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                                if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                                {
                                }
                                else
                                {
                                    Sleep, 500
                                    Click, 977, 632 Left, 1
                                    Sleep, 1000
                                    Goto, i_check_to_play_start3
                                }
                                Click, 927, 634 Left, 1
                            }
                            else
                            {
                                Sleep, 1000
                                IfWinExist, Asphalt 9: Legends
                                {
                                    WinActivate, Asphalt 9: Legends
                                    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                    WinRestore, Asphalt 9: Legends
                                }
                                else
                                {
                                    ToolTip, i check to play, 640, 0,
                                    Sleep, 1000
                                    Goto, script_start
                                }

                            }

                        i_check_to_play_end3:

                            Loop, 100
                            {
                                ; car selection screen
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Sleep, 750
                                    Break
                                }
                                else
                                {
                                    Sleep, 100
                                    IfWinExist, Asphalt 9: Legends
                                    {
                                        WinActivate, Asphalt 9: Legends
                                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                        WinRestore, Asphalt 9: Legends
                                    }
                                    else
                                    {
                                        ToolTip, car selection screen, 640, 0,
                                        Sleep, 1000
                                        Goto, script_start
                                    }
                                }
                            }

                            Sleep, 1000
                            Click, 1095, 138 Left, 1
                            Sleep, 1000

                            Click, 370, 331 Left, 1
                            Sleep, 2000

                            bronze = 0xD88560
                            silver = 0x96B2D4
                            gold = 0xF1CB30
                            platinum = 0x9365F8
                            legend = ""

                            Goto, cars_skip_start
                        }

                    i_check_to_play_start:

                        Sleep, 1000

                        Loop, 150
                        {
                            Text:="|<>*144$3.zz0zzzzzzzzU"

                            if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                            {
                                Break
                            }
                            else
                            {
                                Sleep, 100
                                MouseMove, 1188, 649
                                Click, 1188, 649 Left, 1
                            }

                        }

                        Sleep, 1000

                        Text:="|<>*144$3.zz0zzzzzzzzU"

                        if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                        {
                            Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                            if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                            {
                            }
                            else
                            {
                                Sleep, 500
                                Click, 977, 632 Left, 1
                                Sleep, 1000
                                Goto, i_check_to_play_start
                            }
                            Click, 927, 634 Left, 1
                        }
                        else
                        {
                            Sleep, 1000
                            IfWinExist, Asphalt 9: Legends
                            {
                                WinActivate, Asphalt 9: Legends
                                WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                WinRestore, Asphalt 9: Legends
                            }
                            else
                            {
                                ToolTip, i check to play, 640, 0,
                                Sleep, 1000
                                Goto, script_start
                            }
                            ; star up check it later
                            Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"

                            if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text))
                            {
                                Send, {Escape}
                                Sleep, 1000
                                Goto, i_check_to_play_start
                            }

                            ; connection error retry
                            Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"

                            if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text))
                            {
                                Goto, script_start
                            }

                            ; club ms claim later
                            Text:="|<>*148$74.w00S0zzXzsTyD00DkDzszy7zvk03w3zyDzVzyw00z01k3U0Q3z00Cs0Q0s070Tk07C070C01k7w01nU1k3U0Q1z00Qs0Q0s070Tk0D7070C01k7w03Vk1k3zkQ3z00sQ0Q0zw7zvk0C7U70C01zww070s1k3U0TyD01zy0Q0s073Xk0TzU70C01kww0Dzw1k3U0Q7D03U70Q0s071vk0s1k70C01kCzzC0S1k3zsQ3zzr03UQ0zy70S"

                            if (ok:=FindText(X, Y, 452, 578, 544, 615, 0, 0, Text))
                            {
                                Send, {Escape}
                                Sleep, 1000
                                Goto, i_check_to_play_start
                            }

                            ; tier unlocked
                            Text:="|<>*110$82.1w0Q007k1kDk3szy3s00zU7Uz0TrzwDU07y0S3y1zzzky00Ts1sDs7zsDXs01zU7UzUzz0yDU07z0S3y3zw3sy00yw1sDwDzkDXs03nk7Uxlvz00DU0DD0S3r7jw00y00wy1sDSQzk03s07ls7Uxtnz00DU0S7US3njDw00y01sS1sDDszk03s07Vw7UwzXz0QDU0zzkS3lyDw3sy03zz1sD7szkDXs0Dzw7UwT3z0yDU0zzsS3ksDy7sy07k7VsD00zzz3zyS0S7Uw03rzwDzts1wS3k0DDzUzzbU7lsD00y"

                            if (ok:=FindText(X, Y, 562, 536, 705, 597, 0, 0, Text))
                            {
                                Send, {Escape}
                                Sleep, 1000
                                Goto, i_check_to_play_start
                            }

                            ; Demoted
                            Text:="|<>*154$35.DzUS0wzzUw3lzz1sD7UD3kQD0S7VsS0wD7Uw1sSS1s3kww3k7Vvk7UD3z0D0S7z0S0wDz0w1sTC1s3kyS3k7VsS7UD3kQD0S7UwS0wD0wT7kS0szzUw1szy1s1w"

                            if (ok:=FindText(X, Y, 609, 520, 659, 554, 0, 0, Text))
                            {
                                Send, {Escape}
                                Sleep, 1000
                                Goto, i_check_to_play_start
                            }

                            ; rewards next
                            Text:="|<>*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"

                            if (ok:=FindText(X, Y, 1106, 635, 1187, 666, 0, 0, Text))
                            {
                                Sleep, 250
                                MouseMove, 1188, 649
                                Click, 1188, 649 Left, 1
                                Sleep, 1500
                                Goto, i_check_to_play_start
                            }
                            else
                            {
                                Sleep, 1000
                                MouseMove, 1188, 649
                                Click, 1188, 649 Left, 1
                                Sleep, 1500

                                Text:="|<>*144$3.zz0zzzzzzzzU"

                                if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                                {
                                    Goto, i_check_to_play_start
                                }
                                else
                                {
                                    Goto, script_start
                                }

                            }

                        }

                    i_check_to_play_end:

                    car_select_start:

                        Loop, 100
                        {

                            ; car selection screen
                            CoordMode, Pixel, Screen
                            PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                            If (ErrorLevel = 0)
                            {
                                Sleep, 750
                                Break
                            }
                            else
                            {
                                Sleep, 100
                                IfWinExist, Asphalt 9: Legends
                                {
                                    WinActivate, Asphalt 9: Legends
                                    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                    WinRestore, Asphalt 9: Legends
                                }
                                else
                                {
                                    ToolTip, car selection screen, 640, 0,
                                    Sleep, 1000
                                    Goto, script_start
                                }
                            }
                        }

                        CoordMode, Pixel, Screen
                        PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                        If (ErrorLevel = 0)
                        {
                            loop 2
                            {
                                Sleep, 350
                                Send, {enter}
                            }
                        }
                        else
                        {
                            Goto, script_start
                        }

                    car_select_end:

                        ; car selected screen confirm

                        Loop, 100
                        {
                            ; upgrade text color check to verify car selection screen
                            CoordMode, Pixel, Screen
                            PixelSearch, FoundX, FoundY, 114, 628, 151, 656, 0x0D2240, 0, Fast RGB
                            If (ErrorLevel = 0)
                            {
                                Sleep, 1000
                                Break
                            }
                            else
                            {

                                Sleep, 100

                                ; GEt key / BP
                                Text:="|<>*150$45.007zzzzs00zzzzz0070zzzs00k1zzz00607zzs3wk0Tzz7z601zzzzUk0007y060000vU0k0007Q060000vU0k0007A060000tk0k0007C0607s0tk0k1zU76060Ty0ss0k3zk77060zy0ss0k7zs77060zz0sM0k3zk73U60Ty0sQ0k1zU73U607s0sA0k00071k60000sC0k00071k60000s60k00070s60000s70k00070s7zzU0s30zzy070Q7zzs0s3UzzzU70Q7zzy0s3Uzzzzz0A7zzzzs1k000000C0000001zz000007zk00000z0000006000004"

                                if (ok:=FindText(X, Y, 913, 602, 975, 660, 0, 0, Text))
                                {
                                    Goto, tiers_lock_check_start
                                }
                                IfWinExist, Asphalt 9: Legends
                                {
                                    WinActivate, Asphalt 9: Legends
                                    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                    WinRestore, Asphalt 9: Legends
                                }
                                else
                                {
                                    ToolTip, get key / bp, 640, 0,
                                    Sleep, 1000
                                    Goto, script_start
                                }
                                ; silver
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 1024, 619, 1042, 635, 0x96B2D4, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Goto, tiers_lock_check_start
                                }
                                ; Gold
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 1042, 617, 1062, 637, 0xF1CB30, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Goto, tiers_lock_check_start
                                }
                                ; Platinum
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 992, 618, 1006, 635, 0x9365F8, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Goto, tiers_lock_check_start
                                }
                                ; Legend
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 1018, 619, 1034, 635, 0xF0DDA1, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Goto, tiers_lock_check_start
                                }

                            }
                        }

                    tiers_lock_check_start:

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
                            Goto, cars_skip_start
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
                            Goto, cars_skip_start
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
                            Goto, cars_skip_start
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
                            Goto, cars_skip_start
                        }

                    tiers_lock_check_end:

                    cars_skip_start:

                        ; <============ D ============>

                        ; lancer
                        if (Lancer !== 0){
                            Text:="|<>*134$93.w00y0Q1s7y1zwDy7U0Ds3kD3zsDzXzww01z0T1sTzVzwTzrU0Ds3sD7zwDz3zyw01z0TVsw3ls0S3rU0Sw3wD7USD03kSw03rUTlsw3ls0S3rU0SQ3yD7U0D03kSw03XkTtsw01zsS3rU0wS3rD7U0Dz3zyw07XkSxsw01zsTzrU0wC3nj7U0Dz3zww071sSTsw01s0Tz7U1zz3lz7USD03lsw0DzsSDsw3ls0S7bU1zz3kz7USD03kwzyS0wS7szzVzwS3rznk7XkT3zwDzXkSzyS0wS3sDz1zwS3zznk7XUD0zUDzVkDU"

                            if (ok:=FindText(X, Y, 174, 160, 280, 189, 0, 0, Text))
                            {
                                Loop, %iniLancer_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; hellcat
                        if (Hellcat !== 0){

                            Text:="|<>*132$64.zw0Dk0zUC1vzw0z0DzVsDjzs7w1zz7UwzzUTs7zwS7XkS1zUS3lsyD1s7S1sD7Xkw7Uws7UwSS3kS3nkS01vsD1sDD1s07j0wDUsw7U0Tw3zy7VkS01zsDzkS7Vs07zUzy1sS7U0Tj3k07zsS3lwwD00zzVsD7Vsw03zz7UwS3nk0D0wTzlsDD01s3lzz7USw07U73zsS1zk0S0S3y0s3s"

                            if (ok:=FindText(X, Y, 535, 155, 613, 195, 0, 0, Text))
                            {
                                Loop, %iniHellcat_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; peugeot sr1
                        If (Peugeotsr1 !== 0){

                            Text:="|<>*137$42.7w1zk0STz1zw0zzz1zy3zzzVzy3zw7VsS3zw7VsD3Dw01sD0Dw01sD0Dzs1sS0Dzy1zy0DTz1zy0D3zVzw0D0DVzs0DM7Vts0Dw7Vsw0Dw7Vsw0DzzVsS0DzzVsS0DTz1sD0D7w1kD0CU"

                            if (ok:=FindText(X, Y, 175, 161, 233, 185, 0, 0, Text))
                            {
                                Loop, %iniPeugeotsr1_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; lambo countach 25th
                        If (Lamborghinicountach25th !== 0){

                            Text:="|<>*134$60.7s3zwTznkCTy3zwTznkDzz3zwTznkDyT3zwDzXkDwD3k01s3kDwD3k01s3kDwD3k01s3kD0D3zs1s3kD0T3zw1s3zz0y3zw1s3zz1w3kS1s3zz7s00S1s3zzDk00S1s3kDTU1US1s3kDy03kS1s3kDw03kS1s3kDzz3xw1s3kDzz3zw1s3kDzz1zs1s3kDzz0Tk1s3kCU"

                            if (ok:=FindText(X, Y, 315, 159, 386, 188, 0, 0, Text))
                            {
                                Loop, %iniLamborghinicountach25th_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }
                        ; <============ C ============>

                        ; SRT8

                        If (Srt8 !== 0){

                            Text:="|<>*135$60.7y1zsDzsDsDz1zyDzszyTzVzzDzszzTzVzz7zlyzw3lsD0S1sDw3lsD0S1sDw01sD0S1sDS01sD0S1sDTw1sD0S0zzTz1zz0S0zyDzVzz0S0zy3zlzy0S1yT07lzw0S1sDQ3lsw0S1sDw3lsy0S1sDQ3lsS0S1sDTzlsT0S1zzTzVsD0S0zzDzVsDUS0zy3y1s7US0DsU"

                            if (ok:=FindText(X, Y, 343, 163, 410, 186, 0, 0, Text))
                            {
                                Loop, %iniSrt8_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; Saleen S1
                        If (Saleens1 !== 0 ){

                            Text:="|<>*133$25.7w07jzUDzzkDzzwDzkS7zsD3Dw007y003zy01vzk0xzw0S7z0D0DU7c3k3z1s1zUw0zzy0Tzz0DTz07Xy03s"

                            if (ok:=FindText(X, Y, 177, 163, 215, 185, 0, 0, Text))
                            {
                                Loop, %iniSaleens1_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; ferrari monza sp1

                        If (Ferrarimonzasp1 !== 0){

                            Text:="|<>*132$41.7w1zs0Szy3zs3zzw7zsDzzwDzkzz1sS3lzy3kw7XDw01sD0Ts03kS0zzU7Uw1zzkD3k3rzkTzU7Vzkzz0D0DVzs0S0D3k00zkS7U01zUwD003zzsS007zzUw00DTz1s00SDs3U00y"

                            if (ok:=FindText(X, Y, 274, 161, 325, 187, 0, 0, Text))
                            {
                                Loop, %iniFerrarimonzasp1_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }

                        }
                        ; jaguar xe sv project
                        If (Jaguarxesvproject !== 0){

                            Text:="|<>*133$69.w1szy01z0w1vkT7zk0Ty7UDS3kzy07zsy3lsy7zU0zz3kSD7Uw00D1wS3kxw7U01s7XkS7j0w00D00S7UTk7U01w01sw3y0zw07z0D7UDk7zU0zy1sw3y0zw03zsD70Tk7z007z0ts7z0w0001w7j0xs7U00k7UxsDbUw00D0w7i1sw7U01s7UTkT7kzw07zw3y3kS7zk0zz0Tky3szy03zk1w7UD7zk0Dw0DUU"

                            if (ok:=FindText(X, Y, 174, 161, 257, 186, 0, 0, Text))
                            {
                                Loop, %iniJaguarxesvproject_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }
                        ; lambo miura

                        If (Lamborghinimiura !== 0){

                            Text:="|<>*134$78.z0T1kw3kzs0DUz0z3kw3lzy0DkzUz3kw3lzz0TkzUz3kw3lzz0TkzVz3kw3lsD0TszVz3kw3lsD0xsxlr3kw3lsD0xsxlr3kw3lsD0wsxnb3kw3lsD0wwwvb3kw3lzz1swwvb3kw3lzz1swwz73kw3lzy1sQwz73kw3lzw1sSwT73kw3lsw3zywS73kw3lsS3zyw073kw3lsS3zyw073kzzVsT3kDw073kTzVsD7UDw073kDz1sDbUDw071k7y0s7bU7U"

                            if (ok:=FindText(X, Y, 171, 157, 268, 194, 0, 0, Text))
                            {
                                Loop, %iniLamborghinimiura_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; bugatti eb 110
                        If (Bugattieb110 !== 0){

                            Text:="|<>*135$56.zy7zU0w03zzVzw0z03zzsTzUTk1zzy7VwDw0Tz01sD3z07zk0S3knk1Dw07Uw0w03z01sD0D00zzkTzU3k0Dzw7zk0w03zz1zy0D00zzkS7k3k0Dw07Uw0w03z01sD0D00zk0S3k3k0Dw07Uw0w03zzVzz0D00zzsTzU3k0Dzy7zs0w03zzVzs0D00y"

                            if (ok:=FindText(X, Y, 175, 160, 264, 188, 0, 0, Text))
                            {
                                Loop, %iniBugattieb110_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; <============ B ============>

                        ; 911 gs coupe
                        If (Porsche911gscoupe !== 0){

                            Text:="|<>*136$46.00000000Dw7zsDs1zsTzVzsDzlzyDzkzz7ztzz7US1s7UwS1s7US1ls70S1s07U01s7k0S007UTy1szUS0zy7Xy1s1zwSDs7U1zlsDUS00DbUS1s30SS1s7US1ts7US1s7Xzw1s7zwDzk7UDzkTy0S0Ty0zk1s0zk00000002"

                            if (ok:=FindText(X, Y, 234, 162, 285, 188, 0, 0, Text))
                            {
                                Loop, %iniPorsche911gscoupe_to%
                                {
                                    Sleep, 250
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; nissan r390 gt1
                        If (Nissanr390 !== 0){

                            Text:="|<>*135$93.zw0Tk0zU3y0Dw7zzzs7zUTz1zw3zkzzzzVzy7zsDzkzz7zzzwD7kzzXzy7zszzw7XkS7UwS3ls7US7UwS3kw7XkSD0w3kw7VkS7UwS3ls70S7Uw03kw7XkSD003kw7U3y7UwS3ls00S7zw0zUzzXkSD7s3kzz07w7zwS3lszUS7zs0TkTzXkSD7w3kzy00S0zwS3lsDUS7XkC3k07XkSD0w3kwT3kS00wS3ls7US7VsS3k07XkSD0w3kwD1zy3zwTzkzz0S7UwDzkTz1zy7zs3kw7Uzw3zsDzUTy0S7US3y0Tw0Tk1zU3kU"

                            if (ok:=FindText(X, Y, 174, 157, 297, 189, 0, 0, Text))
                            {
                                Loop, %iniNissanr390_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; enzo
                        If (Ferrarienzo !==0){

                            Text:="|<>*135$61.zy70S7zs7yTz3kD3zwDzjzVw7Vzy7zzzky3kzz7zzk0TVs0D3kTs0Dkw0DVs7w07wS07Uw3y03yD07kS1zz1zbU7kD0zzUxnk3k7UTzkSxs3k3kDzsDCw3s1s7w07by1s0w3y03lz1s0S1z01szVw0D0zU0wDkw07UzzsS7szzXzzzwD1wTzkzzzy7UyDzsTzTz3UD7zw3y8"

                            if (ok:=FindText(X, Y, 175, 159, 249, 189, 0, 0, Text))
                            {
                                Loop, %iniFerrarienzo_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; essenza
                        If (Lamborghiniessenza !== 0){

                            Text:="|<>*140$28.3k0TUz07zbw0zzTk3txz0D3ow0wD3k3kwD003kw00T3k03sD00T0w03s3k0z0D07s0w0y03k3s0D0Dzkw0zz3k3zwD0Dzs"

                            if (ok:=FindText(X, Y, 344, 157, 386, 192, 0, 0, Text))
                            {
                                Loop, %iniLamborghiniessenza_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; carrera
                        If (Porschecarrera !== 0){

                            Text:="|<>*135$28.7w3zxzwTzrztzzzzXzzkS0wD1s3kw3UD3k00wD003kwTUD3ly0wD7s3kw7UD3kS0wD1s3kw7UD3zy0w7zs3kTz0D0Tk0w8"

                            if (ok:=FindText(X, Y, 297, 158, 337, 187, 0, 0, Text))
                            {
                                Loop, %iniPorschecarrera_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; <============ A ============>

                        ; vulkan

                        If (Vulkan !== 0){

                            Text:="|<>*140$161.07U7wTyDwC3U3UC0w3z3zb71k000D0TwTszwQ707Uw1s7z3yCD3U000T0kM61UswC0D1s7kA61UQS70000q1UkA30lwQ0S3kBUMC30syC0003g300M61Xss0yBUPUkQ61lwQ0006M700kA37tk1gP0n1UsA3Xws000AMDk1UM6CnU3Aa3631UM77Nk000MkDs30kARr06PA6C7z0kCCPU001VU3s61UMti0AqMAQDw1UQQr00033U0kA30lnw0MsksMQs30ssy0007z21UM61XXs0llVzklk61llw000Dy630kA773k1V33zlVkA3XVs000kAAC1UQCC7U306C1X3UM773k001UQTw30TsQ7060AQ3630kCC3U0030MTk60TUsA0A0Mk6A71UAQ70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000Tzzzzzzzzk00000000000000000zzzzzzzzzU00000000000000001zzzzzzzzz3k7bUwD00zk0y0S1s3zzzzzzzzy7UDD1sS03zk1y0w3k7zzzzzzzzwDUwS3kw0Dzk7w1w7UDzzzzzzzzsD1sw7Vs0TzkDs3sD0TzzzzzzzzkS3lsD3k1s7UTs7sS0zzzzzzzzzUw7XkS7U3kD1vkDkw1zzzzzzzzz1sS7UwD07US3rUTls3zzzzzzzzy1swD1sS0D007b0zXk7zzzzzzzzw3lsS3kw0S00DD1zbUDzzzzzzzzs7Xkw7Vs0w00wS3rD0TzzzzzzzzkD71sD3k1s01sw7jS0zzzzzzzzzUCS3kS7U3k03kwDDw1zzzzzzzzz0Sw7UwD07U07VsSTs3zzzzzzzzy0xsD1sS0D0wTzkwTk7zzzzzzzzw1vUS3kw0S1szzVszUDzzzzzzzzs1z0w7Vs0w3lzzXkz0Tzzzzzzzzk3y1zz3zszzXkD7Vy0zzzzzzzzzU7w3zy7zlzyD0SD1w1zzzzzzzzz07k3zsDzVzsS0wS1s3zzzzzzzzy0DU1z0Tz1zUw0sw3k7zzzzzzzzy"

                            if (ok:=FindText(X, Y, 173, 131, 338, 193, 0, 0, Text))
                            {
                                Loop, %iniVulkan_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; senna gtr

                        If (Sennagtr !== 0){

                            Text:="|<>*134$44.7w7zwzw7zlzzDzlzyTznzyzzXzszzj1s3kD1vkS0w3kSw3UD0w7j003kD1vk00w3kSwTUD0zzjDs3kDznny0w3zww7UD0zyD1s3kD7XkS0w3lww7UD0wDDzs3kD3tzy0w3kSTz0D0w7lz03UD0y"

                            if (ok:=FindText(X, Y, 268, 161, 323, 190, 0, 0, Text))
                            {
                                Loop, %iniSennagtr_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; zonda r

                        If (Zondar !== 0){

                            Text:="|<>*135$13.zwTzjzrzzkTsDw7y3z1zzzzxzwzwSDD7bVvkxsTw7y3s"

                            if (ok:=FindText(X, Y, 267, 158, 293, 190, 0, 0, Text))
                            {
                                Loop, %iniZondar_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }
                        ; <============ S ============>

                        ; centenario

                        If (Centenario !== 0){

                            Text:="|<>*134$55.1w0zs3k7w1z0Tz1sDzUzUDzkw7zsTk7zsS7zwTs3UwD3kSDS1kC7Vs77j0s73kw3XbUQ3VsS1nnkC3kwD0tsw7zsS7UQwS3zwD3kCQD1zw7Vs7S7Uzw3kw3jzsQS1sS1rzwC7UwD0zzy73kS7Uzk73UwD3zzs3lkS7Uzzw1ss7XkTzQ0wQ3ls3y8"
                            if (ok:=FindText(X, Y, 268, 159, 341, 190, 0, 0, Text))
                            {
                                Loop, %iniCentenario_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; raesr

                        If (RaesrTacheon !== 0){

                            Text:="|<>*146$60.zk7UDwDsDyzs7UDsTwDykM7kA0MCC7kMCkA0MCC7kMCkA0M0C7kMAkA0Q0C7ksAMDkTkC7zsQMDs7wDyzkMMC00wDwnUMQA00CCQlkTwA0MCCAkkzwA0MCCCkkkAA0QCCCkskCDwTwC7kMk6Dw7sC3U"

                            if (ok:=FindText(X, Y, 178, 136, 251, 161, 0, 0, Text))
                            {
                                Loop, %iniRaesrTacheon_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; trion

                        If (Trion !== 0){

                            Text:="|<>*132$107.w3kzy7k7sTz0zUC0zVs7VzwDkDkzy7zUS7znsD3zsTUzVzwTzUwDzrsS7zUz1z3zkzzVszzjkwD01y3y7U1sD3lsDTlsS03y7wD03kS7XkSzXkw07QRsS07U0D7U1zbVs0Csvkw0D00SDU3rD3zkQtrVzsTw0wTw7jS7zUtrD3zkzy1sTzDCwDz1niS7zUzy3kTzSTsTy3XwwDy0Dy7UDywTkw077lsS001wD00xszVs0CDXkw001sS00zkz3k0QT7Vs0S3kwS1zVy7U0s0D3k0w7Vsw7j1wDzVk0S7zVzz3lzzS3sTz3U0wDzXzw7Vzyw3kzy701sTz3zsD3zts3VzwC03kzy1z0Q1z2"

                            if (ok:=FindText(X, Y, 176, 161, 296, 189, 0, 0, Text))
                            {
                                Loop, %iniTrion_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                        ; Naran

                        If (Naran !== 0){

                            Text:="|<>*132$78.w3nk7XzUDzXzkw3ls7bzsDzXzww3lsD7zwDzXzww3lwD7zwDz3zyw3kwS7UwC03kSw3kyS7USC03kSw3kSS7USC03kSw3kSw7USC03kSzzkDw7UyDy3kSzzkDs7kwDz3zyzzk7s7zwDz3zwzzk7k7zsDy3zsw3k3k7zkC03zkw3k3k7U0C03lsw3k3k7U0C03lsw3k3k7U0C03kww3k3k7U0Dz3kww3k3k7U0DzXkSw3k3k7U0DzXkSw3k3k3U0DzXkDU"

                            if (ok:=FindText(X, Y, 175, 159, 269, 194, 0, 0, Text))
                            {
                                Loop, %iniNaran_to%
                                {
                                    Sleep, 300
                                    Send, {PgDn}
                                }
                                Goto, tiers_lock_check_start
                            }
                        }

                    cars_skip_end:

                    play_start:

                        ; td check start
                        CoordMode, Pixel, Screen
                        PixelSearch, FoundX, FoundY, 897, 647, 916, 677, 0xC0F712, 0, Fast RGB
                        If (ErrorLevel = 0)
                        {
                            Sleep, 500
                            Click, 858, 657 Left, 1
                            Sleep, 1000
                        }
                        ; td check end

                        ; check if car have no fuel
                        Text:="|<>*147$65.7zU70D1kDzkzzUS0w3UTzlzzUw1s70zzrkD1s7UC1k7j0C3kS0Q3U7y0Q7Vs0s70Dw0sD3k1kC0Ts00SD03UQ0zk00ww070s1vw01ts0C1k3rzU3rU0Q3U77zs7zU0s70S3zsDzU1kDzw0DkTj03UTzk07UyD070zz007VwD0C1k0D0D3kS0Q3U0S0S7US0s700w0wD0S1kC01s3kS0w3UQ01zzUw0w70s03zy1s1sC1k01zs1k1sQ3U0E"
                        if (ok:=FindText(X, Y, 1049, 612, 1157, 668, 0, 0, Text))
                        {
                            Sleep, 350
                            Send, {PgDn}
                            Sleep, 350
                            Goto, tiers_lock_check_start
                        }Else
                        {
                            ; check if get blueprint screen
                            Text:="|<>*148$68.zzU3US073zzzzw1s7k1kzzzzzUS1w0QDzzw1w7UTU707kD0D1s7s1k0w3k3kS1z0Q0D0w0w7UTk703kD0D1s7y1k0w3k3kS1vUQ0D0w0w7USw703kD0D1s7bVk0w3k3kS1tsQ0D0zzw7USD703kDzy1s7Xlk0w3zz0S1sSQ0D0zzU7US7b03kD1s1s7Uxk0w3kS0S1s7w0D0w3k7US1z03kD0w1s7UDk0w3k7US1s3w0D0w1s7US0T03kD0D1s7U7k0w3k3kS1s0w0D0w0S3US0D03k8"

                            if (ok:=FindText(X, Y, 1135, 609, 1222, 648, 0, 0, Text))
                            {
                                Sleep, 350
                                Send, {PgDn}
                                Sleep, 350
                                Goto, tiers_lock_check_start
                            }Else{

                                ; check if get KEY screen
                                Text:="|<>*151$99.T00Ds3zzzVz007wDzw03y0zzzw7w00zVzzU0zU7zzzUzU0DsDzw07w0zzzw3w01z1zzU1z07zzzUTk0TkDzw0Tk0zU001y03y1zzU7w07w000Ds0TUDzw0zU0zU000z07w1zzUDs07w0007w0z0Dzw3y00zU000TUDs1zzUTU07w0003w1y0Dzw7w00zU000TkTk1zzVz007w0001y3w0DzwTk00zU000DszU1zzXy007w0000z7s0DzwzU00zU0007wz00zzjs007zzw00Tjk07zxz000zzzk03zy00zzzw007zzy00DzU07zzzU00zzzk01zw00yzzy007zzy007z007rzzs00zU0000zs00yzwz007w00003y007rz3w00zU0000Tk00yzkTk07w00003y007ry1y00zU0000Dk000zUDs07w00001y0007w0zU0zU0000Dk000zU3w07w00001y0007w0Tk0zU0000Dk00yzU1z07w00001y007zw07s0zU0000Dk00zzU0zU7w00001y007zw03y0zk0000Dk00zzU0Dk7zzzU01y007zw01z0zzzw00Dk00zzU07w7zzzU01y007vs00TUTzzw00DU00zT001w3zzz001w007o"

                                if (ok:=FindText(X, Y, 1089, 606, 1203, 657, 0, 0, Text))
                                {
                                    Sleep, 350
                                    Send, {PgDn}
                                    Sleep, 350
                                    Goto, tiers_lock_check_start
                                }Else{

                                    ; upgrade text color check to verify car selection screen
                                    CoordMode, Pixel, Screen
                                    PixelSearch, FoundX, FoundY, 114, 628, 151, 656, 0x0D2240, 0, Fast RGB
                                    If (ErrorLevel = 0)
                                    {
                                        ; click on play button to start the race
                                        Sleep, 150
                                        Click, 1183, 634 Left, 1
                                        Sleep, 250
                                    }
                                    else
                                    {
                                        Sleep, 2000
                                        IfWinExist, Asphalt 9: Legends
                                        {
                                            WinActivate, Asphalt 9: Legends
                                            WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                            WinRestore, Asphalt 9: Legends
                                        }
                                        else
                                        {
                                            ToolTip, play buttton, 640, 0,
                                            Sleep, 1000
                                            Goto, script_start
                                        }

                                        Goto, script_start
                                    }

                                }

                            }

                        }

                    play_end:

                        Sleep, 10000

                        ; check if clicked on refilling car and stuck on watch screen
                        Text:="|<>*147$35.0S07zs1y0Dzs3w0Tzs7s0s3kTs1k3Utk3U71nU70C7bUC0QDD0Q0sQC0s1ksQ1k3Xkw3U770s70CC1kC0Qw3kQ0tzzUs1nzz1k3b0C3U7S0S70Cw0wD1xk0sTzrU1szz601UzkE"

                        if (ok:=FindText(X, Y, 859, 500, 910, 541, 0, 0, Text))
                        {
                            Goto, starting_mp1
                        }

                        ; syncing to the server start
                        Loop, 30
                        {
                            Text:="|<>*127$33.zzzzzwwz7k7bXsw0QwD73XbVssyAw777lbUsszwwX77zbaMszwwl761bb8ssAww77lbbUsyAwy77lbbkswQwz7U3bbsy0zzzzzzU"
                            if (ok:=FindText(X, Y, 1221, 604, 1261, 631, 0, 0, Text))
                            {
                                Sleep, 1000
                            }
                            else
                            {
                                Sleep, 1000
                                Break
                            }
                        }
                        Text:="|<>*127$33.zzzzzwwz7k7bXsw0QwD73XbVssyAw777lbUsszwwX77zbaMszwwl761bb8ssAww77lbbUsyAwy77lbbkswQwz7U3bbsy0zzzzzzU"

                        if (ok:=FindText(X, Y, 1221, 604, 1261, 631, 0, 0, Text))
                        {
                            Goto, script_start
                        }
                        ; syncing to the server end

                        ; searching for players start
                        Loop, 60
                        {
                            Text:="|<>*118$37.zzzzzzy7tws1z3wyQ0TVyDCD7Uz3b7XmDVnXltbkNlswntAswQswmQSCSSNCD70DC77X03b3XlXlnllsnwtss0tyQyQ0Tzzzzzy"

                            if (ok:=FindText(X, Y, 712, 559, 756, 579, 0, 0, Text))
                            {
                                Sleep, 1000
                            }
                            else
                            {
                                Break
                            }
                        }
                        Text:="|<>*118$37.zzzzzzy7tws1z3wyQ0TVyDCD7Uz3b7XmDVnXltbkNlswntAswQswmQSCSSNCD70DC77X03b3XlXlnllsnwtss0tyQyQ0Tzzzzzy"

                        if (ok:=FindText(X, Y, 712, 559, 756, 579, 0, 0, Text))
                        {
                            Goto, script_start
                        }
                    ; searching for players end

                    Space_loop_in_race_start:

                        Sleep, 1000

                        Text:="|<>*122$61.s1kzz70Szzy0sTzXkCTzzUQD00sD0Q7kC7U0S70C3w73k077U71y3Vs03nU3UvVkw00vU1kRksS00Tk0sCQQDz07k0Q7CC7zk3s0C3Xb3zs1w071lvVs01z03UsRkw00vU1kQDsS00ws0sC3wD00QS0Q70y7U0S70C3UT3k0C3k71k7VzyD0s3Us3kzz70S1kQ0sTzbU70s8"

                        if (ok:=FindText(X, Y, 1019, 620, 1095, 657, 0, 0, Text))
                        {
                            Sleep, 300
                            Click, 1176, 645 Left, 1
                            Sleep, 1000
                        } Else {

                            ; nitro x2 bottle left

                            Text:="|<>*155$28.zzzzzzzDzzzsDzzzkzzzs3zzy0zzzs1zzz03zzw0DzzU0zzy03zzk0SDz01UDsCS0TUa9lw2Nb7k4bwS0EzXs0XsT04D3w0GMTk2NXy09W0Q1zs1w1zzzw7zzzyzzzzzzzy"

                            if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
                            {
                                Send, {Left 5}
                                Goto, barrel_ramp_nitro_end
                            }

                            ; nitro x2 bottle right

                            Text:="|<>*155$28.zzzzzzzDzzzsDzzzkzzzs3zzy0zzzs1zzz03zzw0DzzU0zzy03zzk0SDz01UDsCS0TUa9lw2Nb7k4bwS0EzXs0XsT04D3w0GMTk2NXy09W0Q1zs1w1zzzw7zzzyzzzzzzzy"

                            if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
                            {
                                Send, {Right 5}
                                Goto, barrel_ramp_nitro_end
                            }

                            ; nitro blue left

                            Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"

                            if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
                            {
                                Send, {Left 5}
                                Goto, barrel_ramp_nitro_end
                            }

                            ; nitro blue right

                            Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"

                            if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
                            {
                                Send, {Right 5}
                                Goto, barrel_ramp_nitro_end
                            }

                            ; barrel left

                            Text:="|<>*142$23.zzzzzzxzzzvzzznzzz7zzyDzzsDzzkTzz0Tzy0zzs0zzU1zy03zs07z00Ds00S002k005k00PU01rU0DjU0zTU7yzU01zzzz"

                            if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
                            {
                                Send, {Left 5}
                                Goto, barrel_ramp_nitro_end
                            }

                            ; barrel right

                            Text:="|<>*167$23.zzzzyzzzxzzznzzzbzzy7zzwDzzkDzzUTzz0Tzw0Tzs0TzU0TzU0Ty00Dw003t000m001q007C00DT00wz03w00DzzzzU"

                            if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
                            {
                                Send, {Right 5}
                                Goto, barrel_ramp_nitro_end
                            }

                            ; ramp left

                            Text:="|<>*147$26.zzzzzzzbzzzUzzzk7zzk0zzk07zs00zs007s001s006M003b003tk01yS01zbU1ztw1zyT0007s001zzzzs"

                            if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text))
                            {
                                Send, {Left 5}
                                Goto, barrel_ramp_nitro_end

                            }

                            ; ramp right

                            Text:="|<>*147$26.zzzzzzzbzzzUzzzk7zzk0zzk07zs00zs007s001s006M003b003tk01yS01zbU1ztw1zyT0007s001zzzzs"

                            if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
                            {
                                Send, {Right 5}
                                Goto, barrel_ramp_nitro_end

                            }

                            ; switch to right route

                            Text:="|<>*151$24.zzzzzzxzzzsTzzU7zz01zzs7zzs7zzs3zzs3zzk3zzU3zw07zk0Dz00Ty03zw07zs0Dzk0Tzk0Tzk0zzk0zzk0zzU0zzU0zzU0zzU0TzzzzzU"

                            if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text))
                            {
                                Send, {Right 5}
                                Goto, barrel_ramp_nitro_end
                            }

                            barrel_ramp_nitro_end:

                                Sleep, 1000

                                ; almost end
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 668, 61, 800, 98, 0xFFFF00, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Send, {Space 2}
                                }
                                Else
                                {
                                    ; mid
                                    CoordMode, Pixel, Screen
                                    PixelSearch, FoundX, FoundY, 554, 59, 667, 97, 0xFFFF00, 0, Fast RGB
                                    If (ErrorLevel = 0)
                                    {
                                        Send, {Space}
                                        Sleep, 1000
                                        Send, {Space}
                                    }
                                    Else
                                    {
                                        ; start
                                        CoordMode, Pixel, Screen
                                        PixelSearch, FoundX, FoundY, 437, 62, 555, 97, 0xFFFF00, 0, Fast RGB
                                        If (ErrorLevel = 0)
                                        {
                                            Send, {Space 2}
                                        }
                                        else
                                        {
                                            ; shockwave
                                            Send, {Space 2}

                                        }
                                    }
                                }

                                Sleep, 1000

                                ; application interuppted / no opponent / no connection to the game server start

                                Text:="|<>*159$33.zzzzzzTzzzrlzzzwQ7zzz1UTzzkC1zzw3s7zz0zUTzkDy1zw3zs7z0zzUTkDzy1w3zzs70zzzU0Dzzy03zzzs0zzzzUDzzzw1zzzz07zzzk0Tzzw21zzz0s7zzkDUTzw3y1zz0zs7zkDzUTw3zy1z0zzs7kDzzUQ3zzy1UzzzsCDzzzXzzzzyzzzzzzU"

                                if (ok:=FindText(X, Y, 1066, 234, 1108, 279, 0, 0, Text))
                                {
                                    Loop, 10{
                                        Send, {Escape}
                                        Sleep, 1000
                                    }
                                    Goto , entering_mp_1_start1
                                }
                                ; application interuppted / no opponent / no connection to the game server end

                                ; you have been disconnected from server start
                                ; still disconnected
                                Text:="|<>*117$71.7z7zUzkzwQ00DwDz0zVzks00TsTw1zXzVk00zkzs3z3z3VzlzVzl7y7wD3zXz3zW7yDsS7z7y7y4DwDkwDyDwDwQTsTXsTwTsTssTky7kzszkzVkzlwDVzk01z3lzXsT00U03yDXz3ly01007wT3y7Xw02DwDky7yC7sTwTsTVyDwQDkzszkz00DsMzVzlzVw00Tklz3zXz3s00zl3y7z7y7lzlzWDwDyDwDXzVz0TsTwTsS7z3z0zk00zkwDz7y1zU01zVszy7w7z00E"

                                if (ok:=FindText(X, Y, 331, 103, 410, 128, 0, 0, Text))
                                {
                                    Sleep, 2500
                                    Goto, script_start
                                }
                                ; you have been disconnected from server start

                                ; no internet {Retry}
                                Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"

                                if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text))
                                {
                                    Sleep, 1000
                                    Click, 693, 500 Left, 1
                                    Sleep, 2500
                                    Goto, script_start
                                }

                                ; token color check to verify home screen

                                Text:="|<>*72$29.zzrzzzy3zzzs3zzz01zzw01zzk00zy000zs0k0z03k0Q07k0E0Tk0E0nU1U37U3067070Tz0S1zy0w3zy1wA0S7sM0QDk000Tk001zU003z0007z000Ty000zw001y"

                                if (ok:=FindText(X, Y, 787, 42, 823, 80, 0, 0, Text))
                                {
                                    Goto , main_menu_loaded_check_start
                                }

                                ; where to get bps screen

                                Text:="|<>*160$32.zzzzzyTzzyD3zzz3UTzzUy3zzkTkTzsDy3zw7zUTy3zw3z1zzkTUzzy3kTzzkMDzzy07zzzU3zzzw1zzzzUTzzzk3zzzs0Tzzw43zzy3UTzz1y3zzUzkTzkTy3zsDzkTw7zw3y3zzkT1zzy3UzzzkQTzzyDjzzzrzzzzzs"

                                if (ok:=FindText(X, Y, 1142, 92, 1188, 136, 0, 0, Text))
                                {
                                    Click, 1163, 116 Left, 1
                                    Goto , main_menu_loaded_check_start
                                }

                                ; TD check in race
                                CoordMode, Pixel, Screen
                                PixelSearch, FoundX, FoundY, 208, 133, 244, 150, 0xFE0101, 0, Fast RGB
                                If (ErrorLevel = 0)
                                {
                                    Send, {Tab}
                                }

                                ; Resume
                                Text:="|<>*152$13.zzTzzzzzvU1k0s0Q0C0703ztzwzyQ0C0703U1k0s0Q0D07zzzzzyU"

                                if (ok:=FindText(X, Y, 1130, 227, 1150, 257, 0, 0, Text))
                                {
                                    Send, {Escape}
                                }

                                ; searching for players
                                Loop, 60
                                {
                                    Text:="|<>*118$37.zzzzzzy7tws1z3wyQ0TVyDCD7Uz3b7XmDVnXltbkNlswntAswQswmQSCSSNCD70DC77X03b3XlXlnllsnwtss0tyQyQ0Tzzzzzy"

                                    if (ok:=FindText(X, Y, 712, 559, 756, 579, 0, 0, Text))
                                    {
                                        Sleep, 1000
                                    }
                                    else
                                    {
                                        Break
                                    }
                                }
                                Text:="|<>*118$37.zzzzzzy7tws1z3wyQ0TVyDCD7Uz3b7XmDVnXltbkNlswntAswQswmQSCSSNCD70DC77X03b3XlXlnllsnwtss0tyQyQ0Tzzzzzy"

                                if (ok:=FindText(X, Y, 712, 559, 756, 579, 0, 0, Text))
                                {
                                    Goto, script_start
                                }

                                ; connecting to the server mp start
                                Loop, 60
                                {

                                    Text:="|<>*71$43.zzzzzzzs0Dzzzzs00zzzzw00Dzzzy007zzzz3z3zzzzVzkzzzzkzsTzzzsTwDzzzwDy7zzzy7z3zzzz3zVzzzzVzUzzzzkTUzzzzs00Tzzzw00Tzzzy00zzzzz1sTzzzzVw7zzzzkz3zzzzsTUzzzzwDsTVsS67w7kwD33z3sS7VVzUwD3kkzsS7VsQTwD3kwDzzzzzzy"

                                    if (ok:=FindText(X, Y, 578, 624, 628, 658, 0, 0, Text))
                                    {
                                        Sleep, 1000
                                    }
                                    else
                                    {
                                        Break
                                    }
                                }
                                Text:="|<>*71$43.zzzzzzzs0Dzzzzs00zzzzw00Dzzzy007zzzz3z3zzzzVzkzzzzkzsTzzzsTwDzzzwDy7zzzy7z3zzzz3zVzzzzVzUzzzzkTUzzzzs00Tzzzw00Tzzzy00zzzzz1sTzzzzVw7zzzzkz3zzzzsTUzzzzwDsTVsS67w7kwD33z3sS7VVzUwD3kkzsS7VsQTwD3kwDzzzzzzy"

                                if (ok:=FindText(X, Y, 578, 624, 628, 658, 0, 0, Text))
                                {
                                    Goto, script_start
                                }
                                ; connecting to the server mp end

                                IfWinExist, Asphalt 9: Legends
                                {
                                    WinActivate, Asphalt 9: Legends
                                    Sleep, 250
                                    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                    WinRestore, Asphalt 9: Legends
                                }
                                else
                                {
                                    ToolTip, spaceloop end, 640, 0,
                                    Sleep, 1000
                                    Goto, script_start
                                }
                                ; GOTO spaceloop start
                                Goto, Space_loop_in_race_start
                            }

                            Space_loop_in_race_end:

                            rewards_skip_start:

                                Sleep, 1000

                                IfWinExist, Asphalt 9: Legends
                                {
                                    WinActivate, Asphalt 9: Legends
                                    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                    WinRestore, Asphalt 9: Legends
                                }
                                else
                                {
                                    ToolTip, rewards skip start, 640, 0,
                                    Sleep, 1000
                                    Goto, script_start
                                }

                                Text:="|<>*144$3.zz0zzzzzzzzU"

                                if (ok:=FindText(X, Y, 1184, 184, 1223, 222, 0, 0, Text))
                                {
                                    Sleep, 250
                                    MouseMove, 1188, 649
                                    Click, 1188, 649 Left, 1
                                    Sleep, 250
                                }
                                else
                                {

                                    Sleep, 1000
                                    MouseMove, 1188, 649
                                    Click, 1188, 649 Left, 1
                                    Sleep, 1000

                                    ; Demoted
                                    Text:="|<>*154$35.DzUS0wzzUw3lzz1sD7UD3kQD0S7VsS0wD7Uw1sSS1s3kww3k7Vvk7UD3z0D0S7z0S0wDz0w1sTC1s3kyS3k7VsS7UD3kQD0S7UwS0wD0wT7kS0szzUw1szy1s1w"

                                    if (ok:=FindText(X, Y, 609, 520, 659, 554, 0, 0, Text))
                                    {
                                        Send, {Escape}
                                    }
                                    ; club ms claim later
                                    Text:="|<>*148$74.w00S0zzXzsTyD00DkDzszy7zvk03w3zyDzVzyw00z01k3U0Q3z00Cs0Q0s070Tk07C070C01k7w01nU1k3U0Q1z00Qs0Q0s070Tk0D7070C01k7w03Vk1k3zkQ3z00sQ0Q0zw7zvk0C7U70C01zww070s1k3U0TyD01zy0Q0s073Xk0TzU70C01kww0Dzw1k3U0Q7D03U70Q0s071vk0s1k70C01kCzzC0S1k3zsQ3zzr03UQ0zy70S"

                                    if (ok:=FindText(X, Y, 452, 578, 544, 615, 0, 0, Text))
                                    {
                                        Send, {Escape}
                                    }

                                    ; tier unlocked
                                    Text:="|<>*110$82.1w0Q007k1kDk3szy3s00zU7Uz0TrzwDU07y0S3y1zzzky00Ts1sDs7zsDXs01zU7UzUzz0yDU07z0S3y3zw3sy00yw1sDwDzkDXs03nk7Uxlvz00DU0DD0S3r7jw00y00wy1sDSQzk03s07ls7Uxtnz00DU0S7US3njDw00y01sS1sDDszk03s07Vw7UwzXz0QDU0zzkS3lyDw3sy03zz1sD7szkDXs0Dzw7UwT3z0yDU0zzsS3ksDy7sy07k7VsD00zzz3zyS0S7Uw03rzwDzts1wS3k0DDzUzzbU7lsD00y"

                                    if (ok:=FindText(X, Y, 562, 536, 705, 597, 0, 0, Text))
                                    {
                                        Send, {Escape}
                                    }

                                    ; star up check it later
                                    Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"

                                    if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text))
                                    {
                                        Send, {Escape}
                                    }

                                    ; connection error retry
                                    Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"

                                    if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text))
                                    {
                                        Goto, script_start
                                    }
                                    ; asphalt 9 loading screen stuck
                                    Loop, 30
                                    {

                                        Text:="|<>*53$36.zzzzzzy00001w00001k00001k00001U7zzzzUDzzzzUDzzzzUDzzzzU7zwvzk0000Dk00007s00003w00003zzzzk3zzzzw1zzzzw1zzzzw1zzzzs3U00003U00007U0000DU0001zzzzzzzU"

                                        if (ok:=FindText(X, Y, 745, 429, 795, 468, 0, 0, Text))
                                        {
                                            Sleep, 1000
                                        }
                                        else
                                        {
                                            Break
                                        }
                                    }
                                    Text:="|<>*53$36.zzzzzzy00001w00001k00001k00001U7zzzzUDzzzzUDzzzzUDzzzzU7zwvzk0000Dk00007s00003w00003zzzzk3zzzzw1zzzzw1zzzzw1zzzzs3U00003U00007U0000DU0001zzzzzzzU"

                                    if (ok:=FindText(X, Y, 745, 429, 795, 468, 0, 0, Text))
                                    {
                                        Goto, script_start
                                    }

                                    ; skip Ads
                                    if (ads == 0){
                                        Goto, watch_AD_end
                                    }

                                    ; <========== AD Start ==========>

                                    ; watch_AD_if_1st_2nd_OR_3rd

                                    ; 1st

                                    Text:="|<>*162$38.zzzs00Tzzs003zzw000zzw000Dzw0007zw0001zw0000Tw00007y00001y00000z00000DU00003s00000y00000D000007k00001w00000T000007k03001s03U00y03s00DU3y003s3zU00y1zs00D1zw007tzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Tzzy007zzzU03zzy"

                                    if (ok:=FindText(X, Y, 106, 82, 159, 178, 0, 0, Text))
                                    {
                                        Goto, watch_AD_start
                                    }
                                    else
                                    {
                                        ; 2nd
                                        Text:="|<>*163$51.zzzzzzzzzwDz3y00zz0zkDk00zs7y1w003y0zkTU00Tk3y3w003y0TUTUTUDk3w3w7y1y0DUT0zkTU1w7s7y3w0DUz0zUTU0s7sDw3w070z1zUTUUs7kDw7s431y1zUz0kMDkDs7s621y3z0z1k0DkTs7sD01w3z1y1s0TUTsDkD03w3y1y1w0TUzkDkTU3w7y1y3w0T0zkTUTk7s7s3w3y0z000TUTk7s007w7z0z001zUzs7k00zwDzVz00zzzzzzzzzzw"

                                        if (ok:=FindText(X, Y, 156, 86, 212, 125, 0, 0, Text))
                                        {
                                            Goto, watch_AD_start
                                        }
                                        else
                                        {
                                            ; 3rd
                                            Text:="|<>*164$50.zzzzzzzzzs07zs03zy00Dy007z001z000zk00Dk00Dw003w003z0y0z0z0TkTkDkTs7s7w3s7y3y1z0y1zUzUTkDUTkDsDw7sDw3y3z1y3z0z0zUT0zkTkDkDkDw7w003w3y1z001z1zUTk00zkTs7s00zs7y3y1kDy1zUzUS3zUTkDsDUTsDw3y3s7y3z0z0y1z0zkTkDkDkDk7w3w3w001z1z0z000zkTk7k00Ts7y1s00Tz3zUz00zzzzzzzzzzs"

                                            if (ok:=FindText(X, Y, 158, 90, 214, 124, 0, 0, Text))
                                            {
                                                Goto, watch_AD_start
                                            }
                                            else
                                            {
                                                Goto, watch_AD_end
                                            }
                                        }
                                    }

                                    watch_AD_start:

                                        Sleep, 500

                                        ; click on ad text
                                        Text:="|<>*126$37.0000000DU3zw07k1zz07w0zzk3y0S1s1r0D0S1vU7UD0xs3k7UQQ1s3kCC0w1sD7US0w73kD0S3Us7UD1kQ3k7VsD1s3kzzUw1sTzkS0wTzwD0SD0S7UD7073k7bU3VzzXk1szzlk0QTzk000000U"

                                        if (ok:=FindText(X, Y, 1094, 519, 1139, 548, 0, 0, Text))
                                        {
                                            Sleep, 1000
                                            Click, 962, 523 Left, 1
                                            Sleep, 1000
                                        }
                                        Else
                                        {
                                            Goto, watch_AD_end
                                        }

                                    close_AD:

                                        Loop, 60
                                        {
                                            Sleep, 1000
                                            IfWinExist, Asphalt 9: Legends
                                            {
                                                WinActivate, Asphalt 9: Legends
                                                WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                                WinRestore, Asphalt 9: Legends
                                            }
                                            else
                                            {
                                                ToolTip, Close AD, 640, 0,
                                                Sleep, 1000
                                                Goto, script_start
                                            }
                                            Sleep, 250
                                            WinClose, Microsoft Store
                                            Sleep, 250
                                            WinClose, Privacy - Vungle - Google Chrome
                                            Sleep, 250

                                            CoordMode, Pixel, Screen
                                            PixelSearch, FoundX, FoundY, 1218, 43, 1261, 54, 0xFFFFFF, 0, Fast RGB
                                            If (ErrorLevel = 0)
                                            {
                                                Sleep, 250
                                                Click, 1228, 73 Left, 1
                                                Sleep, 250

                                            }
                                            CoordMode, Pixel, Screen
                                            PixelSearch, FoundX, FoundY, 1203, 40, 1249, 64, 0xE8E8E8, 0, Fast RGB
                                            If (ErrorLevel = 0)
                                            {
                                                Sleep, 250
                                                Click, 1228, 73 Left, 1
                                                Sleep, 250
                                            }
                                            CoordMode, Pixel, Screen
                                            PixelSearch, FoundX, FoundY, 1203, 43, 1257, 58, 0xF5F5F6, 0, Fast RGB
                                            If (ErrorLevel = 0)
                                            {
                                                Sleep, 250
                                                Click, 1228, 73 Left, 1
                                                Sleep, 250
                                            }
                                            ; ad with close text
                                            Text:="|<>*165$58.zzyTzzzzzzs1tzzzzzzz03bzzzzzzlzyTzzzzzzDztzzzzzztzzbzzzzzzjzyTUTkDUQzztsMyAwAnzzb7ttzntDzyQznbyTkzztrzCTtz3zzaTwwzbwDzyNznsy00zztbzDsvztzzbTwztbzbzyQznzaTz7ztvyTyQzS03bVXlXlly0STUTUTkC"
                                            if (ok:=FindText(X, Y, 1147, 39, 1264, 89, 0, 0, Text))
                                            {
                                                Sleep, 250
                                                Click, 1225, 61 Left, 1
                                                Sleep, 5000
                                            }
                                            ; close this ad with green button
                                            Text:="|<>*137$48.00001s0000001s7s00001sTy00001szy00001ssT00001s0D00001s0D00001s0D3y07ts0DDz0Dxs0SDzUTzs0yA7Uy7s1w03kw3s1s03ls1s3k0zls1s3UDzls1s7UTzls1s7US3ls1s3Uw3ls1s00w3kw3s00w7ky7s3UTzkzzs7kTvkTxs7k7nk7ls3UU"

                                            if (ok:=FindText(X, Y, 682, 433, 746, 474, 0, 0, Text))
                                            {
                                                Sleep, 250
                                                Click, 447, 572 Left, 1
                                                Sleep, 250
                                            }

                                            ; circle close

                                            Text:="|<>*133$22.Xzz47zs0Dz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk0TzUXzz6"

                                            if (ok:=FindText(X, Y, 1208, 51, 1252, 101, 0, 0, Text))
                                            {
                                                Sleep, 250
                                                Click, 1228, 71 Left, 1
                                                Sleep, 250

                                            }

                                            ; march of empires

                                            Text:="|<>*161$22.Xzz47zs0Dz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk8TzVnzzC"

                                            if (ok:=FindText(X, Y, 1213, 58, 1248, 91, 0, 0, Text))
                                            {
                                                Sleep, 250
                                                Click, 1229, 72 Left, 1
                                                Sleep, 250

                                            }

                                            ; resume ad
                                            Text:="|<>*123$77.03z00000000000zzk0000000003zzs000000000Tzzs000000001zzzs000000003z0zk00000000Ds0Tk00000000zU0TU00000001y00zU1zU003w7w00k0Tzs1yTyDs0001zzs3xzyTU0007zzk7zzyz0000DzzkDzzxy0000zUzUTwDzw0001y0z0zkDzs0000Q1y1z0Tzk000003w3w0TzU00000Ds7s0zz00000DzkDk1zy00007zzUTU3zw00M0Tzz0z07zw00y3zty1y0Dzs03y7w3w3w0Tjk07wTU7s7s0zTk0Tkz0DkDk1yTk1zVy0zUTU3wzs7y3y3z0z07szzzs7zzy1y0Dkzzzk7zzw3w0TUTzy07zvw7s0z0Tzs07zbsDk1y07y003w7kTU3y"

                                            if (ok:=FindText(X, Y, 478, 266, 592, 326, 0, 0, Text))
                                            {
                                                Sleep, 500
                                                Click, 857, 448 Left, 1
                                                Sleep, 500
                                            }

                                            Text:="|<>*177$23.XzzW3zy03zs03zU83y0s3s3s3UDs20zs03zs0Dzs0zzs3zzU3zy03zs03zU83y0s3s3s3UDs20zs03zs0Dzs8zzsk"

                                            if (ok:=FindText(X, Y, 1206, 60, 1245, 99, 0, 0, Text))
                                            {
                                                Sleep, 250
                                                Click, 1229, 72 Left, 1
                                                Sleep, 250
                                            }

                                            ; syncing to the server start
                                            Loop, 30
                                            {
                                                Text:="|<>*127$33.zzzzzwwz7k7bXsw0QwD73XbVssyAw777lbUsszwwX77zbaMszwwl761bb8ssAww77lbbUsyAwy77lbbkswQwz7U3bbsy0zzzzzzU"
                                                if (ok:=FindText(X, Y, 1221, 604, 1261, 631, 0, 0, Text))
                                                {
                                                    Sleep, 1000
                                                }
                                                else
                                                {
                                                    Sleep, 1000
                                                    Break
                                                }
                                            }
                                            Text:="|<>*127$33.zzzzzwwz7k7bXsw0QwD73XbVssyAw777lbUsszwwX77zbaMszwwl761bb8ssAww77lbbUsyAwy77lbbkswQwz7U3bbsy0zzzzzzU"

                                            if (ok:=FindText(X, Y, 1221, 604, 1261, 631, 0, 0, Text))
                                            {
                                                Goto, script_start
                                            }
                                            ; syncing to the server end

                                            ; ad next
                                            Text:="|<>*128$62.000000000030A3zlk37zls3VzwS1vzyS0sTz3UQTzbkC700wD0Q1w3Vk073U70TUsQ01tk1k7wC700CQ0Q1r3Vk03y070RssTw0TU1k7CC7zU7k0Q1lnVzs1w070QQsQ00TU1k73i700Ds0Q1kzVk03b070Q7sQ01tk1k71y700QC0Q1kDVk0D3k70Q1sTz3UQ1k70S7zls7UQ1k3VzwQ0s7000000000008"

                                            if (ok:=FindText(X, Y, 1006, 628, 1083, 661, 0, 0, Text))
                                            {
                                                Sleep, 250
                                                Click, 1154, 639 Left, 1
                                                Sleep, 250
                                                Break
                                            }

                                            ; token color check to verify home screen to break loop

                                            Text:="|<>*72$29.zzrzzzy3zzzs3zzz01zzw01zzk00zy000zs0k0z03k0Q07k0E0Tk0E0nU1U37U3067070Tz0S1zy0w3zy1wA0S7sM0QDk000Tk001zU003z0007z000Ty000zw001y"

                                            if (ok:=FindText(X, Y, 787, 42, 823, 80, 0, 0, Text))
                                            {
                                                Break
                                            }

                                        }

                                        Loop, 20
                                        {
                                            ; i check to break loop
                                            Text:="|<>*144$3.zz0zzzzzzzzU"

                                            if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                                            {
                                                Break
                                            }
                                            else
                                            {
                                                Sleep, 500
                                                MouseMove, 1188, 649
                                                Click, 1188, 649 Left, 1
                                                Sleep, 500
                                                ; star up check it later
                                                Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"

                                                if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text))
                                                {
                                                    Send, {Escape}
                                                }

                                                ; connection error retry
                                                Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"

                                                if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text))
                                                {
                                                    Goto, script_start
                                                }

                                                ; club ms claim later
                                                Text:="|<>*148$74.w00S0zzXzsTyD00DkDzszy7zvk03w3zyDzVzyw00z01k3U0Q3z00Cs0Q0s070Tk07C070C01k7w01nU1k3U0Q1z00Qs0Q0s070Tk0D7070C01k7w03Vk1k3zkQ3z00sQ0Q0zw7zvk0C7U70C01zww070s1k3U0TyD01zy0Q0s073Xk0TzU70C01kww0Dzw1k3U0Q7D03U70Q0s071vk0s1k70C01kCzzC0S1k3zsQ3zzr03UQ0zy70S"

                                                if (ok:=FindText(X, Y, 452, 578, 544, 615, 0, 0, Text))
                                                {
                                                    Send, {Escape}
                                                }

                                                ; tier unlocked
                                                Text:="|<>*110$82.1w0Q007k1kDk3szy3s00zU7Uz0TrzwDU07y0S3y1zzzky00Ts1sDs7zsDXs01zU7UzUzz0yDU07z0S3y3zw3sy00yw1sDwDzkDXs03nk7Uxlvz00DU0DD0S3r7jw00y00wy1sDSQzk03s07ls7Uxtnz00DU0S7US3njDw00y01sS1sDDszk03s07Vw7UwzXz0QDU0zzkS3lyDw3sy03zz1sD7szkDXs0Dzw7UwT3z0yDU0zzsS3ksDy7sy07k7VsD00zzz3zyS0S7Uw03rzwDzts1wS3k0DDzUzzbU7lsD00y"

                                                if (ok:=FindText(X, Y, 562, 536, 705, 597, 0, 0, Text))
                                                {
                                                    Send, {Escape}
                                                }

                                                ; Demoted
                                                Text:="|<>*154$35.DzUS0wzzUw3lzz1sD7UD3kQD0S7VsS0wD7Uw1sSS1s3kww3k7Vvk7UD3z0D0S7z0S0wDz0w1sTC1s3kyS3k7VsS7UD3kQD0S7UwS0wD0wT7kS0szzUw1szy1s1w"

                                                if (ok:=FindText(X, Y, 609, 520, 659, 554, 0, 0, Text))
                                                {
                                                    Send, {Escape}
                                                }

                                                ; rewards next
                                                Text:="|<>*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"

                                                if (ok:=FindText(X, Y, 1106, 635, 1187, 666, 0, 0, Text))
                                                {
                                                    Sleep, 250
                                                    MouseMove, 1188, 649
                                                    Click, 1188, 649 Left, 1
                                                    Sleep, 1500
                                                    Goto, i_check_to_play_start
                                                }
                                                else
                                                {
                                                    Sleep, 1000
                                                    MouseMove, 1188, 649
                                                    Click, 1188, 649 Left, 1
                                                    Sleep, 1500
                                                    ; in activity
                                                    Text:="|<>*131$60.3zkT01zVzkVzky00TVzkVzUw00TVzkkzVwDsDVzkkz1wDwDVzkkT3sTwDVzksT3sTwDVzksC7sTwDVzkwC7sTwDVzkw4DsTwDVzky4DsTwDVzky0TsTwDVzkz0TsTwDVzkz0zsTwDVzkzUzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzwDwDVzUzVzw7kDkT1zVzw00Tk01zVzy00zs03zVzzU1zy0DU"

                                                    if (ok:=FindText(X, Y, 189, 231, 271, 283, 0, 0, Text))
                                                    {
                                                        Goto, script_start
                                                    }

                                                }

                                                IfWinExist, Asphalt 9: Legends
                                                {
                                                    WinActivate, Asphalt 9: Legends
                                                    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                                    WinRestore, Asphalt 9: Legends
                                                }
                                                else
                                                {
                                                    ToolTip, Close AD rewards check, 640, 0,
                                                    Sleep, 1000
                                                    Goto, script_start
                                                }

                                            }
                                        }

                                        ; i check
                                        Text:="|<>*144$3.zz0zzzzzzzzU"

                                        if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                                        {
                                        }
                                        else
                                        {
                                            Goto, script_start
                                        }

                                    watch_AD_end:

                                        ; <========== AD End ==========>

                                        Goto, rewards_skip_start
                                    }

                                    rewards_skip_end:
                                    }
                                    Goto, main_menu_loaded_check_start
                                    ExitApp
                                    ^p:: Pause
                                    ^q::
                                        SoundSet, 0, , mute
                                    ExitApp

                                    #Include, %A_ScriptDir%\src\functions\StartGame.ahk
                                    #Include, %A_ScriptDir%\src\functions\StuckOnGlLogo.ahk
                                    #Include, %A_ScriptDir%\src\functions\StuckOnLoadingScreen.ahk
                                    #Include, %A_ScriptDir%\src\functions\MainMenuLoadedCheck.ahk
                                    #Include, %A_ScriptDir%\src\functions\Events.ahk
                                    #Include, %A_ScriptDir%\src\functions\Hunt.ahk
                                    #Include, %A_ScriptDir%\src\functions\PlayRace.ahk
                                    #Include, %A_ScriptDir%\src\functions\MP1.ahk
                                    #Include, %A_ScriptDir%\src\functions\CarsSkip.ahk

                                    #Include, %A_ScriptDir%\src\functions\CommonFunctions.ahk

                                    #Include, %A_ScriptDir%\src\libs\JSON.ahk
                                    #Include, %A_ScriptDir%\src\libs\FindText.ahk