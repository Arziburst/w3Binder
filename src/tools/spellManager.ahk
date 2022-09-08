Class SpellManager {
    __New(units) {
        this.lastPresed := false
        this.units := units
    }

    recordKey() {
        this.lastPresed := StrReplace(A_ThisHotkey, "$", "")
    }

    useSpell(spellButtonIndex) {
        Switch this.lastPresed {
            Case "q":
                this.units[1].useSpellWithManager(spellButtonIndex)

            Case "w":
                this.units[2].useSpellWithManager(spellButtonIndex)

            Case "e":
                this.units[3].useSpellWithManager(spellButtonIndex)

            Case "a":
                this.units[4].useSpellWithManager(spellButtonIndex)

            Case "s":
                this.units[5].useSpellWithManager(spellButtonIndex)

            Case "d":
                this.units[6].useSpellWithManager(spellButtonIndex)

            Default:
                return
        }
    }

    spellUp(spellButtonIndex) {
        Switch this.lastPresed {
            Case "q":
                this.units[1].heroCustomLvlUp(spellButtonIndex)

            Case "w":
                this.units[2].heroCustomLvlUp(spellButtonIndex)

            Case "e":
                this.units[3].heroCustomLvlUp(spellButtonIndex)

            Default:
                return
        }
    }
}
