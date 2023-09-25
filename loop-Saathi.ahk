#noTrayIcon
#NoEnv
#MenuMaskKey vkFF

;*** credit ***
; - Explorer_GetSelection from https://www.autohotkey.com/boards/viewtopic.php?t=60403#p255169
; - StdOutToVar from https://github.com/cocobelgica/AutoHotkey-Util/blob/master/StdOutToVar.ahk
; - PdfInfo2Obj from https://www.autohotkey.com/boards/viewtopic.php?t=59871

StdOutToVar(cmd) {
	DllCall("CreatePipe", "PtrP", hReadPipe, "PtrP", hWritePipe, "Ptr", 0, "UInt", 0)
	DllCall("SetHandleInformation", "Ptr", hWritePipe, "UInt", 1, "UInt", 1)

	VarSetCapacity(PROCESS_INFORMATION, (A_PtrSize == 4 ? 16 : 24), 0)    ; http://goo.gl/dymEhJ
	cbSize := VarSetCapacity(STARTUPINFO, (A_PtrSize == 4 ? 68 : 104), 0) ; http://goo.gl/QiHqq9
	NumPut(cbSize, STARTUPINFO, 0, "UInt")                                ; cbSize
	NumPut(0x100, STARTUPINFO, (A_PtrSize == 4 ? 44 : 60), "UInt")        ; dwFlags
	NumPut(hWritePipe, STARTUPINFO, (A_PtrSize == 4 ? 60 : 88), "Ptr")    ; hStdOutput
	NumPut(hWritePipe, STARTUPINFO, (A_PtrSize == 4 ? 64 : 96), "Ptr")    ; hStdError
	
	if !DllCall(
	(Join Q C
		"CreateProcess",             ; http://goo.gl/9y0gw
		"Ptr",  0,                   ; lpApplicationName
		"Ptr",  &cmd,                ; lpCommandLine
		"Ptr",  0,                   ; lpProcessAttributes
		"Ptr",  0,                   ; lpThreadAttributes
		"UInt", true,                ; bInheritHandles
		"UInt", 0x08000000,          ; dwCreationFlags
		"Ptr",  0,                   ; lpEnvironment
		"Ptr",  0,                   ; lpCurrentDirectory
		"Ptr",  &STARTUPINFO,        ; lpStartupInfo
		"Ptr",  &PROCESS_INFORMATION ; lpProcessInformation
	)) {
		DllCall("CloseHandle", "Ptr", hWritePipe)
		DllCall("CloseHandle", "Ptr", hReadPipe)
		return ""
	}

	DllCall("CloseHandle", "Ptr", hWritePipe)
	VarSetCapacity(buffer, 4096, 0)
	while DllCall("ReadFile", "Ptr", hReadPipe, "Ptr", &buffer, "UInt", 4096, "UIntP", dwRead, "Ptr", 0)
		sOutput .= StrGet(&buffer, dwRead, "CP0")

	DllCall("CloseHandle", "Ptr", NumGet(PROCESS_INFORMATION, 0))         ; hProcess
	DllCall("CloseHandle", "Ptr", NumGet(PROCESS_INFORMATION, A_PtrSize)) ; hThread
	DllCall("CloseHandle", "Ptr", hReadPipe)
	return sOutput
}

PdfInfo2Obj(PdfPath, pdfinfopath) {										;using xpdf's pdfinfo to get metadata from pdf files

		;original post:	https://autohotkey.com/boards/viewtopic.php?t=15880&start=20
		;original by:  	kon - 16.4.2016 
		;modified by:	swagfag and taken by Ixiko V1.0 for AHK V1 (tested with Autohotkey.exe v1.1.30.00)
		;Link:            	https://autohotkey.com/boards/viewtopic.php?f=9&t=59294&hilit=pdfinfo
		;Description: 	function now returns an object (thx to swagfag for his help on RegExMatch)
		;                   	a space char in keys will be replaced from "Page size" to "Pagesize"
      	;Dependancies: function StdOutToVar - https://github.com/cocobelgica/AutoHotkey-Util/blob/master/StdOutToVar.ahk
       	;                       pdfinfo.exe from xpdf-toolkit - https://www.xpdfreader.com/download.html]download link

		q := Chr(0x22)
		Results := Object()
		static XpdfPath

		If !XpdfPath
				XpdfPath := q . pdfinfopath . "\xdf\pdfInfo.exe" . q

		CmdString := XpdfPath . " " . q . PdfPath . q
		StdOut:= StdOutToVar(CmdString)
		If Instr(StdOut, "Error") 
		                 return StdOut             ;StdOut contains a description of error
		
		while(Pos := RegExMatch(StdOut, "`aimO)^([^:]+):\s*(.*)$", M, A_Index == 1 ? 1 : Pos + StrLen(M[0])))
		{
			Results[StrReplace(M[1], " ")]:= M[2]
		}

return Results
}


