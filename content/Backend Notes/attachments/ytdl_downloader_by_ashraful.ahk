; GUI Setup with improved styling
Gui, Margin, 20, 20
Gui, Font, s10, Segoe UI
Gui, Color, White

; Title
Gui, Font, s16 bold
Gui, Add, Text, Center cBlue w600 h40, Quick Downloader by _ashraful

; Input fields with proper spacing
Gui, Font, s9
Gui, Add, Text, xm y+30, Enter Video/Playlist Link:
Gui, Add, Edit, xm+150 yp-4 w400 vLink

; Quality selection (reordered and vertically stacked)
Gui, Add, Text, xm y+20, Select Quality:
Gui, Add, Radio, xm+150 yp-4 vQualityCustom gSetQuality Checked, Custom Format
Gui, Add, Radio, xm+150 y+10 vQualityBest gSetQuality, Best Quality
Gui, Add, Radio, xm+150 y+10 vQuality1080 gSetQuality, 1080p

; Custom format section (visible by default now)
Gui, Add, Button, xm+150 y+15 w120 vCheckFormatsBtn gCheckFormats, Check Formats

; Format instructions
Gui, Add, Text, xm y+15 vFormatInstructions, To merge video and audio files into one file, use: videoonlyID+audioonlyID (e.g., 137+140)

; Custom format input with updated label
Gui, Add, Text, xm y+15 vCustomFormatLabel, Put Format ID here:
Gui, Add, Edit, xm+150 yp-4 w200 vCustomFormat



; Folder selection
Gui, Add, Text, xm y+20, Choose Download Folder:
Gui, Add, Button, xm+150 yp-4 gSelectFolder, Browse
Gui, Add, Text, xm+150 y+10 w400 vFolderText

; Action buttons at the bottom
Gui, Add, Button, xm y+30 gStartDownload w200, Start Download
Gui, Add, Button, xp+220 yp gExit w200, Exit

; Show GUI
Gui, Show,, Quick Downloader

; Initialize the custom format sections as visible since it's checked by default
Quality := "custom"
QualityCustomState := 1  ; Initialize the state variable for custom format
Return


CheckFormats:
Gui, Submit, NoHide
if (Link = "") {
    MsgBox, Please enter a video link first.
    Return
}

; Build the command string
Command := "yt-dlp --list-formats """ Link """"


; Open a terminal, paste the command, and run it
Run, powershell -NoExit -Command "%Command%",, Normal
Return

; Set quality on radio selection
SetQuality:
GuiControlGet, Quality1080State,, Quality1080
GuiControlGet, QualityBestState,, QualityBest
GuiControlGet, QualityCustomState,, QualityCustom

; Show/Hide custom format controls
if (QualityCustomState = 1) {
    GuiControl, Show, CheckFormatsBtn
    GuiControl, Show, FormatInstructions
    GuiControl, Show, CustomFormatLabel
    GuiControl, Show, CustomFormat

} else {
    GuiControl, Hide, CheckFormatsBtn
    GuiControl, Hide, FormatInstructions
    GuiControl, Hide, CustomFormatLabel
    GuiControl, Hide, CustomFormat

}

if (Quality1080State = 1) {
    Quality := "1080p"
} else if (QualityBestState = 1) {
    Quality := "best"
} else if (QualityCustomState = 1) {
    Quality := "custom"
}
Return

SelectFolder:
FileSelectFolder, SelectedFolder
if (SelectedFolder != "") {
    GuiControl,, FolderText, %SelectedFolder%
    DownloadFolder := SelectedFolder
}
Return

StartDownload:
Gui, Submit, NoHide

; Validate link
if (Link = "") {
    MsgBox, Please enter a video/playlist link.
    Return
}

; Validate folder selection
if (DownloadFolder = "") {
    MsgBox, Please select a download folder.
    Return
}

; Validate quality selection
if (!Quality1080State && !QualityBestState && !QualityCustomState) {
    MsgBox, Please select a quality option.
    Return
}

; Check quality and set format
if (Quality = "1080p") {
    Format := "137+140"
} else if (Quality = "best") {
    Format := "bestvideo+bestaudio"
} else if (Quality = "custom") {
    GuiControlGet, CustomFormat
    if (CustomFormat = "") {
        MsgBox, Please enter a custom format code.
        Return
    }
    Format := CustomFormat
}

; Build the command string
Command := "yt-dlp -P """ DownloadFolder """ -f """ Format """ --sleep-interval 3 --max-sleep-interval 8 """ Link """"

; Display the command in Command Prompt and then execute it
FullCommand := ComSpec " /k echo " Command " && " Command
Run, %FullCommand%,, Normal
ExitApp ; Close the AHK GUI window after starting the download
Return

Exit:
GuiClose:
ExitApp