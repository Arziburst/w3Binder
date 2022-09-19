;----------------------------------------LIBS

#Include, ./node_modules/array.ahk/export.ahk

;----------------------------------------IMPORTS

#Include, ./src/data/undead.ahk
; #Include, ./src/data/horde.ahk
; #Include, ./src/data/nigthElf.ahk
; #Include, ./src/data/alliance.ahk

#Include, ./src/gui/Main.ahk

#Include, ./src/tools/unitMiddleware.ahk

#Include, ./src/tools/unit.ahk
#Include, ./src/tools/builderMode.ahk
#Include, ./src/tools/buildings.ahk

;----------------------------------------INSTANCES

heroOne := new Unit(heroOneData)
heroTwo := new Unit(heroTwoData)
heroThree := new Unit(heroThreeData)

armyOne := new Unit(armyOneData)
armyTwo := new Unit(armyTwoData)
armyThree := new Unit(armyThreeData)

builders := new Unit(buildersData)
builderMode := new BuilderMode(buildersData)
buildings := new Buildings(buildingsData)
;          Q        W        E          R      A        S        D          F      Z      X         C      V
units := [ heroOne, heroTwo, heroThree, false, armyOne, armyTwo, armyThree, false, false, builders, false, false ]

unitMiddleware := new UnitMiddleware(units, builderMode)

;----------------------------------------NUMERIC MANAGER

$1:: unitMiddleware.useSpell(1) return ; 1
$2:: unitMiddleware.useSpell(2) return ; 2
$3:: unitMiddleware.useSpell(3) return ; 3
$4:: unitMiddleware.useSpell(4) return ; 4

$+1:: unitMiddleware.heroLvlUp(1) return ; SHIFT + 1
$+2:: unitMiddleware.heroLvlUp(2) return ; SHIFT + 2
$+3:: unitMiddleware.heroLvlUp(3) return ; SHIFT + 3
$+4:: unitMiddleware.heroLvlUp(4) return ; SHIFT + 4

$!1:: unitMiddleware.useItem(1) return ; ALT + 1
$!2:: unitMiddleware.useItem(2) return ; ALT + 2
$!3:: unitMiddleware.useItem(3) return ; ALT + 3
$!4:: unitMiddleware.useItem(4) return ; ALT + 4
$!5:: unitMiddleware.useItem(5) return ; ALT + 5
$!6:: unitMiddleware.useItem(6) return ; ALT + 6

; ----------------------------------------FIRST HERO

$q:: unitMiddleware.unitMoveOrBuild() return
$+q:: unitMiddleware.unitAttack() return ; SHIFT + Q
$^q:: unitMiddleware.unitHold() return ; CTRL + Q
$!q:: unitMiddleware.bindOneOrMany() return ; ALT + Q
$^!q:: unitMiddleware.bindManyToMany() return ; CTRL + ALT + Q

; ----------------------------------------SECOND HERO

$w:: unitMiddleware.unitMoveOrBuild() return ; W
$+w:: unitMiddleware.unitAttack() return ; SHIFT + W
$^w:: unitMiddleware.unitHold() return ; CTRL + W
$!w:: unitMiddleware.bindOneOrMany() return ; ALT + W
$^!w:: unitMiddleware.bindManyToMany() return ; CTRL + ALT + W

; ----------------------------------------THIRD HERO

$e:: unitMiddleware.unitMoveOrBuild() return ; E
$+e:: unitMiddleware.unitAttack() return ; SHIFT + E
$^e:: unitMiddleware.unitHold() return ; CTRL + E
$!e:: unitMiddleware.bindOneOrMany() return ; ALT + E
$^!e:: unitMiddleware.bindManyToMany() return ; CTRL + ALT + E

; ----------------------------------------HERO COMBOS

$r:: ; R
    If (!builderMode.getBuilderModeState()) {
        heroOne.unitMove()
        heroTwo.unitMove()
        heroThree.unitMove()
    }

    unitMiddleware.unitMoveOrBuild()
return

$+r:: ; SHIFT + R
    unitMiddleware.resetHotkeyState()

    heroOne.unitAttack()
    heroTwo.unitAttack()
    heroThree.unitAttack()
return

$^r:: ; CTRL + R
    unitMiddleware.resetHotkeyState()

    heroOne.unitHold()
    heroTwo.unitHold()
    heroThree.unitHold()
