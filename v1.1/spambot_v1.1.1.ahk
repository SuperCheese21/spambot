Main() {

    static

    m =, n =, f =, p =

    Gui +AlwaysOnTop
        Gui, Add, Text,, Message to spam:
        Gui, Add, Edit, w250 vm
        Gui, Add, Text,, Number of messages:
        Gui, Add, Edit, w50 Number vn, 50
        Gui, Add, Text,, Frequency (1-50 Hz):
        Gui, Add, Edit, Limit2 w50 Number vf, 10
        Gui, Add, Progress, w250 BackgroundC0C0C0 vp
        Gui, Add, Button, x10 y170 gCallSpam Default, Spam!
        Gui, Add, Button, x50 y170 gCancel, Cancel
        Gui, Show, w270, SpamBot
    return

    CallSpam:
        GuiControl,, p, 0
        Gui, Submit, NoHide
        Spam(m, n, f, p)
    return

    GuiClose:
        ExitApp

}

Spam(m, n, f, ByRef p) {

    i = 0
    t := (1000 * 1 / f)

    Clipboard = %m%

    MsgBox, 4096,, % "message: " . m . ", number: " . n . ", time: " . t . ". Spambot will start in 5 seconds"

    Sleep, 5000

    Loop %n% {
        i++
        SendInput ^v
        SendInput {Enter}
        a := 100 * i / n
        GuiControl,, p, %a%
        Sleep %t%
    }

}

Cancel() {

    ExitApp

}

Main()
