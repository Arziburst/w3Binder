; Constants
global QuiClickBox := "12"

global isMainGuiExist := false

toggleMainGui() {
    If (isMainGuiExist) {
        Gui, Main:Hide
        isMainGuiExist := false
    } else {
        Gui, Main:Show
        isMainGuiExist := true
    }
}

Class SpellManager {
    __New(units) {
        this.lastPresed := "b"
        this.units := units
        Gui, Main:+AlwaysOnTop
        ; Gui, Main:Add, Text, w156 h156,vQuiClickBox, %this.lastPresed
    }

    recordKey() {
        this.lastPresed := StrReplace(A_ThisHotkey, "$", "")
        newLastPresed := this.lastPresed
        GuiControl, Main:Text,vQuiClickBox, %newLastPresed%
        return
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
