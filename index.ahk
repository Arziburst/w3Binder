;----------------------------------------Libs

#Include, ./node_modules/array.ahk/export.ahk

;----------------------------------------Imports

#Include, ./src/staticData.ahk
#Include, ./src/gui/Main.ahk
#Include, ./src/tools/unit.ahk
#Include, ./src/tools/spellManager.ahk
#Include, ./src/tools/builderMode.ahk
#Include, ./src/tools/buildings.ahk

;----------------------------------------Instances

HeroOne := new Unit(heroOneData)
HeroTwo := new Unit(heroTwoData)
HeroThree := new Unit(heroThreeData)

ArmyOne := new Unit(armyOneData)
ArmyTwo := new Unit(armyTwoData)
ArmyThree := new Unit(armyThreeData)

spellManager := new SpellManager([HeroOne, HeroTwo, HeroThree, ArmyOne, ArmyTwo, ArmyThree])

BuildingOne := new Unit(_BuildingOne)
BuildingTwo := new Unit(_BuildingTwo)
BuildingThree := new Unit(_BuildingThree)

BuildersGroup := new Unit(buildersData)
BuilderEntity := new BuilderMode(buildersData)
BuildingsEntity := new Buildings(buildingsData)

;----------------------------------------Heroes

$1:: spellManager.useSpell(1) return ; 1
$2:: spellManager.useSpell(2) return ; 2
$3:: spellManager.useSpell(3) return ; 3
$4:: spellManager.useSpell(4) return ; 4

$+1:: spellManager.spellUp(1) return ; SHIFT + 1
$+2:: spellManager.spellUp(2) return ; SHIFT + 2
$+3:: spellManager.spellUp(3) return ; SHIFT + 3
$+4:: spellManager.spellUp(4) return ; SHIFT + 4

$q:: ; Q
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        HeroOne.unitMove()
        spellManager.recordKey()
    }
return
$+q:: HeroOne.unitAttack() return ; SHIFT + Q
$^q:: HeroOne.unitHold() return ; CTRL + Q
$!q:: HeroOne.bindOneOrMany() return ; ALT + Q
$^!q:: HeroOne.bindManyToMany() return ; CTRL + ALT + Q

$w::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        HeroTwo.unitMove()
        spellManager.recordKey()
    }
return ; W
$+w:: HeroTwo.unitAttack() return ; SHIFT + W
$^w:: HeroTwo.unitHold() return ; CTRL + W
$!w:: HeroTwo.bindOneOrMany() return ; ALT + W
$^!w:: HeroTwo.bindManyToMany() return ; CTRL + ALT + W

$e::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        HeroThree.unitMove()
        spellManager.recordKey()
    }
return ; E
$+e:: HeroThree.unitAttack() return ; SHIFT + E
$^e:: HeroThree.unitHold() return ; CTRL + E
$!e:: HeroThree.bindOneOrMany() return ; ALT + E
$^!e:: HeroThree.bindManyToMany() return ; CTRL + ALT + E

$r:: ; R
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        HeroOne.unitMove()
        HeroTwo.unitMove()
        HeroThree.unitMove()
    }
return

$+r:: ; SHIFT + R
    HeroOne.unitAttack()
    HeroTwo.unitAttack()
    HeroThree.unitAttack()
return

$^r:: ; CTRL + R
    HeroOne.heroAutoLvlUp()
    HeroTwo.heroAutoLvlUp()
    HeroThree.heroAutoLvlUp()
return

$t:: ; T
    HeroOne.useComboSpell()
    HeroTwo.useComboSpell()
    HeroThree.useComboSpell()
return

;----------------------------------------Armys

$a:: ; A
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        ArmyOne.unitMove()
        spellManager.recordKey()
    }
return
$+a:: ArmyOne.unitAttack() return ; SHIFT + A
$^a:: ArmyOne.unitHold() return ; CTRL + A
$!a:: ArmyOne.bindOneOrMany() return ; ALT + A
$^!a:: ArmyOne.bindManyToMany() return ; CTRL + ALT + A

$s::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        ArmyTwo.unitMove()
        spellManager.recordKey()
    }
return ; S
$+s:: ArmyTwo.unitAttack() return ; SHIFT + S
$^s:: ArmyTwo.unitHold() return ; CTRL + S
$!s:: ArmyTwo.bindOneOrMany() return ; ALT + S
$^!s:: ArmyTwo.bindManyToMany() return ; CTRL + ALT + S

$d::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        ArmyThree.unitMove()
        spellManager.recordKey()
    }
return ; D
$+d:: ArmyThree.unitAttack() return ; SHIFT + D
$^d:: ArmyThree.unitHold() return ; CTRL + D
$!d:: ArmyThree.bindOneOrMany() return ; ALT + D
$^!d:: ArmyThree.bindManyToMany() return ; CTRL + ALT + D

$f:: ; F
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        ArmyOne.unitMove()
        ArmyTwo.unitMove()
        ArmyThree.unitMove()
    }
return

$+f:: ; SHIFT + F
    ArmyOne.unitAttack()
    ArmyTwo.unitAttack()
    ArmyThree.unitAttack()
return

$^f:: ; CTRL + F
    ArmyOne.unitHold()
    ArmyTwo.unitHold()
    ArmyThree.unitHold()
return

;----------------------------------------Builders
$z::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    }
return ; Z

$x::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        BuildersGroup.unitMove()
    }
return ; X

$!x:: BuildersGroup.bindOneOrMany() return ; ALT + X
$^!x:: BuildersGroup.bindManyToMany() return ; CTRL + ALT + X

;----------------------------------------Buildings

$c::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        BuildingsEntity.toggleBuildings()
    }
return ; C
$!c:: BuildingsEntity.bindOneOrMany() return ; ALT + C

$v::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    }
return ; C

;----------------------------------------GUI

$F1::
    toggleMainGui()
return

;----------------------------------------Globals

~RButton:: ; RIGHT CLICK
    BuilderEntity.endBuilding()
Return

$`::
    BuilderEntity.startBuilding()
return ; Z

+Esc::Reload ; SHIFT + ESC
^Esc::ExitApp ; CTRL + ESC