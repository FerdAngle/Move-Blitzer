#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

global move1 := "1"
global move2 := "2"
global move3 := "3"
global move4 := "4"
global move5 := "5"
global move6 := "6"
global move7 := "7"
global moveR := "r"
global moveT := "t"
global moveY := "y"


global active1 := false 
global active2 := false 
global active3 := false 
global active4 := false 
global active5 := false 
global active6 := false 
global active7 := false 
global activeR := false 
global activeT := false 
global activeY := false 

 

global startHOTKEY := "F1"
global stopHOTKEY := "F2"


global CD1 := 0
global CD2 := 0
global CD3 := 0
global CD4 := 0
global CD5 := 0
global CD6 := 0
global CD7 := 0
global CDR := 0
global CDT := 0
global CDY := 0


global HD1 := 0 
global HD2 := 0 
global HD3 := 0 
global HD4 := 0 
global HD5 := 0 
global HD6 := 0 
global HD7 := 0 
global HDR := 0 
global HDT := 0 
global HDY := 0 

global DelayBmove := 300


global MovesANDcds := {}


IniRead, currentVersion, DATA.ini, ProgramSettings, version, 1.0.0

IniRead, move1, DATA.ini, MOVES, mo1, %move1%
IniRead, move2, DATA.ini, MOVES, mo2, %move2%
IniRead, move3, DATA.ini, MOVES, mo3, %move3%
IniRead, move4, DATA.ini, MOVES, mo4, %move4%
IniRead, move5, DATA.ini, MOVES, mo5, %move5%
IniRead, move6, DATA.ini, MOVES, mo6, %move6%
IniRead, move7, DATA.ini, MOVES, mo7, %move7%
IniRead, moveR, DATA.ini, MOVES, moR, %moveR%
IniRead, moveT, DATA.ini, MOVES, moT, %moveT%
IniRead, moveY, DATA.ini, MOVES, moY, %moveY%


IniRead, CD1, DATA.ini, CDS, cd1, %CD1%
IniRead, CD2, DATA.ini, CDS, cd2, %CD2%
IniRead, CD3, DATA.ini, CDS, cd3, %CD3%
IniRead, CD4, DATA.ini, CDS, cd4, %CD4%
IniRead, CD5, DATA.ini, CDS, cd5, %CD5%
IniRead, CD6, DATA.ini, CDS, cd6, %CD6%
IniRead, CD7, DATA.ini, CDS, cd7, %CD7%
IniRead, CDR, DATA.ini, CDS, cdR, %CDR%
IniRead, CDT, DATA.ini, CDS, cdT, %CDT%
IniRead, CDY, DATA.ini, CDS, cdY, %CDY%


IniRead, HD1, DATA.ini, HDS, hd1, %HD1%
IniRead, HD2, DATA.ini, HDS, hd2, %HD2%
IniRead, HD3, DATA.ini, HDS, hd3, %HD3%
IniRead, HD4, DATA.ini, HDS, hd4, %HD4%
IniRead, HD5, DATA.ini, HDS, hd5, %HD5%
IniRead, HD6, DATA.ini, HDS, hd6, %HD6%
IniRead, HD7, DATA.ini, HDS, hd7, %HD7%
IniRead, HDR, DATA.ini, HDS, hdR, %HDR%
IniRead, HDT, DATA.ini, HDS, hdT, %HDT%
IniRead, HDY, DATA.ini, HDS, hdY, %HDY%

IniRead, DelayBmove, DATA.ini, DelayB, delay, %DelayBmove%


IniRead, active1, DATA.ini, ACTIVES, act1, %active1%
IniRead, active2, DATA.ini, ACTIVES, act2, %active2%
IniRead, active3, DATA.ini, ACTIVES, act3, %active3%
IniRead, active4, DATA.ini, ACTIVES, act4, %active4%
IniRead, active5, DATA.ini, ACTIVES, act5, %active5%
IniRead, active6, DATA.ini, ACTIVES, act6, %active6%
IniRead, active7, DATA.ini, ACTIVES, act7, %active7%
IniRead, activeR, DATA.ini, ACTIVES, actR, %activeR%
IniRead, activeT, DATA.ini, ACTIVES, actT, %activeT%
IniRead, activeY, DATA.ini, ACTIVES, actY, %activeY%



