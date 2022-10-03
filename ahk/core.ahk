Class Core {
    __New(units, builderMode) {
        this.units := units
        this.builderMode := builderMode
        this.lastHotkey := false
        this.numericModeOn := false
        this.mainKeys := [ "q", "w", "e", "r", "a", "s", "d", "f", "z", "x", "c", "v", "b"]
    }

    _findIndex(newHotkey:=false) {
        unitIndex := 0
        thisHotkey := newHotkey ? newHotkey : this.lastHotkey

        For index, arrayKeyboardButton in this.mainKeys {
            If (thisHotkey = arrayKeyboardButton) {
                unitIndex := index
            }
        }

        return unitIndex
    }

    _getActualUnit(newHotkey:=false) {
        thisHotkey := newHotkey ? newHotkey : this.lastHotkey

        return this.units[this._findIndex(thisHotkey)]
    }

    _getThisHotKey() {
        thisHotkey := StrReplace(A_ThisHotkey, "$", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "+", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "^", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "!", "") ; refactor to any hotkey
        thisHotkey := StrReplace(thisHotkey, "~", "") ; refactor to any hotkey

        return thisHotkey
    }

    _recordHotkey(newHotkey:=false) {
        thisHotkey := newHotkey ? newHotkey : this._getThisHotKey()

        isHotKeyChanged := thisHotkey != this.lastHotkey

        If (isHotKeyChanged) {
            this.lastHotkey := thisHotkey
        }

        isUnitSelect := this.numericModeOn ? thisHotkey : isHotKeyChanged

        this.numericModeOn := false

        return isUnitSelect
    }

    bindOneOrMany() {
        this._recordHotkey()
        this._getActualUnit().bindOneOrMany()
    }

    bindManyToMany() {
        isUnitSelect := this._recordHotkey()
        this._getActualUnit().bindManyToMany(isUnitSelect)
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
        this.numericModeOn := true
        this._getActualUnit().useSpell(numericKey)
    }

    useItem(numericKey) {
        this.numericModeOn := true
        this._getActualUnit().useItem(numericKey)
    }

    skillLvlUp(numericKey) {
        this.numericModeOn := true
        this._getActualUnit().skillLvlUp(numericKey)
    }

    centerCameraOnUnit() {
        this._getActualUnit().centerCameraOnUnit()

        If (this.lastHotkey == "x" and builderMode.getBuilderModeState()) {
            Send, b
        }
    }

    resetHotkeyState() {
        If (!this.numericModeOn and !builderMode.getAfterBuilderMode()) {
            this.lastHotkey := false
        }
    }

    coreBuild() {
        If (builderMode.getBuilderModeState()) {
            builderMode.build(this._getThisHotKey())

            return false
        }

        If (builderMode.getAfterBuilderMode()) {
            builderMode.resetAfterBuilderMode()
            Send, {Esc}

            return false
        }
        
        return true
    }

    unitMoveOrBuild() {
        isBuildEnd := this.coreBuild()

        If (isBuildEnd) {
            this.unitMove()
        }
    }
    
    teamMoveOrBuild() {
        this._recordHotkey()
        isBuildEnd := this.coreBuild()

        If (!isBuildEnd) {
            return
        }
        
        
        If (this.lastHotkey == "r") {
            this._getActualUnit("q").unitMove()
            this._getActualUnit("w").unitMove()
            this._getActualUnit("e").unitMove()
        }

        If (this.lastHotkey == "f") {
            this._getActualUnit("a").unitMove()
            this._getActualUnit("s").unitMove()
            this._getActualUnit("d").unitMove()
        }

        If (this.lastHotkey == "v") {
            this._getActualUnit("z").unitMove()
            this._getActualUnit("x").unitMove()
            this._getActualUnit("c").unitMove()
        }
    }

    teamAttack() {
        this._recordHotkey()

        If (this.lastHotkey == "r") {
            this._getActualUnit("q").unitAttack()
            this._getActualUnit("w").unitAttack()
            this._getActualUnit("e").unitAttack()
        }

        If (this.lastHotkey == "f") {
            this._getActualUnit("a").unitAttack()
            this._getActualUnit("s").unitAttack()
            this._getActualUnit("d").unitAttack()
        }

        If (this.lastHotkey == "v") {
            this._getActualUnit("z").unitAttack()
            this._getActualUnit("x").unitAttack()
            this._getActualUnit("c").unitAttack()
        }
    }
    
    teamHold() {
        this._recordHotkey()

        If (this.lastHotkey == "r") {
            this._getActualUnit("q").unitHold()
            this._getActualUnit("w").unitHold()
            this._getActualUnit("e").unitHold()
        }

        If (this.lastHotkey == "f") {
            this._getActualUnit("a").unitHold()
            this._getActualUnit("s").unitHold()
            this._getActualUnit("d").unitHold()
        }

        If (this.lastHotkey == "v") {
            this._getActualUnit("z").unitHold()
            this._getActualUnit("x").unitHold()
            this._getActualUnit("c").unitHold()
        }
    }
}