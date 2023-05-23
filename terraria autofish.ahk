#MaxThreadsPerHotkey 2

 ;*** SUSPEND HOTKEY
  ;*
  *Pause::
    Suspend
    Pause
  return



  ;*** CHAT SUSPENDS ALL HOTKEYS
  ;*
  ;*   This will occasionally glitch, fix by using the general Suspend key above.
  *~Enter::
    Suspend
    Pause
  return



  ;*** FUNCTION: mClick
  ;*
  mClick(f_delay:=0, x:="", y:="") {
    Send {Click down %x%, %y%}
    Sleep %c_delay%
    Send {Click up}
    Sleep %c_delay%
    Sleep %f_delay%
  }



  ;*** FUNCTION: keyClick
  ;*
  keyClick(f_delay, key) {
    Send {%key% down}
    Sleep %c_delay%
    Send {%key% up}
    Sleep %c_delay%
    Sleep %f_delay%
  }



  ;*** AUTOMATIC FISHING
  ;*
  ;*   Windows desktop settings must be at "Windows Classic"
  F2::

    MouseGetPos, WaterX, WaterY                   ; Get vertical position of cursor (should point just above water line)

    Loop {

      if (breakLoop = 1)
        break

      mClick(2200, 970, 900)                             ; Cast the line & wait for bob to settle

      if (breakLoop = 1)
        break

      PixelGetColor, colorA, 969, %WaterY%    ; Get the color of the bob
      colorB1 := colorA                                      ; Set the variables which will monitor for changed color of the bob
      colorB2 := colorA
      colorB3 := colorA

      Loop, 100 {                                                ; Wait for the bob to move
        if (breakLoop = 1)
          break
   
        PixelGetColor, colorB1, 969, %WaterY%
          Sleep 10
        PixelGetColor, colorB2, 969, %WaterY%
          Sleep 10
        PixelGetColor, colorB3, 969, %WaterY%
          Sleep 10
   
        if (compare(colorA, colorB1) > 5) {
          if (compare(colorA, colorB2) > 5) {
            if (compare(colorA, colorB3) > 5) {   
              Sleep 100
              mClick(0, 970, 900)
              break
            }
          }
        }   
      }

      keyClick(0, "b")                                           ; Renew buffs

    }

    breakLoop = 0
    return



  compare(c1, c2) {
    rdiff := Abs((c1 >> 16) & 0xFF - (c2 >> 16) & 0xFF)
    gdiff := Abs((c1 >> 8) & 0xFF - (c2 >> 8) & 0xFF)
    bdiff := Abs(c1 & 0xFF - c2 & 0xFF)

    return rdiff + gdiff + bdiff
  }
