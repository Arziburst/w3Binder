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
        Send, {Esc}

        If (A_TimeSincePriorHotkey > 350) {
            Send, % this.bindKey
        }

        If (this.builderMode) {
            this.builderMode := false
        } else {
            this.builderMode := true
            Send, b
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
