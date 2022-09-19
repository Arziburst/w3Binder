#Include, ./src/services/unit.ahk
#Include, ./src/services/builderMode.ahk
#Include, ./src/services/buildings.ahk

Class Core {
    __New(units, builderMode) {
        this.units := units
        this.builderMode := builderMode
        this.lastHotkey := false
        this.numericModeOn := false
        ;                  heroOne heroTwo heroThree false armyOne armyTwo armyThree false false builders false false
        this.keyboard := [ "q",    "w",    "e",      "r",  "a",    "s",    "d",      "f",  "z",  "x",     "c",  "v"]
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
    
    unitMoveOrBuild() {
        If (builderMode.getBuilderModeState()) {
            builderMode.build(this._getThisHotKey())
        } else {
            If (builderMode.getAfterBuilderMode()) {
                builderMode.resetAfterBuilderMode()
                Send, {Esc}
            } else {
                this.unitMove()
            }
        }
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

    heroLvlUp(numericKey) {
        this.numericModeOn := true
        this._getActualUnit().heroLvlUp(numericKey)
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
}

heroOne := new Unit(heroOneData)
heroTwo := new Unit(heroTwoData)
heroThree := new Unit(heroThreeData)

armyOne := new Unit(armyOneData)
armyTwo := new Unit(armyTwoData)
armyThree := new Unit(armyThreeData)

builders := new Unit(buildersData)
builderMode := new BuilderMode(buildersData)
buildings := new Buildings(buildingsData)
;          Q        W        E          R      A        S        D          F      Z      X         C      V
units := [ heroOne, heroTwo, heroThree, false, armyOne, armyTwo, armyThree, false, false, builders, false, false ]

global core := new Core(units, builderMode)