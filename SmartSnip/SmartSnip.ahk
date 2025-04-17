
^+s::
FormatTime, timestamp,, yyyy-MM-dd_HH-mm-ss
screenshotPath := A_MyPictures . "\Snips\Screenshot_" . timestamp . ".png"

if !FileExist(A_MyPictures . "\Snips")
    FileCreateDir, %A_MyPictures%\Snips

RunWait, snippingtool /clip
Sleep, 500

; Save clipboard image to file using PowerShell (requires clipboard image)
RunWait, powershell -command "$img = Get-Clipboard -Format Image; $img.Save('%screenshotPath%')"
; SoundBeep 750, 150 ; optional beep
return

Esc::ExitApp
