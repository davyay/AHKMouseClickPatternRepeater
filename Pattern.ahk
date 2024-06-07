#Persistent
#NoEnv
SendMode Input  ; Ensures commands are sent at maximum speed and reliability

; Hotkeys
F8::ToggleRecording()    ; F8 to start/stop recording
F9::TogglePlayback()    ; F9 to start/stop playback

recording := false
playback := false
clicks := []
lastPlaybackTime := 0

ToggleRecording() {
    global recording
    global clicks

    recording := !recording
    if (recording) {
        clicks := []  ; Clear previous recordings
        ToolTip, Recording, A_CaretX+10, A_CaretY+20
        SetTimer, RecordClick, 100
    } else {
        SetTimer, RecordClick, Off
        ToolTip, Done Recording, A_CaretX+10, A_CaretY+20
        SetTimer, RemoveToolTip, -1500  ; Remove tooltip after 1.5 seconds
    }
}

RecordClick:
    MouseGetPos, x, y
    thisTime := A_TickCount
    if (clicks.Length() > 0) {
        lastTime := clicks[clicks.Length()].time
        deltaTime := thisTime - lastTime
    } else {
        deltaTime := 0
    }
    clicks.Push({x: x, y: y, time: thisTime, delay: deltaTime})
return

TogglePlayback() {
    global playback
    global clicks
    global lastPlaybackTime

    playback := !playback
    if (playback) {
        if (clicks.Length() = 0) {  ; Direct check for an empty array
            ToolTip, No recorded data!, A_CaretX+10, A_CaretY+20
            SetTimer, RemoveToolTip, -1500  ; Remove tooltip after 1.5 seconds
            playback := false
            return
        }
        ToolTip, Starting Repeat, A_CaretX+10, A_CaretY+20
        SetTimer, RemoveToolTip, -1500  ; Remove tooltip after 1.5 seconds
        lastPlaybackTime := A_TickCount
        SetTimer, PlayClicks, -1  ; Call immediately to start playback loop
    } else {
        SetTimer, PlayClicks, Off
        ToolTip, Ending Repeat, A_CaretX+10, A_CaretY+20
        SetTimer, RemoveToolTip, -1500  ; Remove tooltip after 1.5 seconds
    }
}

PlayClicks:
    if (!playback) {
        return
    }
    for index, click in clicks {
        Sleep, click.delay  ; Use the stored delay before each click
        MouseClick, left, click.x, click.y
    }
    SetTimer, PlayClicks, -1  ; Re-trigger the timer to continue playback indefinitely
return

RemoveToolTip:
    ToolTip
return
