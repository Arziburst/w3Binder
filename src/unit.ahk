class Unit {
    __New(options) {
        this.bindKey := options.bindKey
        this.MS := options.MS
        this.SS := options.SS
        this.TS := options.TS
        this.ULT := options.ULT
        this.upgradePriority := []
        this.upgradePriority.Push(this.ULT)
        this.upgradePriority.Push(this.MS)
        this.upgradePriority.Push(this.SS)
        this.upgradePriority.Push(this.TS)
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
        this.unitSelect()
        Sleep, 50
        Send, %spellButton%
        Send, {Click}
    }

    useMainSpell() {
        If (this.MS) {
            this.useSpell(this.MS)
        }
    }

    useSecondarySpell() {
        If (this.SS) {
            this.useSpell(this.SS)
        }
    }

    useThirdSpell() {
        If (this.TS) {
            this.useSpell(this.TS)
        }
    }

    useUltimate() {
        If (this.ULT) {
            this.useSpell(this.ULT)
        }
    }

    ;----------------------------------------Hero

    useItem() {
        this.unitSelect()
        Send, {Numpad7}
    }

    heroLvlUp() {
        this.unitSelect()
        Sleep, 50

        For K, SpellButton in this.upgradePriority {
            Send, o
            Send, %SpellButton%
        }

        Send, {Esc}
    }
}