MovesANDcds[move1] := [CD1, active1, HD1] 
MovesANDcds[move2] := [CD2, active2, HD2] 
MovesANDcds[move3] := [CD3, active3, HD3] 
MovesANDcds[move4] := [CD4, active4, HD4] 
MovesANDcds[move5] := [CD5, active5, HD5]
MovesANDcds[move6] := [CD6, active6, HD6] 
MovesANDcds[move7] := [CD7, active7, HD7] 
MovesANDcds[moveR] := [CDR, activeR, HDR]
MovesANDcds[moveT] := [CDT, activeT, HDT]
MovesANDcds[moveY] := [CDY, activeY, HDY]




IniRead, startHOTKEY, DATA.ini, UserSettings, startk, %startHOTKEY%
IniRead, stopHOTKEY, DATA.ini, UserSettings, stopk, %stopHOTKEY%


Hotkey, %startHOTKEY%, StartMastering
Hotkey, %stopHOTKEY%, StopMastering

Gui, +AlwaysOnTop +Caption +Border +Resize MinSize450x250 +OwnDialogs
Gui, Add, Text, vReassignText, % "                          (Click on the numbers/letters and resassign via pressing a key)"

Gui, Add, Text, vActiveText xs ys+25 w20, % "Active:"
Gui, Add, Checkbox, vactive1Edit gSaveData  xs+80 ys+25 
Gui, Add, Checkbox, vactive2Edit gSaveData  xs+110 ys+25 
Gui, Add, Checkbox, vactive3Edit gSaveData  xs+140 ys+25 
Gui, Add, Checkbox, vactive4Edit gSaveData  xs+170 ys+25 
Gui, Add, Checkbox, vactive5Edit gSaveData  xs+200 ys+25  
Gui, Add, Checkbox, vactive6Edit gSaveData  xs+230 ys+25 
Gui, Add, Checkbox, vactive7Edit gSaveData  xs+260 ys+25 
Gui, Add, Checkbox, vactiveREdit gSaveData  xs+290 ys+25  
Gui, Add, Checkbox, vactiveTEdit gSaveData  xs+320 ys+25
Gui, Add, Checkbox, vactiveYEdit gSaveData  xs+350 ys+25 


GuiControl,, active1Edit, %active1%
GuiControl,, active2Edit, %active2%
GuiControl,, active3Edit, %active3%
GuiControl,, active4Edit, %active4%
GuiControl,, active5Edit, %active5%
GuiControl,, active6Edit, %active6%
GuiControl,, active7Edit, %active7%
GuiControl,, activeREdit, %activeR%
GuiControl,, activeTEdit, %activeT%
GuiControl,, activeYEdit, %activeY%



Gui, Add, Text, vMoveText xs ys+50, % "Moves: "
Gui, Add, Hotkey, vmove1Edit gSaveHotkeys w24 xs+80 ys+45, %move1%  
Gui, Add, Hotkey, vmove2Edit gSaveHotkeys w24 xs+110 ys+45, %move2%  
Gui, Add, Hotkey, vmove3Edit gSaveHotkeys w24 xs+140 ys+45, %move3%  
Gui, Add, Hotkey, vmove4Edit gSaveHotkeys w24 xs+170 ys+45, %move4%  
Gui, Add, Hotkey, vmove5Edit gSaveHotkeys w24 xs+200 ys+45, %move5%  
Gui, Add, Hotkey, vmove6Edit gSaveHotkeys w24 xs+230 ys+45, %move6%  
Gui, Add, Hotkey, vmove7Edit gSaveHotkeys w24 xs+260 ys+45, %move7%  
Gui, Add, Hotkey, vmoveREdit gSaveHotkeys w24 xs+290 ys+45, %moveR%  
Gui, Add, Hotkey, vmoveTEdit gSaveHotkeys w24 xs+320 ys+45, %moveT%  
Gui, Add, Hotkey, vmoveYEdit gSaveHotkeys w24 xs+350 ys+45, %moveY%  


