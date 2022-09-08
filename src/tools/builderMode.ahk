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
        keyboardButton := StrReplace(A_ThisHotkey, "$", "")

        For index, kButton in this.keyboard {
            If (kButton = keyboardButton) {
                Send, % this.buildings[index]
            }
        }

        this.endBuilding()
    }
}
