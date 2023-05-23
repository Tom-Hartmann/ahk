#SingleInstance, Force
#maxThreadsPerHotkey, 2
#IfWinActive ahk_exe Warframe.x64.exe
    setKeyDelay, 50, 50
    setMouseDelay, 50
    SendMode Input ; For speed and reliability
    SetBatchLines -1 ; No script sleep, for more consistent timing behavior. Default behavior is 10ms execution then 10ms sleep
    ListLines Off ; Increase performance by a few percent by not logging the lines of code that are executed
    afk:=0
    protea:=0
    schwingdeinding:=0
    ember:=0
    revenant:=0

    $f1:: ;Anti Afk Toggle
        afk:=!afk

        while (afk=1) 
        {
            Sleep 3000
            Send, {w Down}
            Sleep 896
            Send, {w Up}
            Sleep 2325
            Send, {s Down}
            Sleep 1000
            Send, {s Up}
            Sleep 3653
            Send, {w Down}
            Sleep 10
            Send, {w Up}
            Sleep 1000
            Send 5
            Sleep 1800
            Send, {Ctrl Down}
            Sleep 100
            Send, {1 Down}
            Sleep 100
            Send, {1 Up}
            Sleep 1000
            Send, {1 Down}
            Sleep 100
            Send, {1 Up}
            Send, {Ctrl Up}
            Sleep 2000
            Send 5
            Sleep 300
        }
    $f2:: ;Protea afk 1 direction
        protea:=!protea

        Loop,
        {
            If not protea
                break
            y := Mod(A_Index, 5)
            if (y = 0)
                { Send, {f5}
            Sleep, 400
            Send 1
            Sleep, 1000
            Send, {1 Down}
            Sleep 1000
            Send, {1 Up}
        }
        if (y = 3){
            Send, {w Down}
            Sleep 1500
            Send, {w Up}
            Sleep 300
            Send, {s Down}
            Sleep 1500
            Send, {s Up}
            Sleep 500
        }
        else {
            Send 2
            Sleep 6000
            Send 2
            Sleep 6000
            Send 2
            Sleep 6000
            Send 2
        }
    }

    while (protea=1) {
        Send 3
        Sleep 55000
    } 
    $f4::
        schwingdeinding:=!schwingdeinding
        Loop,
        {
            If not schwingdeinding
                Break

            Send, {w Down}
            Send, {Ctrl Down}
            Send, {e}
            Send, {Ctrl Up}
            Sleep 100
            Send, {w Up}
        }

        ;Ember Prime mit
    Numpad1::
        ember:= !ember
        Loop,
        {
            If not ember
                break
            x := Mod(A_Index, 5)
            if (x = 0)
            {
                Sleep, 1500
                Send, {f5}
                Send, {w Down}
                Sleep 600
                Send, {w Up}
                Sleep 2325
                Send, {s Down}
                Sleep 700
                Send, {s Up}
                Sleep 500
                Send, e
                Sleep, 1000
                Click, left Down
                Sleep 1000
                Click, left Up
                Sleep, 2000
                Click, left Down
                Sleep 1000
                Click, left Up
                Sleep 2000
            }

            else
            {
                Send, 4
                Sleep, 2000
                Send, 4
            }
        }
    return
    ;Revenant for defence # with Rotation
    Numpad2::
        revenant:= !revenant
        Loop,
        {
            If not revenant
                break
            x := Mod(A_Index, 8)
            OutputDebug, %x%
            if(x = 0){
                Click, left Up
                Send 4
                Sleep, 750
                Send 3
                Sleep 1000
            }
            OutputDebug, %x%
            if (x = 1){ 
                Sleep, 1000
                Send 2
                Sleep, 1500
                Send {f5}
                Sleep, 652
                Send 4
                Sleep, 1000
                Click, left Down
            }
            OutputDebug, %x%
            If(x = 4){
                Send, {w Down}
                Sleep 1500
                Send, {w Up}
                Sleep 300
                Send, {s Down}
                Send, 3
                Sleep 1500
                Send, {s Up}
                Sleep 500
            }
            OutputDebug, %x%
            If(x = 2 or x = 3 or x = 5 or x = 6 or x =7) {
                Send, {w Down}
                Sleep 1500
                Send, {w Up}
                Sleep 300
                Send, {s Down}
                Sleep 1500
                Send, {s Up}
                Sleep 500
            }
        }
    f12::

        Pause

        Suspend
    return 