Gui, Add, Text, vCDtext gSaveData w40 xs ys+70, % "CDs (s):"
Gui, Add, Edit, vCD1Edit gSaveData w25 h17 xs+80 ys+70, %CD1%
Gui, Add, Edit, vCD2Edit gSaveData w25 h17 xs+110 ys+70, %CD2%
Gui, Add, Edit, vCD3Edit gSaveData w25 h17 xs+140 ys+70, %CD3%
Gui, Add, Edit, vCD4Edit gSaveData w25 h17 xs+170 ys+70, %CD4%
Gui, Add, Edit, vCD5Edit gSaveData w25 h17 xs+200 ys+70, %CD5%
Gui, Add, Edit, vCD6Edit gSaveData w25 h17 xs+230 ys+70, %CD6%
Gui, Add, Edit, vCD7Edit gSaveData w25 h17 xs+260 ys+70, %CD7%
Gui, Add, Edit, vCDREdit gSaveData w25 h17 xs+290 ys+70, %CDR%
Gui, Add, Edit, vCDTEdit gSaveData w25 h17 xs+320 ys+70, %CDT%
Gui, Add, Edit, vCDYEdit gSaveData w25 h17 xs+350 ys+70, %CDY%


Gui, Add, Text, vHDtext gSaveData w70 xs ys+90, % "Hold down (s):`n(Duration)"
Gui, Add, Edit, vHD1Edit gSaveData w25 h17 xs+80 ys+90, %HD1%
Gui, Add, Edit, vHD2Edit gSaveData w25 h17 xs+110 ys+90, %HD2%
Gui, Add, Edit, vHD3Edit gSaveData w25 h17 xs+140 ys+90, %HD3%
Gui, Add, Edit, vHD4Edit gSaveData w25 h17 xs+170 ys+90, %HD4%
Gui, Add, Edit, vHD5Edit gSaveData w25 h17 xs+200 ys+90, %HD5%
Gui, Add, Edit, vHD6Edit gSaveData w25 h17 xs+230 ys+90, %HD6%
Gui, Add, Edit, vHD7Edit gSaveData w25 h17 xs+260 ys+90, %HD7%
Gui, Add, Edit, vHDREdit gSaveData w25 h17 xs+290 ys+90, %HDR%
Gui, Add, Edit, vHDTEdit gSaveData w25 h17 xs+320 ys+90, %HDT%
Gui, Add, Edit, vHDYEdit gSaveData w25 h17 xs+350 ys+90, %HDY%

Gui, Add, Text, vDelayText gSaveData w100 xs ys+135, % "Delay between moves (ms):"
Gui, Add, Edit, vDelayEdit gSaveData w40 h17 xs ys+165, %DelayBmove%



;Gui, Add, Text, xs ys+80, % "Keep a CD at 0 to not use the key"
Gui, Add, Button, vstartB gStartMastering w100 h27 xs ys195.5, % "(" . startHOTKEY . ")" "`nStart Mastering"
Gui, Add, Button, vstopB gStopMastering w100 h27 xs100 ys195.5, % "(" . stopHOTKEY . ")" "`nStop Mastering"
Gui, Add, Button, vhotkeySettingsB gHotkeySettingsGUI w100 h27 xs200 ys195.5, Hotkeys 
Gui, Show,, % "Move Blitzer v" currentVersion

global startHOTKEYPrev := startHOTKEY
global stopHOTKEYPrev := stopHOTKEY 
global move1Prev := move1 
global move2Prev := move2 
global move3Prev := move3 
global move4Prev := move4 
global move5Prev := move5 
global move6Prev := move6 
global move7Prev := move7 
global moveRPrev := moveR 
global moveTPrev := moveT 
global moveYPrev := moveY 


Gui, 2:New, +AlwaysOnTop +Caption +Border +Resize MinSize225x125  ;Hotkey GUI
Gui, 2:Add, Text,, Start Hotkey: 
Gui, 2:Add, Hotkey, vStartHotkey gSaveHotkeys w80, %startHOTKEY%
Gui, 2:Add, Text,, Stop Hotkey: 
Gui, 2:Add, Hotkey, vStopHotkey gSaveHotkeys w80, %stopHOTKEY%

