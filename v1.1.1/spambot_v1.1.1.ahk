Main() {

    static

    m = test, n = 0, f = 0, p

    Gui +AlwaysOnTop
        Gui, Add, Text,, Message to spam:
        Gui, Add, Edit, w250 vm
        Gui, Add, Text,, Number of messages:
        Gui, Add, Edit, w50 Number vn, 50
        Gui, Add, Text,, Frequency (Hz):
        Gui, Add, Edit, w50 Number vf, 10
        Gui, Add, Progress, w250 BackgroundC0C0C0 vp
        Gui, Add, Button, x10 y170 gCallSpam Default, Spam!
        Gui, Add, Button, x50 y170 gCancel, Cancel
        Gui, Show, w270, SpamBot
    return

    CallSpam:
        Gui, Submit, NoHide
        Spam(m, n, f, p)
    return

    GuiClose:
        ExitApp

}

Spam(m, n, f, ByRef p) {

    i = 0
    t := (1000 * 1 / f)

    GuiControl,, p, 0

    MsgBox, 4096,, % "message: " . m . ", number: " . n . ", time: " . t . ". Spambot will start in 5 seconds"

    Sleep, 5000

    Loop %n% {
        i := i + 1
        a := 100 * i / n
        SendInput %m%
        SendInput {Enter}
        GuiControl,, p, %a%
        Sleep %t%
    }

}

Cancel() {

    ExitApp

}

Main()
