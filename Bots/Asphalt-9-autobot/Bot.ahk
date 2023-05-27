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

carNames := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]

#Include, %A_ScriptDir%\src\Boot.ahk
#Include, %A_ScriptDir%\src\BotConfig.ahk
#Include, %A_ScriptDir%\src\Guis\Main.ahk
#Include, %A_ScriptDir%\src\Guis\HuntCars.ahk
#Include, %A_ScriptDir%\src\Guis\CarsSkip.ahk
Hunt_Cars(id, label){
    MsgBox, its working %id% %label%
}
script_start:

    MsgBox, %Lamborghinicountach25th%

ExitApp

^p:: Pause
^q::
    SoundSet, 0, , mute
ExitApp

#Include, %A_ScriptDir%\src\libs\JSON.ahk
#Include, %A_ScriptDir%\src\libs\FindText.ahk