global timesUsed := {}

try {
    url := "https://api.github.com/repos/FerdAngle/DB-Alerter/releases"
    currentVersion := StrSplit(currentVersion, ".")
    vFinder := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    vFinder.Open("GET", url, false)
    vFinder.SetRequestHeader("Accept", "application/json")
    vFinder.SetTimeouts(10000, 10000, 10000, 10000)
    vFinder.Send()
    json := vFinder.ResponseText

    RegExMatch(json, "((browser_download_url).*?(Move-Blitzer-v)(\d+(?:\.\d+)*)....)", browser_download_url) ; this looks extremely UGLY, but regex processes stuff in microseconds and I HATE the JSON.ahk lib. 
    ;MsgBox % browser_download_url
    RegExMatch(browser_download_url,"((https).*?(Move-Blitzer-v)(\d+(?:\.\d+)*)....)", download_url)
    RegExMatch(download_url, "(\d+(?:\.\d+)*)", NewVersion)
    NewVersionA := StrSplit(NewVersion, ".")
    for i,num in NewVersionA {
        if (num > currentVersion[i]){
            ;MsgBox % "We are on the OLD version" num currentVersion[i]
            MsgBox, 0x40044, % "New Version Found!", % "A new version is available, would you like to update now?"
            IfMsgBox Yes 
                greenlitUpdate := true         
            else    
                greenlitUpdate := false  
            break        
        } 
    }
    currentVersion := currentVersion[1] . "." . currentVersion[2] . "." . currentVersion[3]
} catch e {
    MsgBox,0x40010,Move-Blitzer, % "Could not check updates.`nCheck your internet."
}

if (greenlitUpdate){
    currentVersion := NewVersionA
    currentVersion := currentVersion[1] . "." . currentVersion[2] . "." . currentVersion[3]
    ;MsgBox,0x40000,, % currentVersion
    IniWrite, %currentVersion%, data.ini, ProgramSettings, version
    Run, %ComSpec% /C ""%A_ScriptDir%\UpdateAlert.bat" "%download_url%" "%NewVersion%""
    ExitApp 
}


return ;------------------------------------------------------SETUP ENDS HERE-------------------- 

HotkeyStates(State){
    Hotkey, %startHOTKEY%, %State% 
    Hotkey, %stopHOTKEY%, %State%  
}

UpdateMOVESandCDs(){
    MovesANDcds := {}
    MovesANDcds[move1] := [CD1, active1, HD1] 
    MovesANDcds[move2] := [CD2, active2, HD2] 
    MovesANDcds[move3] := [CD3, active3, HD3] 
    MovesANDcds[move4] := [CD4, active4, HD4] 
    MovesANDcds[move5] := [CD5, active5, HD5]
    MovesANDcds[move6] := [CD6, active6, HD6] 
    MovesANDcds[move7] := [CD7, active7, HD7] 
    MovesANDcds[moveR] := [CDR, activeR, HDR]
    MovesANDcds[moveT] := [CDT, activeT, HDT]
    MovesANDcds[moveY] := [CDY, activeY, HDY]

}

HotkeySettingsGUI:
     ;WinSet, AlwaysOnTop, Off, % "DB Alerter v"  currentVersion  " (NOT monitoring...)"
     Gui, 2:Show,, Hotkeys
     HotkeyStates("Off") 
return 

2GuiClose:
    Gui, 2:Hide
    HotkeyStates("On") 
    ;SetTimer, UglyCode, On 
   ; WinSet, AlwaysOnTop, On, % "DB Alerter v" currentVersion "(NOT monitoring...)" 
return 


