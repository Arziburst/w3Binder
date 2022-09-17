global delay := 50

class Unit {
    __New(options) {
        this.bindKey := options.bindKey
        this.spells := options.spells
        this.upgradePriority := options.upgradePriority
        this.combo := options.combo
        this.items := [ "Numpad7", "Numpad8", "Numpad4", "Numpad5", "Numpad1", "Numpad2" ]
    }

    bindOneOrMany() {
        binder := % this.bindKey
        Send, ^{Click, Left}
        Send, ^%binder%
    }

    bindManyToMany() {
        binder := % this.bindKey
        this.unitSelect()
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
        Send, {Click, Right}
    }

    unitAttack(isUnitSelect := true) {
        this.unitSelect(isUnitSelect)
        Send, a
        Send, {Click}
    }

    unitHold(isUnitSelect := true) {
        this.unitSelect(isUnitSelect)
        Send, h
    }

    useComboSpell() {
        this.unitSelect()
        Send, % this.combo.key

        if (this.combo.isClick) {
            Send, {Click}
        }
    }

    heroAutoLvlUp() {
        this.unitSelect()

        For K, SpellButton in this.upgradePriority {
            Send, o
            Send, %SpellButton%
        }

        Send, {Esc}
        Sleep, %delay%
    }
    
    heroLvlUp(numericKey) {
        spellButton := this.spells[numericKey]

        If (!spellButton) {
            return
        }

        Send, o
        Send, %spellButton%
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
        spellButton := this.spells[numericKey]

        If (!spellButton) {
            return
        }

        Send, %spellButton%
        Sleep, %delay%
    }

    centerCameraOnUnit() {
        this.unitSelect()
        this.unitSelect()
    }
}
