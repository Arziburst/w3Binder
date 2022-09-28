; To Js

displayLastHotkey(newValue := "No bind") {
	wb := getDOM()
	Sleep, 35
	lastHotkeyNode := wb.document.getElementById("lastHotkey")
	lastHotkeyNode.innerHTML := newValue
}

; From Js
setConfigFromJS(reduxConfig := false) {
	; javascript write redux to json and pass to ahk
	; ahk write json to file system as w3binder.config.json
	; ahk reed config file and set new bids

	If (reduxConfig) {
		setConfig(reduxConfig)
	}
}