RevertHotkeys:  
    GuiControl,, StartHotkey, %StartHOTKEYPrev%
    startHOTKEY := StartHOTKEYPrev 
    GuiControl,, StopHotkey, %StopHOTKEYPrev%
    stopHOTKEY := StopHOTKEYPrev
   
    GuiControl,, move1Edit, %move1Prev%
    move1 := move1Prev
   
    GuiControl,, move2Edit, %move2Prev%
    move2 := move2Prev
   
    GuiControl,, move3Edit, %move3Prev%
    move3 := move3Prev
   
    GuiControl,, move4Edit, %move4Prev%
    move4 := move4Prev
   
    GuiControl,, move5Edit, %move5Prev%
    move5 := move5Prev
   
    GuiControl,, move6Edit, %move6Prev%
    move6 := move6Prev
   
    GuiControl,, move7Edit, %move7Prev%
    move7 := move7Prev
   
    GuiControl,, moveREdit, %moveRPrev%
    moveR := moveRPrev
    GuiControl,, moveTEdit, %moveTPrev%
    moveT := moveTPrev
    
    GuiControl,, moveYEdit, %moveYPrev%
    moveY := moveYPrev

return 

SaveHotkeys:        
    Gui, 1:Submit, NoHide
    Gui, 2:Submit, NoHide 
                               
    HotkeySet := [move1Edit, move2Edit, move3Edit, move4Edit, move5Edit, move6Edit, move7Edit, moveREdit, moveTEdit, moveYEdit, StartHotkey, StopHotkey] 
    for _,hkey in HotkeySet {
        if (hkey = "" or hkey = " ") || (hkey = "!" or hkey = "^" or hkey = "+" or hkey = "^!"){
            Goto, RevertHotkeys 
            ;MsgBox,0x40000, % " "

        }
    }  
    ;no native AlphaNum checker, so gotta do it myself 
    ;MsgBox,0x40000,, % StartHotkey 
    HotkeySetAll := [move1Edit, move2Edit, move3Edit, move4Edit, move5Edit, move6Edit, move7Edit, moveREdit, moveTEdit, moveYEdit, StartHotkey, StopHotkey] 
    i_start := 1   ; works based on a (n(n-1))/ 2 formula of comparisons for checking duplicates rather than doing n^2 (Basically sigma summmation)  
    while (i_start < (HotkeySetAll.Length())){
        i_end := HotkeySetAll.Length()
        while (i_end > i_start) {
            if HotkeySetAll[i_start] = HotkeySetAll[i_end] {
                Gosub, RevertHotkeys
                Gui +Disabled 
                MsgBox,0x40030,% "Duplicate Hotkey", % "Hotkey already in use!", 1.3
                Gui -Disabled 
                return 
            }  
            i_end -= 1
        }
        i_start += 1
    }
    
    startHOTKEY := StartHotkey
    stopHOTKEY := StopHotkey 
    move1 := move1Edit 
    move2 := move2Edit  
    move3 := move3Edit  
    move4 := move4Edit  
    move5 := move5Edit  
    move6 := move6Edit  
    move7 := move7Edit  
    moveR := moveREdit  
    moveT := moveTEdit  
    moveY := moveYEdit  


    startHOTKEYPrev := startHOTKEY
    stopHOTKEYPrev := stopHOTKEY 
    move1Prev := move1 
    move2Prev := move2 
    move3Prev := move3 
    move4Prev := move4 
    move5Prev := move5 
    move6Prev := move6 
    move7Prev := move7 
    moveRPrev := moveR 
    moveTPrev := moveT 
    moveYPrev := moveY 
  

    Hotkey, %startHOTKEY%, StartMastering, Off 
    Hotkey, %stopHOTKEY%, StopMastering, Off 
    
    IniWrite, %startHOTKEY%, DATA.ini, UserSettings, startk
    IniWrite, %stopHOTKEY%, DATA.ini, UserSettings, stopk

    IniWrite, %move1%, DATA.ini, MOVES, mo1
    IniWrite, %move2%, DATA.ini, MOVES, mo2
    IniWrite, %move3%, DATA.ini, MOVES, mo3 
    IniWrite, %move4%, DATA.ini, MOVES, mo4 
    IniWrite, %move5%, DATA.ini, MOVES, mo5 
    IniWrite, %move6%, DATA.ini, MOVES, mo6 
    IniWrite, %move7%, DATA.ini, MOVES, mo7 
    IniWrite, %moveR%, DATA.ini, MOVES, moR 
    IniWrite, %moveT%, DATA.ini, MOVES, moT 
    IniWrite, %moveY%, DATA.ini, MOVES, moY 



    GuiControl,, startB,% "(" . startHOTKEY . ")" "`nStart Mastering"
    GuiControl,, stopB, % "(" . stopHOTKEY . ")" "`nStop Mastering"
    HotkeyStates("On")
 
