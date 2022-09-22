; To Js

displayLastHotkey(newValue := "No bind") {
	wb := getDOM()
	Sleep, 35
	lastHotkeyNode := wb.document.getElementById("lastHotkey")
	lastHotkeyNode.innerHTML := newValue
}

; From Js
selectFraction(newFraction) {
	result := selectFractionAhk(newFraction)

	global core := result[1]
	global units := result[2]
	global builderMode := result[3]
}
