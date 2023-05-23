clicking := false ; Autoclicker starts in the off state

toggle_clicking() {
    global clicking
    clicking := !clicking ; Toggle the state of clicking
    if clicking
        MsgBox "Autoclicker on"
    else
        MsgBox "Autoclicker off"
}

; Register a hotkey to toggle the autoclicker on and off
^!c::toggle_clicking()

while true {
    if clicking
        Click 100 ; Click the mouse 100 times
}
