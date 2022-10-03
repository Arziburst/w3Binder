global delay := 35

class Unit {
    __New(options, isAutoMove) {
        this.bindKey := options.bindKey
        this.spells := options.spells
        this.isAutoMove := isAutoMove
        this.items := [ "Numpad7", "Numpad8", "Numpad4", "Numpad5", "Numpad1", "Numpad2" ]
    }

    bindOneOrMany() {
        binder := % this.bindKey
        Send, ^{Click, Left}
        Send, ^%binder%
    }

    bindManyToMany(isUnitSelect := true) {
        If (isUnitSelect) {
            this.unitSelect()
        }
        binder := % this.bindKey
        Send, ^+{Click, Left}
        Send, ^%binder%
    }

    unitSelect(isUnitSelect := true) {
        If (isUnitSelect) {
            Send, % this.bindKey
            Sleep, %delay%
        }
    }

    unitMove(isUnitSelect := true) {
        this.unitSelect(isUnitSelect)

        If (this.isAutoMove == "true") {
            Send, {Click, Right}
        }
    }

    unitAttack(isUnitSelect := true) {
        this.unitSelect(isUnitSelect)

        Send, a

        If (this.isAutoMove == "true") {
            Send, {Click, Left}
        }
    }

    unitHold(isUnitSelect := true) {
        this.unitSelect(isUnitSelect)
        Send, h
    }

    skillLvlUp(numericKey) {
        spellObject := this.spells[numericKey]

        If (!spellObject) {
            return
        }

        Send, o
        Send, % spellObject.key
        Send, {Esc}
        Sleep, %delay%
    }
    
    useItem(numericKey) {
        itemButton := this.items[numericKey]

        If (!itemButton) {
            return
        }

        Send, {%itemButton%}
        Sleep, %delay%
    }

    useSpell(numericKey) {
        spellObject := this.spells[numericKey]

        If (!spellObject) {
            return
        }

        Send, % spellObject.key
        Sleep, %delay%
    }

    centerCameraOnUnit() {
        this.unitSelect()
        this.unitSelect()
    }
}
