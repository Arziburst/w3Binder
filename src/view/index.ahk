app_call(args) {
	MsgBox %args%
	if InStr(args,"msgbox/hello") {
		MsgBox Hello world!
	}
}

app_page(NewURL) {
	wb := getDOM()
}

displayLastHotkey(newValue := "No bind") {
	wb := getDOM()
	Sleep, 35
	lastHotkeyNode := wb.document.getElementById("lastHotkey")
	lastHotkeyNode.innerHTML := newValue
}

; Functions to be called from the html/js source

Hello() {
	MsgBox Hello from JS_AHK :)
}

RunMyJSFunction() {
	window := getWindow()
	window.my_js_and_ahk_function(3, 3)
}
; RunMyJSFunction()5h

ahkToJs(a,b) {
	return a * b
}