return

$t:: ; T
    unitMiddleware.resetHotkeyState()

    heroOne.useComboSpell()
    heroTwo.useComboSpell()
    heroThree.useComboSpell()
return

$+t:: ; SHIFT + T
    unitMiddleware.resetHotkeyState()

    heroOne.heroAutoLvlUp()
    heroTwo.heroAutoLvlUp()
    heroThree.heroAutoLvlUp()
return

;----------------------------------------ARMY ONE

$a:: unitMiddleware.unitMoveOrBuild() return ; A
$+a:: unitMiddleware.unitAttack() return ; SHIFT + A
$^a:: unitMiddleware.unitHold() return ; CTRL + A
$!a:: unitMiddleware.bindOneOrMany() return ; ALT + A
$^!a:: unitMiddleware.bindManyToMany() return ; CTRL + ALT + A

;----------------------------------------ARMY TWO

$s:: unitMiddleware.unitMoveOrBuild() return ; S
$+s:: unitMiddleware.unitAttack() return ; SHIFT + S
$^s:: unitMiddleware.unitHold() return ; CTRL + S
$!s:: unitMiddleware.bindOneOrMany() return ; ALT + S
$^!s:: unitMiddleware.bindManyToMany() return ; CTRL + ALT + S

;----------------------------------------ARMY THREE

$d:: unitMiddleware.unitMoveOrBuild() return ; D
$+d:: unitMiddleware.unitAttack() return ; SHIFT + D
$^d:: unitMiddleware.unitHold() return ; CTRL + D
$!d:: unitMiddleware.bindOneOrMany() return ; ALT + D
$^!d:: unitMiddleware.bindManyToMany() return ; CTRL + ALT + D

;----------------------------------------ARMYS COMBOS

$f:: ; F
    If (!builderMode.getBuilderModeState()) {
        armyOne.unitMove()
        armyTwo.unitMove()
        armyThree.unitMove()
    }

    unitMiddleware.unitMoveOrBuild()
return

$+f:: ; SHIFT + F
    unitMiddleware.resetHotkeyState()

    armyOne.unitAttack()
    armyTwo.unitAttack()
    armyThree.unitAttack()
return

$^f:: ; CTRL + F
    unitMiddleware.resetHotkeyState()

    armyOne.unitHold()
    armyTwo.unitHold()
    armyThree.unitHold()
return

;----------------------------------------BUILDERS
$z:: unitMiddleware.unitMoveOrBuild() return ; Z
$x:: unitMiddleware.unitMoveOrBuild() return ; X
$+x:: unitMiddleware.unitAttack() return ; SHIFT + X
$^x:: unitMiddleware.unitHold() return ; CTRL + X
$!x:: unitMiddleware.bindOneOrMany() return ; ALT + X
$^!x:: unitMiddleware.bindManyToMany() return ; CTRL + ALT + X

;----------------------------------------BUILDINGS

$c::
    unitMiddleware.unitMoveOrBuild()

    If (!builderMode.getBuilderModeState()) {
        buildings.toggleBuildings()
    }
return ; C
$!c:: 
    unitMiddleware.resetHotkeyState()
    buildings.bindOneOrMany() 
return ; ALT + C

$v::
    unitMiddleware.unitMoveOrBuild()
return ; C

;----------------------------------------GUI

$F1::
    toggleMainGui()
return

;----------------------------------------GLOBALS

$Space:: 
    unitMiddleware.centerCameraOnUnit()
Return

~LButton:: ; LEFT CLICK
    unitMiddleware.resetHotkeyState()
    builderMode.endBuilding()
Return

~+LButton:: ; LEFT CLICK
    unitMiddleware.resetHotkeyState()
    builderMode.endBuilding()
Return

~RButton:: ; RIGHT CLICK
    builderMode.endBuilding()
Return

~+RButton:: ; SHIFT + RIGHT CLICK
    builderMode.endBuilding()
Return

$`::
    isUnitSelect := unitMiddleware._recordHotkey("x")
    builderMode.toggleBuildingMode(isUnitSelect)
return ; Z

~Esc::
    unitMiddleware.resetHotkeyState()
    builderMode.endBuilding()
return

+Esc::Reload ; SHIFT + ESC
^Esc::ExitApp ; CTRL + ESC