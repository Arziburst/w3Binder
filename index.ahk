
#Include, ./scripts/webapp/index.ahk

#Include, ./ahk/tools/index.ahk
#Include, ./ahk/services/unit.ahk
#Include, ./ahk/services/builderMode.ahk
#Include, ./ahk/services/buildings.ahk

#Include, ./ahk/ahkJs.ahk
#Include, ./ahk/core.ahk

selectFractionAhk(fractionIndex) {
    fractions := ["horde", "alliance", "nightElf", "undead"]
    template := "./ahk/data/fraction.json"
    selectedFraction := fractions[fractionIndex]
    unitsJSONUrl := StrReplace(template, "fraction", selectedFraction)

    FileRead,unitsJSON,%unitsJSONUrl%
    data := jsonToObject(unitsJSON)

    heroOne := new Unit(data.heroOneData)
    heroTwo := new Unit(data.heroTwoData)
    heroThree := new Unit(data.heroThreeData)

    armyOne := new Unit(data.armyOneData)
    armyTwo := new Unit(data.armyTwoData)
    armyThree := new Unit(data.armyThreeData)

    builders := new Unit(data.buildersData)
    builderMode := new BuilderMode(data.buildersData)

    ;          Q        W        E          R      A        S        D          F      Z      X         C      V
    units := [ heroOne, heroTwo, heroThree, false, armyOne, armyTwo, armyThree, false, false, builders, false, false ]
    core := new Core(units, builderMode)

    return [ core, units, builderMode ]
}

buildings := new Buildings()

result := selectFractionAhk(1)

global core := result[1]
global units := result[2]
global builderMode := result[3]

;----------------------------------------NUMERIC MANAGER

; $1:: core.useSpell(1) return ; 1
; $2:: core.useSpell(2) return ; 2
; $3:: core.useSpell(3) return ; 3
; $4:: core.useSpell(4) return ; 4

; $+1:: core.heroLvlUp(1) return ; SHIFT + 1
; $+2:: core.heroLvlUp(2) return ; SHIFT + 2
; $+3:: core.heroLvlUp(3) return ; SHIFT + 3
; $+4:: core.heroLvlUp(4) return ; SHIFT + 4

; $!1:: core.useItem(1) return ; ALT + 1
; $!2:: core.useItem(2) return ; ALT + 2
; $!3:: core.useItem(3) return ; ALT + 3
; $!4:: core.useItem(4) return ; ALT + 4
; $!5:: core.useItem(5) return ; ALT + 5
; $!6:: core.useItem(6) return ; ALT + 6

; ; ----------------------------------------FIRST HERO

; $q:: core.unitMoveOrBuild() return ; Q
; $+q:: core.unitAttack() return ; SHIFT + Q
; $^q:: core.unitHold() return ; CTRL + Q
; $!q:: core.bindOneOrMany() return ; ALT + Q
; $^!q:: core.bindManyToMany() return ; CTRL + ALT + Q

; ; ----------------------------------------SECOND HERO

; $w:: core.unitMoveOrBuild() return ; W
; $+w:: core.unitAttack() return ; SHIFT + W
; $^w:: core.unitHold() return ; CTRL + W
; $!w:: core.bindOneOrMany() return ; ALT + W
; $^!w:: core.bindManyToMany() return ; CTRL + ALT + W

; ; ----------------------------------------THIRD HERO

; $e:: core.unitMoveOrBuild() return ; E
; $+e:: core.unitAttack() return ; SHIFT + E
; $^e:: core.unitHold() return ; CTRL + E
; $!e:: core.bindOneOrMany() return ; ALT + E
; $^!e:: core.bindManyToMany() return ; CTRL + ALT + E

; ; ----------------------------------------HERO COMBOS

; $r:: ; R
;     core.unitMoveOrBuild()

;     If (!builderMode.getBuilderModeState()) {
;         units[1].unitMove()
;         units[2].unitMove()
;         units[3].unitMove()
;     }
; return

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

; ;----------------------------------------ARMY ONE

; $a:: core.unitMoveOrBuild() return ; A
; $+a:: core.unitAttack() return ; SHIFT + A
; $^a:: core.unitHold() return ; CTRL + A
; $!a:: core.bindOneOrMany() return ; ALT + A
; $^!a:: core.bindManyToMany() return ; CTRL + ALT + A

; ;----------------------------------------ARMY TWO

; $s:: core.unitMoveOrBuild() return ; S
; $+s:: core.unitAttack() return ; SHIFT + S
; $^s:: core.unitHold() return ; CTRL + S
; $!s:: core.bindOneOrMany() return ; ALT + S
; $^!s:: core.bindManyToMany() return ; CTRL + ALT + S

; ;----------------------------------------ARMY THREE

; $d:: core.unitMoveOrBuild() return ; D
; $+d:: core.unitAttack() return ; SHIFT + D
; $^d:: core.unitHold() return ; CTRL + D
; $!d:: core.bindOneOrMany() return ; ALT + D
; $^!d:: core.bindManyToMany() return ; CTRL + ALT + D

; ;----------------------------------------ARMYS COMBOS

; $f:: ; F
;     core.unitMoveOrBuild()

;     If (!builderMode.getBuilderModeState()) {
;         units[5].unitMove()
;         units[6].unitMove()
;         units[7].unitMove()
;     }
; return

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

; $z:: core.unitMoveOrBuild() return ; Z

; ;----------------------------------------BUILDERS

; $x:: core.unitMoveOrBuild() return ; X
; $+x:: core.unitAttack() return ; SHIFT + X
; $^x:: core.unitHold() return ; CTRL + X
; $!x:: core.bindOneOrMany() return ; ALT + X
; $^!x:: core.bindManyToMany() return ; CTRL + ALT + X

; ;----------------------------------------BUILDINGS

; $c::
;     core.unitMoveOrBuild()

;     If (!builderMode.getBuilderModeState()) {
;         buildings.toggleBuildings() 
;     }
; return ; C
; $!c:: 
;     core.resetHotkeyState()
;     buildings.bindOneOrMany() 
; return ; ALT + C

; $v::
;     core.unitMoveOrBuild()
; return ; C

; ;----------------------------------------GUI

$F1::
    toggleMainGui()
return

; ;----------------------------------------GLOBALS

; $Space:: 
;     core.centerCameraOnUnit()
; Return

; ~LButton:: ; LEFT CLICK
;     core.resetHotkeyState()
;     builderMode.endBuilding()
; Return

; ~+LButton:: ; LEFT CLICK
;     core.resetHotkeyState()
;     builderMode.endBuilding()
; Return

; ~RButton:: ; RIGHT CLICK
;     builderMode.endBuilding()
; Return

; ~+RButton:: ; SHIFT + RIGHT CLICK
;     builderMode.endBuilding()
; Return

; $`::
;     isUnitSelect := core._recordHotkey("x")
;     builderMode.toggleBuildingMode(isUnitSelect)
; return ; Z

; ~Esc::
;     core.resetHotkeyState()
;     builderMode.endBuilding()
; return

+Esc::Reload ; SHIFT + ESC
^Esc::ExitApp ; CTRL + ESC
