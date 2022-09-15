class Unit {
    __New(options) {
        this.bindKey := options.bindKey
        this.spells := options.spells
        this.upgradePriority := options.upgradePriority
        this.comboKey := options.comboKey
        this.items := [ "Numpad7", "Numpad8", "Numpad4", "Numpad5", "Numpad1", "Numpad2" ]
    }

    unitSelect(isUnitSelect := true) {
        If (isUnitSelect) {
            Send, % this.bindKey
            Sleep, 50
        }
    }

    centerCameraOnUnit() {
        this.unitSelect()
        this.unitSelect()
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
        Send, % this.comboKey
        Send, {Click}
    }

    heroAutoLvlUp() {
        this.unitSelect()

        For K, SpellButton in this.upgradePriority {
            Send, o
            Send, %SpellButton%
        }

        Send, {Esc}
        Sleep, 50
    }
    
    heroCustomLvlUp(spellButtonIndex) {
        spellButton := this.spells[spellButtonIndex]

        If (!spellButton) {
            return
        }

        Send, o
        Send, %spellButton%
        Send, {Esc}
        Sleep, 50
    }
    
    useItemWithManager(itemIndex) {
        itemButton := this.items[itemIndex]

        If (!itemButton) {
            return
        }

        Send, {%itemButton%}
        Sleep, 50
    }

    useSpellWithManager(spellButtonIndex) {
        spellButton := this.spells[spellButtonIndex]

        If (!spellButton) {
            return
        }

        Send, %spellButton%
        Sleep, 50
    }
}
