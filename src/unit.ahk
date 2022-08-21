class Unit {
    __New(options) {
        this.bindKey := options.bindKey
        this.mainSpell := options.mainSpell
        this.secondarySpell := options.secondarySpell
        this.spellsUpgradePriority := options.spellsUpgradePriority
    }

    ;----------------------------------------Unit

    unitSelect() {
        Send, % this.bindKey
    }

    bindOneOrMany() {
        binder := % this.bindKey
        Send, ^{Click, Left}
        Send, ^%binder%
    }

    bindOneToMany() {
        binder := % this.bindKey
        this.unitSelect()
        Send, +{Click, Left}
        Send, ^%binder%
    }

    bindManyToMany() {
        binder := % this.bindKey
        this.unitSelect()
        Send, ^+{Click, Left}
        Send, ^%binder%
    }

    unitMove(isAttack := "") {
        this.unitSelect()

        If (isAttack) {
            Send, a
            Send, {Click}
        } Else {
            Send, {Click, Right}
        }
    }

    useSpell(spellButton) {
        If (spellButton = "") {
            return
        }

        this.unitSelect()
        Sleep, 50
        Send, %spellButton%
        Send, {Click}
    }

    useMainSpell() {
        this.useSpell(this.mainSpell)
    }

    useSecondarySpell() {
        this.useSpell(this.secondarySpell)
    }

    ;----------------------------------------Hero

    useItem() {
        this.unitSelect()
        Send, {Numpad7}
    }

    heroLvlUp() {
        If (this.spellsUpgradePriority = "") {
            return
        }

        this.unitSelect()
        Sleep, 50

        For K, SpellButton in this.spellsUpgradePriority {
            Send, o
            Send, %SpellButton%
        }

        Send, {Esc}
    }

    ;----------------------------------------Buildings
}