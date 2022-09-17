Class UnitMiddleware {
    __New(units) {
        this.units := units
        this.lastHotkey := false
        this.keyboard := [ "q", "w", "e", "a", "s", "d", "x" ]
        this.spellItemMode := false
    }

    _findIndex() {
        unitIndex := 0

        For index, arrayKeyboardButton in this.keyboard {
            If (this.lastHotkey = arrayKeyboardButton) {
                unitIndex := index
            }
        }

        return unitIndex
    }

    _getActualUnit() {
        return this.units[this._findIndex(this.lastHotkey)]
    }

    _getThisHotKey() {
        thisHotkey := StrReplace(A_ThisHotkey, "$", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "+", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "^", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "!", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "~", "") ; refactor to any hotkey

        return thisHotkey
    }

    _recordHotkey() {
        this.spellItemMode := false
        thisHotkey := this._getThisHotKey()
        result := thisHotkey == this.lastHotkey ? false : thisHotkey

        If (result) {
            this.lastHotkey := result
        }

        return result
    }

    unitMove() {
        isUnitSelect := this._recordHotkey()
        this._getActualUnit().unitMove(isUnitSelect)
    }

    unitAttack() {
        isUnitSelect := this._recordHotkey()
        this._getActualUnit().unitAttack(isUnitSelect)
    }

    unitHold() {
        isUnitSelect := this._recordHotkey()
        this._getActualUnit().unitHold(isUnitSelect)
    }

    useSpell(numericKey) {
        this.spellItemMode := true
        this._getActualUnit().useSpell(numericKey)
    }

    useItem(numericKey) {
        this.spellItemMode := true
        this._getActualUnit().useItem(numericKey)
    }

    heroLvlUp(numericKey) {
        this._getActualUnit().heroLvlUp(numericKey)
    }

    centerCameraOnUnit() {
        this._getActualUnit().centerCameraOnUnit()
    }

    resetHotkeyState() {
        If (this.spellItemMode) {
            this.spellItemMode := false
        } Else {
            this.lastHotkey := false
        }
    }
}