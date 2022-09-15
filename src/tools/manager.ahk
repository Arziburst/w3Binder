Class Manager {
    __New(units) {
        this.units := units
        this.lastRecordedHotkey := false
        this.keyboard := [ "q", "w", "e", "a", "s", "d", "x" ]
    }

    _findIndex() {
        unitIndex := 0

        For index, arrayKeyboardButton in this.keyboard {
            If (this.lastRecordedHotkey = arrayKeyboardButton) {
                unitIndex := index
            }
        }

        return unitIndex
    }

    _getThisHotKey() {
        thisHotkey := StrReplace(A_ThisHotkey, "$", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "+", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "^", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "!", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "~", "") ; refactor to any hotkey

        return thisHotkey
    }

    recordHotkey() {
        alphabetValue := this._getThisHotKey()
        result := alphabetValue == this.lastRecordedHotkey ? false : alphabetValue

        If (result) {
            this.lastRecordedHotkey := result
        }

        return result ; if already recorded == false, if new record == new value
    }

    useManager(case) {
        unit := this.units[this._findIndex(this.lastRecordedHotkey)]
        numericIndex := this._getThisHotKey()

        Switch case {
            Case "useSpell":
                unit.useSpellWithManager(numericIndex)

            Case "spellLvlUp":
                unit.heroCustomLvlUp(numericIndex)

            Case "useItem":
                unit.useItemWithManager(numericIndex)

            Case "centerCameraOnLastUnit":
                unit.centerCameraOnUnit()

            Default: return  
        }
    }

    resetHotkeyState() {
        this.lastRecordedHotkey := false
    }
}
