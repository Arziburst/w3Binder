class BuilderMode {
    __New(options) {
        this.builderMode := false
        this.afterBuilderMode := false
        this.bindKey := options.bindKey
        this.buildings := options.buildings
        this.keyboard := [ "q", "w", "e", "r", "a", "s", "d", "f", "z", "x", "c", "v"]
    }

    resetAfterBuilderMode() {
        this.afterBuilderMode := false
    }

    getAfterBuilderMode() {
        return this.afterBuilderMode
    }

    getBuilderModeState() {
        return this.builderMode
    }

    unitSelect(isUnitSelect := true) {
        If (isUnitSelect) {
            Send, % this.bindKey
            Sleep, 50
        }
    }

    startBuilding() {
        this.builderMode := true
    }

    endBuilding() {
        this.builderMode := false
        this.afterBuilderMode := false
    }

    toggleBuildingMode(isUnitSelect := true) {
        this.unitSelect(isUnitSelect)

        If (this.afterBuilderMode and !this.builderMode) {
            this.startBuilding()
            this.resetAfterBuilderMode()
            Send, {Esc}
            Send, b
            return
        }
        
        If (this.builderMode) {
            this.endBuilding()
            Send, {Esc}
        } Else {
            this.startBuilding()
            Send, b
        }
    }

    _getThisHotKey() {
        thisHotkey := StrReplace(A_ThisHotkey, "$", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "+", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "^", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "!", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "~", "") ; refactor to any hotkey

        return thisHotkey
    }

    build(thisHotkey := false) {
        thisHotkey := thisHotkey ? thisHotkey : this._getThisHotKey()

        For index, key in this.keyboard {
            If (key = thisHotkey) {
                Send, % this.buildings[index]
            }
        }

        this.builderMode := false
        this.afterBuilderMode := true
    }
}
