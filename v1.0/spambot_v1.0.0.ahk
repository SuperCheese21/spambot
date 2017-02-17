Loop {

    n = 0
    f = 0

    InputBox, m, SpamBot, Enter your message:, , , 120
    if ErrorLevel
        Exit

    Loop {
        InputBox, n, SpamBot, Number of messages:, , , 120
        if ErrorLevel
            Exit
        if n is integer
            break
    }

    Loop {
        InputBox, f, SpamBot, Frequency (Hz):, , , 120
        if ErrorLevel
            Exit
        if f is integer
            break
    }

    t := (1000 * 1 / f)

    MsgBox % "message: " . m . ", number: " . n . ", time: " . t . ". Spambot will start in 5 seconds"

    Sleep, 5000

    Loop %n% {
        SendInput %m%
        SendInput {Enter}
        Sleep %t%
    }

    MsgBox, 4, , Spam again?
    IfMsgBox, No
        Break

}
