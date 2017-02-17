Main() {

    static

    m = test, n = 0, f = 0

    Gui +AlwaysOnTop
    Gui, Add, Text,, Message to spam:
    Gui, Add, Edit, W250 vm
    Gui, Add, Text,, Number of messages:
    Gui, Add, Edit, W50 Number vn, 50
    Gui, Add, Text,, Frequency (Hz):
    Gui, Add, Edit, W50 Number vf, 10
    Gui, Add, Button, x10 y150 gCallSpam Default, Spam!
    Gui, Add, Button, x50 y150 gCancel, Cancel
    Gui, Show, W300, SpamBot
    return

    CallSpam:
        Gui, Submit, NoHide
        Spam(m, n, f)
        return

}

Spam(m, n, f) {

    t := (1000 * 1 / f)

    MsgBox, 4096,, % "message: " . m . ", number: " . n . ", time: " . t . ". Spambot will start in 5 seconds"

    Sleep, 5000

    Loop %n% {
        SendInput %m%
        SendInput {Enter}
        Sleep %t%
    }

}

Cancel() {

    ExitApp

}

Main()
