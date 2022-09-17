;----------------------------------------LIBS

#Include, ./node_modules/array.ahk/export.ahk

;----------------------------------------IMPORTS

#Include, ./src/undead.ahk
; #Include, ./src/horde.ahk
; #Include, ./src/nigthElf.ahk
; #Include, ./src/human.ahk

#Include, ./src/gui/Main.ahk

#Include, ./src/tools/unitMiddleware.ahk

#Include, ./src/tools/unit.ahk
#Include, ./src/tools/builderMode.ahk
#Include, ./src/tools/buildings.ahk

;----------------------------------------INSTANCES

HeroOne := new Unit(heroOneData)
HeroTwo := new Unit(heroTwoData)
HeroThree := new Unit(heroThreeData)

ArmyOne := new Unit(armyOneData)
ArmyTwo := new Unit(armyTwoData)
ArmyThree := new Unit(armyThreeData)

BuildingOne := new Unit(_BuildingOne)
BuildingTwo := new Unit(_BuildingTwo)
BuildingThree := new Unit(_BuildingThree)

BuildersGroup := new Unit(buildersData)
BuilderEntity := new BuilderMode(buildersData)
BuildingsEntity := new Buildings(buildingsData)

unitMiddleware := new UnitMiddleware([ HeroOne, HeroTwo, HeroThree, ArmyOne, ArmyTwo, ArmyThree, BuildersGroup ])

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

$q:: ; Q
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        unitMiddleware.unitMove()
    }
return
$+q:: unitMiddleware.unitAttack() return ; SHIFT + Q
$^q:: unitMiddleware.unitHold() return ; CTRL + Q
$!q:: HeroOne.bindOneOrMany() return ; ALT + Q
$^!q:: HeroOne.bindManyToMany() return ; CTRL + ALT + Q

; ----------------------------------------SECOND HERO

$w::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        unitMiddleware.unitMove()
    }
return ; W
$+w:: unitMiddleware.unitAttack() return ; SHIFT + W
$^w:: unitMiddleware.unitHold() return ; CTRL + W
$!w:: HeroTwo.bindOneOrMany() return ; ALT + W
$^!w:: HeroTwo.bindManyToMany() return ; CTRL + ALT + W

; ----------------------------------------THIRD HERO

$e::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        unitMiddleware.unitMove()
    }
return ; E
$+e:: unitMiddleware.unitAttack() return ; SHIFT + E
$^e:: unitMiddleware.unitHold() return ; CTRL + E
$!e:: HeroThree.bindOneOrMany() return ; ALT + E
$^!e:: HeroThree.bindManyToMany() return ; CTRL + ALT + E

; ----------------------------------------HERO COMBOS

$r:: ; R
    unitMiddleware.resetHotkeyState()

    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        HeroOne.unitMove()
        HeroTwo.unitMove()
        HeroThree.unitMove()
    }
return

$+r:: ; SHIFT + R
    unitMiddleware.resetHotkeyState()

    HeroOne.unitAttack()
    HeroTwo.unitAttack()
    HeroThree.unitAttack()
return

$^r:: ; CTRL + R
    unitMiddleware.resetHotkeyState()

    HeroOne.unitHold()
    HeroTwo.unitHold()
    HeroThree.unitHold()
return

$t:: ; T
    unitMiddleware.resetHotkeyState()

    HeroOne.useComboSpell()
    HeroTwo.useComboSpell()
    HeroThree.useComboSpell()
return

$+t:: ; SHIFT + T
    unitMiddleware.resetHotkeyState()

    HeroOne.heroAutoLvlUp()
    HeroTwo.heroAutoLvlUp()
    HeroThree.heroAutoLvlUp()
return

;----------------------------------------ARMY ONE

$a:: ; A
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        unitMiddleware.unitMove()
    }
return
$+a:: unitMiddleware.unitAttack() return ; SHIFT + A
$^a:: unitMiddleware.unitHold() return ; CTRL + A
$!a:: ArmyOne.bindOneOrMany() return ; ALT + A
$^!a:: ArmyOne.bindManyToMany() return ; CTRL + ALT + A

;----------------------------------------ARMY TWO

$s::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        unitMiddleware.unitMove()
    }
return ; S
$+s:: unitMiddleware.unitAttack(isUnitSelect) return ; SHIFT + S
$^s:: unitMiddleware.unitHold() return ; CTRL + S
$!s:: ArmyTwo.bindOneOrMany() return ; ALT + S
$^!s:: ArmyTwo.bindManyToMany() return ; CTRL + ALT + S

;----------------------------------------ARMY THREE

$d::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        unitMiddleware.unitMove()
    }
return ; D
$+d:: unitMiddleware.unitAttack() return ; SHIFT + D
$^d:: unitMiddleware.unitHold() return ; CTRL + D
$!d:: ArmyThree.bindOneOrMany() return ; ALT + D
$^!d:: ArmyThree.bindManyToMany() return ; CTRL + ALT + D

;----------------------------------------ARMYS COMBOS

$f:: ; F
    unitMiddleware.resetHotkeyState()

    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        ArmyOne.unitMove()
        ArmyTwo.unitMove()
        ArmyThree.unitMove()
    }
return

$+f:: ; SHIFT + F
    unitMiddleware.resetHotkeyState()

    ArmyOne.unitAttack()
    ArmyTwo.unitAttack()
    ArmyThree.unitAttack()
return

$^f:: ; CTRL + F
    unitMiddleware.resetHotkeyState()

    ArmyOne.unitHold()
    ArmyTwo.unitHold()
    ArmyThree.unitHold()
return

;----------------------------------------BUILDERS
$z::
    unitMiddleware.resetHotkeyState()

    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    }
return ; Z

$x::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        unitMiddleware.unitMove()
    }
return ; X
$+x:: unitMiddleware.unitAttack() return ; SHIFT + X
$^x:: unitMiddleware.unitHold() return ; CTRL + X
$!x:: BuildersGroup.bindOneOrMany() return ; ALT + X
$^!x:: BuildersGroup.bindManyToMany() return ; CTRL + ALT + X

;----------------------------------------BUILDINGS

$c::
    unitMiddleware.resetHotkeyState()

    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        BuildingsEntity.toggleBuildings()
    }
return ; C
$!c:: BuildingsEntity.bindOneOrMany() return ; ALT + C

$v::
    unitMiddleware.resetHotkeyState()

    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    }
return ; C

;----------------------------------------GUI

$F1::
    toggleMainGui()
return

;----------------------------------------GLOBALS

$Space:: 
    unitMiddleware.centerCameraOnUnit()
    BuilderEntity.endBuilding()
Return

~LButton:: ; LEFT CLICK
    unitMiddleware.resetHotkeyState()
Return

~RButton:: ; RIGHT CLICK
    BuilderEntity.endBuilding()
Return

$`::
    unitMiddleware.setHotkey("x")
    BuilderEntity.startBuilding()
return ; Z

$Esc::
    unitMiddleware.resetHotkeyState()
    BuilderEntity.endBuilding()
return

+Esc::Reload ; SHIFT + ESC
^Esc::ExitApp ; CTRL + ESC