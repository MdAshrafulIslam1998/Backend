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

Gui, Add, Text, xm y+20, Select Quality:
Gui, Add, Radio, xm+150 yp-4 vQuality1080 gSetQuality, 1080p
Gui, Add, Radio, xp+80 yp vQualityBest gSetQuality, Best Quality

Gui, Add, Text, xm y+20, Choose Download Folder:
Gui, Add, Button, xm+150 yp-4 gSelectFolder, Browse
Gui, Add, Text, xm+150 y+10 w400 vFolderText

; Action buttons at the bottom with proper spacing
Gui, Add, Button, xm y+30 gStartDownload w200, Start Download
Gui, Add, Button, xp+220 yp gExit w200, Exit

; Show GUI
Gui, Show,, Quick Downloader
Return

; Set quality on radio selection
SetQuality:
GuiControlGet, Quality1080State,, Quality1080
GuiControlGet, QualityBestState,, QualityBest
if (Quality1080State = 1) {
    Quality := "1080p"
} else if (QualityBestState = 1) {
    Quality := "best"
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
if (Link = "" or DownloadFolder = "") {
    MsgBox, Please enter a link and select a folder.
    Return
}

; Check quality and set format
if (Quality = "1080p") {
    Format := "137+140"
} else if (Quality = "best") {
    Format := "bestvideo+bestaudio"
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
