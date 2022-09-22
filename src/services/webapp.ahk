getFileFullPath(f) {
	Loop, Files, %f%
	{
		if (A_LoopFileLongPath)
			return A_LoopFileLongPath    
	}
}

__Webapp_Name := "w3Binder"
__Webapp_Width := 640
__Webapp_height := 480
__Webapp_protocol := "app"
__Webapp_protocol_call := "app_call"
__Webapp_NavComplete_call := "app_page"
__Webapp_html_url := getFileFullPath("src/view/index.html")

Gui __Webapp_Name:New
Gui __Webapp_Name:Margin, 0, 0
Gui __Webapp_Name:+Resize
Gui __Webapp_Name:Add, ActiveX, v__Webapp_wb w%__Webapp_Width% h%__Webapp_height%, Shell.Explorer

__Webapp_wb.silent := true
__Webapp_wb.Navigate("file://" . __Webapp_html_url)

ComObjConnect(__Webapp_wb, __Webapp_wb_events)

__Webapp_w := __Webapp_wb.Document.parentWindow
__Webapp_wf := Func("JS_AHK")
__Webapp_w.AHK := __Webapp_wf

while __Webapp_wb.readystate != 4 or __Webapp_wb.busy
	sleep 10

Gui __Webapp_Name:Default
GroupAdd, __Webapp_windows, ahk_id %__Webapp_GuiHwnd%

class __Webapp_wb_events {
	DownloadComplete(wb, NewURL) {
		wb.Stop()
	}

	DocumentComplete(wb, NewURL) {
		global __Webapp_NavComplete_call
		__Webapp_NavComplete_call.call(NewURL)
		wb.Stop()
	}

	NavigateError(wb, NewURL) {
		wb.Stop()
	}
	
	BeforeNavigate2(wb, NewURL) {
		wb.Stop()
		
		global __Webapp_protocol
		global __Webapp_protocol_call
		
		if (__Webapp_protocol == "*") 
			__Webapp_protocol_call.call(NewURL)
		else {
			if (InStr(NewURL,__Webapp_protocol "://")==1) {
				what := SubStr(NewURL,Strlen(__Webapp_protocol)+4)
				__Webapp_protocol_call.call(what)
			}
		}
	}
}

JS_AHK(func, prms*) {
	wb := getDOM()
	wb.Stop()
	return %func%(prms*)
}

getWindow() {
	wb := getDOM()
	return wb.document.parentWindow
}

getDOM(){
	global __Webapp_wb
	return __Webapp_wb
}

global isMainGuiExist := false

closeMainGui() {
	Gui, __Webapp_Name:Hide
	isMainGuiExist := false
}

toggleMainGui() {
    If (isMainGuiExist) {
		closeMainGui()
    } else {
        isMainGuiExist := true
		Gui __Webapp_Name:Show
    }
}