Explorer_GetSelection() {
   WinGetClass, winClass, % "ahk_id" . hWnd := WinExist("A")
   if !(winClass ~="Progman|WorkerW|(Cabinet|Explore)WClass")
      Return
   
   shellWindows := ComObjCreate("Shell.Application").Windows
   if (winClass ~= "Progman|WorkerW")
      shellFolderView := shellWindows.FindWindowSW(0, 0, SWC_DESKTOP := 8, 0, SWFO_NEEDDISPATCH := 1).Document
   else {
      for window in shellWindows
         if (hWnd = window.HWND) && (shellFolderView := window.Document)
            break
   }
   for item in shellFolderView.SelectedItems
      result .= (result = "" ? "" : "`n") . item.Path
   if !result
      result := shellFolderView.Folder.Self.Path
   Return result
}

ConnectedToInternet(flag=0x40) { 
Return DllCall("Wininet.dll\InternetGetConnectedState", "Str", flag,"Int",0) 
}

sleep,500
if(fileExist("c:\Program Files (x86)\Install Saathi V1.0\Saathi\saathi.exe") == "")
{
MsgBox,, loop Saathi มีข้อผิดพลาด!, คุณจำเป็นต้องติดตั้งโปรแกรม SAATHI ก่อน
exitApp
}
If ConnectedToInternet()
sleep,1
else
{
MsgBox,, loop Saathi เกิดข้อผิดพลาด!, คุณไม่ได้เชื่อมต่ออินเทอร์เน็ตอยู่ในขณะนี้`nการทำงานของโปรแกรม SAATHI จำเป็นต้องเชื่อมต่ออินเทอร์เน็ตตลอดเวลา
exitApp
}
filePath := % Explorer_GetSelection()
SplitPath, filePath, name, dir, ext
StringLen, nameNum, filePath
StringLen, typeNum, ext
pdfPath := SubStr(filePath, 1, nameNum-typeNum) "pdf"
txtPath := SubStr(filePath, 1, nameNum-typeNum) "txt"
if(regexmatch(ext,"apng|avif|gif|jpg|jpeg|jfif|pjpeg|pjp|png|svg|webp") > 0) {
StdOut := StdOutToVar("cmd.exe /c magick -help")
if(regexmatch(StdOut, "not recognized") > 0) {
MsgBox,, loop Saathi เกิดข้อผิดพลาด!, คุณเลือกไฟล์รูปภาพ`nหากคุณต้องการถอดข้อความจากรูปภาพด้วยส่วนเสริมนี้ `nคุณจำเป็นต้องติดตั้งโปรแกรม Image Magick ก่อน`nโดยสามารถเข้าไปดาวโหลดโปรแกรม Image Magick ได้จาก https://imagemagick.org/script/download.php
exitApp
} else {
Run, %comspec% /c magick.exe "%filePath%" "%pdfPath%",,hide
loop
{
IfExist, %pdfPath%
{
break
} else if(A_Index == 50) {
MsgBox,, loop Saathi เกิดข้อผิดพลาด!, กรุณาพยายามรันส่วนเสริมใหม่อีกครั้ง
exitApp
} else {
sleep,50
}
}
Process, Exist, Saathi.exe
If ErrorLevel
Process, close, Saathi.exe
EnvGet, ProgFiles32, ProgramFiles(x86)
Run, %ProgFiles32% \Install Saathi V1.0\Saathi\Saathi.exe
WinWaitActive, Saathi
sendInput,{alt down}o{alt up}
winWaitActive, Open
sendInput,%pdfPath%
sleep,250
sendInput,{enter}
winWaitActive, Saathi
sleep,100
sendInput,{tab 2}
Process, waitClose, Saathi.exe
sleep,50
FileDelete, %pdfPath%
exitApp
}
} else if(regexmatch(ext,"pdf|PDF|Pdf") > 0) {
PdfInfo:= Object()
PdfInfo:= PdfInfo2Obj(filePath, A_ScriptDir)
allPages := % PdfInfo.Pages
pauseNum := 3000
Process, Exist, Saathi.exe
If ErrorLevel
Process, close, Saathi.exe
EnvGet, ProgFiles32, ProgramFiles(x86)
Run, %ProgFiles32% \Install Saathi V1.0\Saathi\Saathi.exe
WinWaitActive, Saathi
sendInput,{alt down}o{alt up}
winWait, Open
sendInput,%filePath%
sleep,250
sendInput,{enter}
winWaitActive, Saathi
sleep,100
if(allPages < 2) {
sendInput, {tab 2}
exitApp
} else {
If allPages is number
sleep,50
else
allPages:= ""
sleep,50
Gui, add, text,, กรอกจำนวนหน้าที่ต้องการ
Gui, add, edit, vpageNum Number Limit,%allPages%
IfExist, %txtPath% 
{
MyCheckbox1 := 0
MyCheckbox2 := 0
MyCheckbox3 := 0
} else {
Gui, Add, Checkbox, vMyCheckbox1, export ไฟล์อัตโนมัติหลังจากส่วนเสริมทำงานสำเร็จ
Gui, Add, Checkbox, vMyCheckbox2, ลบข้อความระบุเลขหน้าที่สร้างจากโปรแกรม SAATHI รวมถึงข้อความ No text detected หากโปรแกรมไม่พบข้อความในหน้านั้นๆ
Gui, Add, Checkbox, vMyCheckbox3, เปิดไฟล์ text ที่ export แล้วทันทีหลังจากส่วนเสริมทำงานสำเร็จ
}
Gui, Add, Button, default, Run
Gui, Show,, loop Saathi
return
GuiClose:
GuiEscape:
Gui, Destroy
exitApp
return

ButtonOK:
Gui, Destroy
exitApp
return

ButtonRun:
Gui, Submit
if pageNum is number
sleep,50
else
{
MsgBox,, loop Saathi เกิดข้อผิดพลาด!, คุณจำเป็นต้องระบุจำนวนหน้าที่ต้องการ
Process, close, Saathi.exe
exitApp
}
Gui, Destroy
waitTime := ceil((pageNum*pauseNum)/60000)
if(waitTime<1)
{
waitTime := "less a"
} else {
waitTime := ceil((pageNum*pauseNum)/60000)
}
Gui, Add, Text,, กรุณารอประมาณ %waitTime% นาที
Gui, Show,, loop Saathi
sleep,pauseNum
Gui, Destroy
loop,%pageNum%
{
if(A_Index == pageNum) {
sleep,pauseNum
break
}
ControlSend,, {alt down}n{alt up},Saathi
loop
{
ControlGetText, ct1, WindowsForms10.EDIT.app.0.141b42a_r8_ad11, Saathi
ControlGetText, ct2, WindowsForms10.EDIT.app.0.141b42a_r8_ad13, Saathi
ct3 := ct2 ct1
sleep,pauseNum
ControlGetText, ct5, WindowsForms10.EDIT.app.0.141b42a_r8_ad13, Saathi
ct6 := ct5 ct4
if(ct3 != ct6)
break
}
Process, Exist, Saathi.exe
If ErrorLevel
sleep,100
else
{
MsgBox,, loop Saathi เกิดข้อผิดพลาด!, % "เกิดข้อผิดพลาดที่หน้า " A_Index+1 " กรุณาพยายามรันส่วนเสริมใหม่อีกครั้ง"
exitApp
}
}
if(MyCheckbox1 == 1) {
ControlSend,, {alt down}e{alt up}, Saathi
winWaitActive, Save As
WinMinimize
ControlSend,, {enter}, Save As
winWait, Export Complete
ControlSend,, {space}, Export Complete
loop
{
IfExist, %txtPath%
{
break
} else if(A_Index == 50) {
MsgBox,, loop Saathi เกิดข้อผิดพลาด!, กรุณาพยายามรันส่วนเสริมใหม่อีกครั้ง
exitApp
} else {
sleep,50
}
}
FileEncoding, UTF-8
FileRead,ct1,%txtPath%
if(allPages == pageNum) {
loop,%pageNum%
{
if(inStr(ct1, "--- Page " A_Index " ---") > 0) {
sleep,1	
} else {
MsgBox,, loop Saathi เกิดข้อผิดพลาด!, % "ไฟล์ text ที่ท่าน export เกิดข้อผิดพลาดที่หน้า " A_Index 
exitApp
}
}
Process, close, Saathi.exe
}
if(MyCheckbox2 == 1) {
newContent := regExReplace(ct1,"--- Page \d+ ---|No text detected","")
file := FileOpen(txtPath, "w") 
file.write(newContent)
file.close()
}
Gui, Add, Text,, '
Gui, Show,, export เสร็จสมบูรณ์
sleep,pauseNum
Gui, Destroy
sleep,1000
if(MyCheckbox3 == 1) {
run, notepad.exe %txtPath%
}
exitApp
} else if(MyCheckbox1 == 0) {
Gui, Add, Text,, '
Gui, Show,, ส่วนเสริมทำงานครบตามจำนวนหน้าที่ระบุแล้ว
sleep,pauseNum
Gui, Destroy
}
exitApp
}
} else {
MsgBox,, loop Saathi, ไฟล์ที่ท่านเลือกไม่รองรับในการทำงานร่วมกับส่วนเสริมนี้
exitApp
}