return

SaveData:
    Gui, 1:Submit, NoHide 
    MovesANDcds := {}
    move1 := move1Edit 
    move2 := move2Edit 
    move3 := move3Edit 
    move4 := move4Edit 
    move5 := move5Edit 
    move6 := move6Edit 
    move7 := move7Edit 
    moveR := moveREdit 
    moveT := moveTEdit 
    moveY := moveYEdit 

    
    CD1 := CD1Edit 
    CD2 := CD2Edit 
    CD3 := CD3Edit 
    CD4 := CD4Edit 
    CD5 := CD5Edit 
    CD6 := CD6Edit 
    CD7 := CD7Edit 
    CDR := CDREdit 
    CDT := CDTEdit 
    CDY := CDYEdit 

    active1 := active1Edit
    active2 := active2Edit
    active3 := active3Edit
    active4 := active4Edit
    active5 := active5Edit
    active6 := active6Edit
    active7 := active7Edit
    activeR := activeREdit
    activeT := activeTEdit
    activeY := activeYEdit

    
    HD1 := HD1Edit 
    HD2 := HD2Edit 
    HD3 := HD3Edit 
    HD4 := HD4Edit 
    HD5 := HD5Edit 
    HD6 := HD6Edit 
    HD7 := HD7Edit 
    HDR := HDREdit 
    HDT := HDTEdit 
    HDY := HDYEdit 

    DelayBmove := DelayEdit 

    
    UpdateMOVESandCDs()
        
    IniWrite, %CD1%, DATA.ini, CDS, cd1  
    IniWrite, %CD2%, DATA.ini, CDS, cd2 
    IniWrite, %CD3%, DATA.ini, CDS, cd3 
    IniWrite, %CD4%, DATA.ini, CDS, cd4 
    IniWrite, %CD5%, DATA.ini, CDS, cd5 
    IniWrite, %CD6%, DATA.ini, CDS, cd6 
    IniWrite, %CD7%, DATA.ini, CDS, cd7 
    IniWrite, %CDR%, DATA.ini, CDS, cdR 
    IniWrite, %CDT%, DATA.ini, CDS, cdT 
    IniWrite, %CDY%, DATA.ini, CDS, cdY 

    
    IniWrite, %HD1%, DATA.ini, HDS, hd1  
    IniWrite, %HD2%, DATA.ini, HDS, hd2  
    IniWrite, %HD3%, DATA.ini, HDS, hd3  
    IniWrite, %HD4%, DATA.ini, HDS, hd4  
    IniWrite, %HD5%, DATA.ini, HDS, hd5  
    IniWrite, %HD6%, DATA.ini, HDS, hd6 
    IniWrite, %HD7%, DATA.ini, HDS, hd7 
    IniWrite, %HDR%, DATA.ini, HDS, hdR 
    IniWrite, %HDT%, DATA.ini, HDS, hdT 
    IniWrite, %HDY%, DATA.ini, HDS, hdY
    
    IniWrite, %DelayBmove%, DATA.ini, DelayB, delay 
   

    IniWrite, %active1%, DATA.ini, ACTIVES, act1
    IniWrite, %active2%, DATA.ini, ACTIVES, act2
    IniWrite, %active3%, DATA.ini, ACTIVES, act3 
    IniWrite, %active4%, DATA.ini, ACTIVES, act4 
    IniWrite, %active5%, DATA.ini, ACTIVES, act5 
    IniWrite, %active6%, DATA.ini, ACTIVES, act6 
    IniWrite, %active7%, DATA.ini, ACTIVES, act7 
    IniWrite, %activeR%, DATA.ini, ACTIVES, actR 
    IniWrite, %activeT%, DATA.ini, ACTIVES, actT 
    IniWrite, %activeY%, DATA.ini, ACTIVES, actY 


return 

distanceBetween(x1, y1, x2, y2){
    return Sqrt(((y2 - y1)**2) + ((x2 - x1)**2))

}

