;----------------------------------------Libs

#Include, ./node_modules/array.ahk/export.ahk

;----------------------------------------Imports

#Include, ./src/undead.ahk
; #Include, ./src/horde.ahk
; #Include, ./src/nigthElf.ahk
; #Include, ./src/human.ahk

#Include, ./src/gui/Main.ahk

#Include, ./src/tools/manager.ahk
#Include, ./src/tools/manager.ahk

#Include, ./src/tools/unit.ahk
#Include, ./src/tools/builderMode.ahk
#Include, ./src/tools/buildings.ahk

;----------------------------------------Instances

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

manager := new Manager([ HeroOne, HeroTwo, HeroThree, ArmyOne, ArmyTwo, ArmyThree, BuildersGroup ])

;----------------------------------------Heroes

$1:: manager.useManager("useSpell") return ; 1
$2:: manager.useManager("useSpell") return ; 2
$3:: manager.useManager("useSpell") return ; 3
$4:: manager.useManager("useSpell") return ; 4

$+1:: manager.useManager("spellLvlUp") return ; SHIFT + 1
$+2:: manager.useManager("spellLvlUp") return ; SHIFT + 2
$+3:: manager.useManager("spellLvlUp") return ; SHIFT + 3
$+4:: manager.useManager("spellLvlUp") return ; SHIFT + 4

$!1:: manager.useManager("useItem") return ; ALT + 1
$!2:: manager.useManager("useItem") return ; ALT + 2
$!3:: manager.useManager("useItem") return ; ALT + 3
$!4:: manager.useManager("useItem") return ; ALT + 4
$!5:: manager.useManager("useItem") return ; ALT + 4
$!6:: manager.useManager("useItem") return ; ALT + 4

$q:: ; Q
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        isUnitSelect := manager.recordHotkey()
        HeroOne.unitMove(isUnitSelect)
    }
return
$+q:: 
    isUnitSelect := manager.recordHotkey()
    HeroOne.unitAttack(isUnitSelect) 
return ; SHIFT + Q
$^q:: 
    isUnitSelect := manager.recordHotkey()
    HeroOne.unitHold(isUnitSelect) 
return ; CTRL + Q
$!q:: HeroOne.bindOneOrMany() return ; ALT + Q
$^!q:: HeroOne.bindManyToMany() return ; CTRL + ALT + Q

$w::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        isUnitSelect := manager.recordHotkey()
        HeroTwo.unitMove(isUnitSelect)
    }
return ; W
$+w::
    isUnitSelect := manager.recordHotkey()
    HeroTwo.unitAttack(isUnitSelect)
return ; SHIFT + W
$^w:: 
    isUnitSelect := manager.recordHotkey()
    HeroTwo.unitHold(isUnitSelect)
return ; CTRL + W
$!w:: HeroTwo.bindOneOrMany() return ; ALT + W
$^!w:: HeroTwo.bindManyToMany() return ; CTRL + ALT + W

$e::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        isUnitSelect := manager.recordHotkey()
        HeroThree.unitMove(isUnitSelect)
    }
return ; E
$+e::
    isUnitSelect := manager.recordHotkey()
    HeroThree.unitAttack(isUnitSelect)
return ; SHIFT + E
$^e:: 
    isUnitSelect := manager.recordHotkey()
    HeroThree.unitHold(isUnitSelect) 
return ; CTRL + E
$!e:: HeroThree.bindOneOrMany() return ; ALT + E
$^!e:: HeroThree.bindManyToMany() return ; CTRL + ALT + E

$r:: ; R
    manager.resetHotkeyState()

    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        HeroOne.unitMove()
        HeroTwo.unitMove()
        HeroThree.unitMove()
    }
return

$+r:: ; SHIFT + R
    manager.resetHotkeyState()

    HeroOne.unitAttack()
    HeroTwo.unitAttack()
    HeroThree.unitAttack()
return

$^r:: ; CTRL + R
    manager.resetHotkeyState()

    HeroOne.unitHold()
    HeroTwo.unitHold()
    HeroThree.unitHold()
return

$t:: ; T
    manager.resetHotkeyState()

    HeroOne.useComboSpell()
    HeroTwo.useComboSpell()
    HeroThree.useComboSpell()
return

