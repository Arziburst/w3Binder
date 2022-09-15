class BuilderMode {
    builderMode := false

    __New(options) {
        this.bindKey := options.bindKey
        this.buildings := options.buildings
        this.keyboard := [ "q", "w", "e", "r", "a", "s", "d", "f", "z", "x", "c", "v"]
    }

    builderModeState() {
        return this.builderMode
    }

    startBuilding() {
        Send, % this.bindKey
        Sleep, 50

        If (this.builderMode) {
            Send, {Esc}
            this.builderMode := false
        } else {
            Send, b
            this.builderMode := true
        }
    }

    endBuilding() {
        this.builderMode := false
    }

    build() {
        thisHotkey := StrReplace(A_ThisHotkey, "$", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "+", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "^", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "!", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "~", "") ; refactor to any hotkey

        For index, kButton in this.keyboard {
            If (kButton = thisHotkey) {
                Send, % this.buildings[index]
            }
        }

        this.endBuilding()
    }
}