KiBarCheck:
    if !Running {
        SetTimer, KiBarCheck, Off 
        return 
    }
    KiBarPixel = 0x42A7FF
    CoordMode, Pixel, Screen 
    CoordMode, Mouse, Screen 
    PixelSearch, px, py
    , A_ScreenWidth/3
    , 0 ;y1
    , 0 ;x2 
    , A_ScreenHeight/4
    , KiBarPixel
    , 1
    , Fast RGB 
    if (ErrorLevel = 0){
        WHERE_IS_HE := 0
        ;MsgBox,0x40000,, % (px/A_ScreenWidth), 1
        if ((px/A_ScreenWidth) < (0.11)) {
            ;MsgBox,0x40000,, % "Ratio'd"
            ;MouseMove, px, py 
            NotEnoughKi := true
        } 
    } else {
        WHERE_IS_HE += 1
        if (WHERE_IS_HE = 4) {
            NotEnoughKi := true
            MsgBox,0x40000,, % "WHERE IS HE", 1   

        }
    }
return 

StartMastering:
    if Running{
        return 
    }
    UpdateMOVESandCDs()
    timesUsed := {}
    for Moves,Cd in MovesANDcds {
        ;MsgBox,0x40000,, % "CD: " Cd, 1
        if (MovesANDcds[Moves][2] = true) && (MovesANDcds[Moves][3] = 0){
            MsgBox,0x40030,% "Move duration REQUIRED!", % "Please enter the duration of the move `neven if you dont need to hold down the key!", 5
            return 
        }
        timesUsed[Moves] := [Cd[1], 0]
        
    }
    ;MsgBox,0x40000,, % "Validated durations", 1
    Running := true 
    NotEnoughKi := false 
    Count_check := 0
    WHERE_IS_HE := 0
    ;for k, v in timesUsed {
    ;    MsgBox,0x40000,, % k " and CD:" v[1] " time elapsed:" v[2], 1
    ;}
    Goto, MoveMastery
return 

ChargeKi:
    if !Running {
        return 
    }
    ;SetTimer, KiBarCheck, 3000
    Loop, 10 {
        Send, {x}
        Sleep, 50
    }
    Send, {x down}
    While, NotEnoughKi {
        if !Running {
            return 
        }
        Sleep, 750
        CoordMode, Pixel, Screen
        PixelSearch, px, py
        , A_ScreenWidth/3
        , 0 ;y1
        , 0 ;x2 
        , A_ScreenHeight/4
        , KiBarPixel
        , 1
        , Fast RGB 
        if (ErrorLevel = 0){
            if ((px/A_ScreenWidth) > 0.3) {
                NotEnoughKi := false 

            }
        }
    }
    Send, {x up}
    ;NotEnoughKi := false 
return 

MoveMastery:
     While, Running {   
        for MOVE, CD in MovesANDcds {
            if !Running {
                return 
            }
            if !NotEnoughKi {
                if (MovesANDcds[MOVE][2] = true) {
                
                      if ((A_TickCount - timesUsed[MOVE][2]) > (((timesUsed[MOVE][1]) * 1000 )+550)) {
                            ;Sleep, 2550
                            Send, {%MOVE% down}
                            Sleep, % MovesANDcds[MOVE][3] * 1000 
                            Send, {%MOVE% up}
                            timesUsed[MOVE][2] := A_TickCount
                      }
                      Sleep, %DelayBmove%
                      GoSub, KiBarCheck
                } 
            } else {  ; do a threshold check for ki to judge if a move is being actively used and then
                Sleep, 2500
                MsgBox,0x40000,, % "Chargin' time", 1
                MouseClick, Left
                WinActivate, Roblox
                GoSub, ChargeKi 
                Sleep, 800
            }
        }
        Sleep, 500 
     }
return 

;use A_TickCount method and check if the time elapsed by doing Now - Then is equal to a CD and then Send, move like dat

StopMastering:
    Running := false 
return 

GuiClose:
     ExitApp
return 

; write the INI files for saving the data regarding the active, and HD (hold down), also think about how I.T is going to be implemented 