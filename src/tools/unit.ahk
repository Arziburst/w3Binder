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

    unitMove() {
        this.unitSelect()
        Send, {Click, Right}
        Sleep, 50
    }

    unitAttack() {
        this.unitSelect()
        Send, a
        Send, {Click}
        Sleep, 50
    }

    unitHold() {
        this.unitSelect()
        Send, h
        Sleep, 50
    }

    _useSpell(spellButton) {
        this.unitSelect()
        Send, %spellButton%
        Send, {Click}
        Sleep, 50
    }

    useMainSpell() {
        If (this.MS) {
            this._useSpell(this.MS)
        }
    }

    useSecondarySpell() {
        If (this.SS) {
            this._useSpell(this.SS)
        }
    }

    useThirdSpell() {
        If (this.TS) {
            this._useSpell(this.TS)
        }
    }

    useUltimate() {
        If (this.ULT) {
            this._useSpell(this.ULT)
        }
    }

    ;----------------------------------------Hero

    useItem() {
        this.unitSelect()
        Send, {Numpad7}
    }

    heroLvlUp() {
        this.unitSelect()

        For K, SpellButton in this.upgradePriority {
            Send, o
            Send, %SpellButton%
        }

        Send, {Esc}
        Sleep, 50
    }
}
