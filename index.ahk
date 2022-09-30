#Include, ./scripts/webapp/index.ahk
#Include, ./ahk/tools/index.ahk
#Include, ./ahk/services/unit.ahk
#Include, ./ahk/services/builderMode.ahk
#Include, ./ahk/core.ahk
#Include, ./ahk/ahkJs.ahk

setConfig()
setConfigToJs()

;----------------------------------------NUMERIC MANAGER
#IfWinNotActive, index.ahk
    $1:: core.useSpell(1) return ; 1
    $2:: core.useSpell(2) return ; 2
    $3:: core.useSpell(3) return ; 3
    $4:: core.useSpell(4) return ; 4

    $+1:: core.skillLvlUp(1) return ; SHIFT + 1
    $+2:: core.skillLvlUp(2) return ; SHIFT + 2
    $+3:: core.skillLvlUp(3) return ; SHIFT + 3
    $+4:: core.skillLvlUp(4) return ; SHIFT + 4

    $!1:: core.useItem(1) return ; ALT + 1
    $!2:: core.useItem(2) return ; ALT + 2
    $!3:: core.useItem(3) return ; ALT + 3
    $!4:: core.useItem(4) return ; ALT + 4
    $!5:: core.useItem(5) return ; ALT + 5
    $!6:: core.useItem(6) return ; ALT + 6

    $q:: core.unitMoveOrBuild() return ; Q
    $+q:: core.unitAttack() return ; SHIFT + Q
    $^q:: core.unitHold() return ; CTRL + Q
    $!q:: core.bindOneOrMany() return ; ALT + Q
    $^!q:: core.bindManyToMany() return ; CTRL + ALT + Q

    $w:: core.unitMoveOrBuild() return ; W
    $+w:: core.unitAttack() return ; SHIFT + W
    $^w:: core.unitHold() return ; CTRL + W
    $!w:: core.bindOneOrMany() return ; ALT + W
    $^!w:: core.bindManyToMany() return ; CTRL + ALT + W

    $e:: core.unitMoveOrBuild() return ; E
    $+e:: core.unitAttack() return ; SHIFT + E
    $^e:: core.unitHold() return ; CTRL + E
    $!e:: core.bindOneOrMany() return ; ALT + E
    $^!e:: core.bindManyToMany() return ; CTRL + ALT + E

    $r:: ; R
        ; If (!builderMode.getBuilderModeState()) {
        ;     units[1].unitMove()
        ;     units[2].unitMove()
        ;     units[3].unitMove()
        ; }
        core.unitMoveOrBuild()
    return

    ; $+r:: ; SHIFT + R
    ;     core.resetHotkeyState()

    ;     units[1].unitAttack()
    ;     units[2].unitAttack()
    ;     units[3].unitAttack()
    ; return

    ; $^r:: ; CTRL + R
    ;     core.resetHotkeyState()

    ;     units[1].unitHold()
    ;     units[2].unitHold()
    ;     units[3].unitHold()
    ; return

    ; $t:: ; T
    ;     core.resetHotkeyState()

    ;     units[1].useComboSpell()
    ;     units[2].useComboSpell()
    ;     units[3].useComboSpell()
    ; return

    ; $+t:: ; SHIFT + T
    ;     core.resetHotkeyState()

    ;     units[1].heroAutoLvlUp()
    ;     units[2].heroAutoLvlUp()
    ;     units[3].heroAutoLvlUp()
    ; return

    $a:: core.unitMoveOrBuild() return ; A
    $+a:: core.unitAttack() return ; SHIFT + A
    $^a:: core.unitHold() return ; CTRL + A
    $!a:: core.bindOneOrMany() return ; ALT + A
    $^!a:: core.bindManyToMany() return ; CTRL + ALT + A

    $s:: core.unitMoveOrBuild() return ; S
    $+s:: core.unitAttack() return ; SHIFT + S
    $^s:: core.unitHold() return ; CTRL + S
    $!s:: core.bindOneOrMany() return ; ALT + S
    $^!s:: core.bindManyToMany() return ; CTRL + ALT + S

    $d:: core.unitMoveOrBuild() return ; D
    $+d:: core.unitAttack() return ; SHIFT + D
    $^d:: core.unitHold() return ; CTRL + D
    $!d:: core.bindOneOrMany() return ; ALT + D
    $^!d:: core.bindManyToMany() return ; CTRL + ALT + D

    $f:: ; F
        core.unitMoveOrBuild()

        ; If (!builderMode.getBuilderModeState()) {
        ;     units[5].unitMove()
        ;     units[6].unitMove()
        ;     units[7].unitMove()
        ; }
    return

    ; $+f:: ; SHIFT + F
    ;     core.resetHotkeyState()

    ;     units[5].unitAttack()
    ;     units[6].unitAttack()
    ;     units[7].unitAttack()
    ; return

    ; $^f:: ; CTRL + F
    ;     core.resetHotkeyState()

    ;     units[5].unitHold()
    ;     units[6].unitHold()
    ;     units[7].unitHold()
    ; return

    $z:: core.unitMoveOrBuild() return ; Z
    $+z:: core.unitAttack() return ; SHIFT + Z
    $^z:: core.unitHold() return ; CTRL + Z
    $!z:: core.bindOneOrMany() return ; ALT + Z
    $^!z:: core.bindManyToMany() return ; CTRL + ALT + Z

    $x:: core.unitMoveOrBuild() return ; X
    $+x:: core.unitAttack() return ; SHIFT + X
    $^x:: core.unitHold() return ; CTRL + X
    $!x:: core.bindOneOrMany() return ; ALT + X
    $^!x:: core.bindManyToMany() return ; CTRL + ALT + X

    $c:: core.unitMoveOrBuild() return ; C
    $+c:: core.unitAttack() return ; SHIFT + C
    $^c:: core.unitHold() return ; CTRL + C
    $!c:: core.bindOneOrMany() return ; ALT + C
    $^!c:: core.bindManyToMany() return ; CTRL + ALT + C

    $v::
        core.unitMoveOrBuild()
    return ; C

    $b:: core.unitMoveOrBuild() return ; B
    $+b:: core.unitAttack() return ; SHIFT + B
    $^b:: core.unitHold() return ; CTRL + B
    $!b:: core.bindOneOrMany() return ; ALT + B
    $^!b:: core.bindManyToMany() return ; CTRL + ALT + B
#IfWinNotActive

;----------------------------------------GUI
$F1::
    toggleMainGui()
return

;----------------------------------------GLOBALS

#IfWinNotActive, index.ahk

$Space:: 
    core.centerCameraOnUnit()
    Send, 111
Return

~LButton:: ; LEFT CLICK
    core.resetHotkeyState() 111111
    builderMode.endBuilding()
Return

~+LButton:: ; LEFT CLICK
    core.resetHotkeyState()
    builderMode.endBuilding()
Return

~RButton:: ; RIGHT CLICK
    builderMode.endBuilding()
Return

~+RButton:: ; SHIFT + RIGHT CLICK
    builderMode.endBuilding()
Return

$`::
    isUnitSelect := core._recordHotkey("b")
    builderMode.toggleBuildingMode(isUnitSelect)
return ; Z

~Esc::
    core.resetHotkeyState()
    builderMode.endBuilding()
return

#IfWinNotActive

+Esc::Reload ; SHIFT + ESC
^Esc::ExitApp ; CTRL + ESC