$+t:: ; SHIFT + T
    manager.resetHotkeyState()

    HeroOne.heroAutoLvlUp()
    HeroTwo.heroAutoLvlUp()
    HeroThree.heroAutoLvlUp()
return

;----------------------------------------Armys

$a:: ; A
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        isUnitSelect := manager.recordHotkey()
        ArmyOne.unitMove(isUnitSelect)
    }
return
$+a::
    isUnitSelect := manager.recordHotkey()
    ArmyOne.unitAttack(isUnitSelect)
return ; SHIFT + A
$^a::
    isUnitSelect := manager.recordHotkey()
    ArmyOne.unitHold(isUnitSelect) 
return ; CTRL + A
$!a:: ArmyOne.bindOneOrMany() return ; ALT + A
$^!a:: ArmyOne.bindManyToMany() return ; CTRL + ALT + A

$s::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        isUnitSelect := manager.recordHotkey()
        ArmyTwo.unitMove(isUnitSelect)
    }
return ; S
$+s::
    isUnitSelect := manager.recordHotkey()
    ArmyTwo.unitAttack(isUnitSelect)
return ; SHIFT + S
$^s:: 
    isUnitSelect := manager.recordHotkey()
    ArmyTwo.unitHold(isUnitSelect) 
return ; CTRL + S
$!s:: ArmyTwo.bindOneOrMany() return ; ALT + S
$^!s:: ArmyTwo.bindManyToMany() return ; CTRL + ALT + S

$d::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        isUnitSelect := manager.recordHotkey()
        ArmyThree.unitMove(isUnitSelect)
    }
return ; D
$+d:: 
    isUnitSelect := manager.recordHotkey()
    ArmyThree.unitAttack(isUnitSelect) 
return ; SHIFT + D
$^d:: 
    isUnitSelect := manager.recordHotkey()
    ArmyThree.unitHold(isUnitSelect) 
return ; CTRL + D
$!d:: ArmyThree.bindOneOrMany() return ; ALT + D
$^!d:: ArmyThree.bindManyToMany() return ; CTRL + ALT + D

$f:: ; F
    manager.resetHotkeyState()

    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        ArmyOne.unitMove()
        ArmyTwo.unitMove()
        ArmyThree.unitMove()
    }
return

$+f:: ; SHIFT + F
    manager.resetHotkeyState()

    ArmyOne.unitAttack()
    ArmyTwo.unitAttack()
    ArmyThree.unitAttack()
return

$^f:: ; CTRL + F
    manager.resetHotkeyState()

    ArmyOne.unitHold()
    ArmyTwo.unitHold()
    ArmyThree.unitHold()
return

;----------------------------------------Builders
$z::
    manager.resetHotkeyState()

    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    }
return ; Z

$x::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        isUnitSelect := manager.recordHotkey()
        BuildersGroup.unitMove(isUnitSelect)
    }
return ; X
$+x::
    isUnitSelect := manager.recordHotkey()
    BuildersGroup.unitAttack(isUnitSelect)
return ; SHIFT + X
$^x::
    isUnitSelect := manager.recordHotkey()
    BuildersGroup.unitHold(isUnitSelect)
return ; SHIFT + X
$!x:: BuildersGroup.bindOneOrMany() return ; ALT + X
$^!x:: BuildersGroup.bindManyToMany() return ; CTRL + ALT + X

;----------------------------------------Buildings

$c::
    manager.resetHotkeyState()

    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        BuildingsEntity.toggleBuildings()
    }
return ; C
$!c:: BuildingsEntity.bindOneOrMany() return ; ALT + C

$v::
    manager.resetHotkeyState()

    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    }
return ; C

;----------------------------------------GUI

$F1::
    toggleMainGui()
return

;----------------------------------------Globals

$Space:: 
    manager.useManager("centerCameraOnLastUnit")
Return

; ~LButton:: ; LEFT CLICK
;     manager.resetHotkeyState()
; Return

~RButton:: ; RIGHT CLICK
    BuilderEntity.endBuilding()
Return

$`::
    BuilderEntity.startBuilding()
return ; Z

Esc::
    manager.resetHotkeyState()
    BuilderEntity.endBuilding()
return

+Esc::Reload ; SHIFT + ESC
^Esc::ExitApp ; CTRL + ESC