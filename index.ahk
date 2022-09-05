;----------------------------------------Libs

#Include, ./node_modules/array.ahk/export.ahk

;----------------------------------------Imports

#Include, ./src/staticData.ahk

#Include, ./src/gui/Main.ahk

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

;----------------------------------------Heroes

$q:: ; Q
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        HeroOne.unitMove()
    }
return
$+q:: HeroOne.useMainSpell() return ; SHIFT + Q
$^q:: HeroOne.useSecondarySpell() return ; CTRL + Q
$+!q:: HeroOne.useThirdSpell() return ; SHIFT + ALT + Q
$^+q:: HeroOne.useUltimate() return ; CTRL + SHIFT + Q
$!q:: HeroOne.bindOneOrMany() return ; ALT + Q
$^!q:: HeroOne.bindManyToMany() return ; CTRL + ALT + Q

$w::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        HeroTwo.unitMove()
    }
return ; W
$+w:: HeroTwo.useMainSpell() return ; SHIFT + W
$^w:: HeroTwo.useSecondarySpell() return ; CTRL + W
$+!w:: HeroTwo.useThirdSpell() return ; SHIFT + ALT + W
$^+w:: HeroTwo.useUltimate() return ; CTRL + SHIFT + W
$!w:: HeroTwo.bindOneOrMany() return ; ALT + W
$^!w:: HeroTwo.bindManyToMany() return ; CTRL + ALT + W

$e::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        HeroThree.unitMove()
    }
return ; E
$+e:: HeroThree.useMainSpell() return ; SHIFT + E
$^e:: HeroThree.useSecondarySpell() return ; CTRL + E
$+!e:: HeroThree.useThirdSpell() return ; SHIFT + ALT + E
$^+e:: HeroThree.useUltimate() return ; CTRL + SHIFT + E
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
    HeroOne.useMainSpell()
    HeroTwo.useMainSpell()
    HeroThree.useMainSpell()
return

$^r:: ; CTRL + R
    HeroOne.heroLvlUp()
    HeroTwo.heroLvlUp()
    HeroThree.heroLvlUp()
return

;----------------------------------------Armys

$a:: 
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        ArmyOne.unitMove()
    }
return ; A
$+a:: ArmyOne.unitAttack() return ; SHIFT + A
$^a:: ArmyOne.unitHold() return ; CTRL + A
$!a:: ArmyOne.bindOneOrMany() return ; ALT + A
$^!a:: ArmyOne.bindManyToMany() return ; CTRL + ALT + A

$s::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.build()
    } Else {
        ArmyTwo.unitMove()
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
;----------------------------------------Globals

~RButton:: ; RIGHT CLICK
    BuilderEntity.endBuilding()
Return

+Esc::Reload ; SHIFT + ESC
^Esc::ExitApp ; CTRL + ESC

;----------------------------------------GUI

$`::
    BuilderEntity.startBuilding()
return ; Z

$F1::
    toggleMainGui()
return
