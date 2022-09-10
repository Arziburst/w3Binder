class Unit {
    __New(options) {
        this.bindKey := options.bindKey
        this.spells := options.spells
        this.upgradePriority := options.upgradePriority
        this.comboKey := options.comboKey
    }

    unitSelect() {
        Send, % this.bindKey
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

    unitMove() {
        this.unitSelect()
        Send, {Click, Right}
        Sleep, 50
    }

    unitAttack() {
        this.unitSelect()
        Sleep, 50
        Send, a
        Send, {Click}
    }

    unitHold() {
        this.unitSelect()
        Sleep, 50
        Send, h
    }

    useComboSpell() {
        this.unitSelect()
        Sleep, 50
        Send, % this.comboKey
        Send, {Click}
    }

    useItem() {
        this.unitSelect()
        Sleep, 50
        Send, {Numpad7}
    }

    heroAutoLvlUp() {
        this.unitSelect()
        Sleep, 50

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
    
    useSpellWithManager(spellButtonIndex) {
        spellButton := this.spells[spellButtonIndex]
        If (!spellButton) {
            return
        }

        Send, %spellButton%
        Sleep, 50
    }
}
