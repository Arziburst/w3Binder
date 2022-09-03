;----------------------------------------Libs

#Include, ./node_modules/array.ahk/export.ahk

;----------------------------------------Imports

#Include, ./src/unitData.ahk
#Include, ./src/unit.ahk
#Include, ./src/builderMode.ahk
#Include, ./src/buildings.ahk

;----------------------------------------Instances

MainHero := new Unit(DeathKnight)
SecondaryHero := new Unit(Leech)
LastHero := new Unit(DreadLord)

ArmyOne := new Unit(_ArmyOne)
ArmyTwo := new Unit(_ArmyTwo)
ArmyThree := new Unit(_ArmyThree)

BuildingOne := new Unit(_BuildingOne)
BuildingTwo := new Unit(_BuildingTwo)
BuildingThree := new Unit(_BuildingThree)

BuildersGroup := new Unit(_Builders)
BuilderEntity := new BuilderMode(_Builders)
BuildingsEntity := new Buildings(_Buildings)

;----------------------------------------Heroes

$q:: ; Q
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("q")
    } Else {
        MainHero.unitMove()
    }
return
$+q:: MainHero.useMainSpell() return ; SHIFT + Q
$^q:: MainHero.useSecondarySpell() return ; CTRL + Q
$^!q:: MainHero.useThirdSpell() return ; CTRL + ALT + Q
$^+q:: MainHero.useUltimate() return ; CTRL + SHIFT + Q
$!q:: MainHero.bindOneOrMany() return ; ALT + Q
$+!q:: MainHero.bindManyToMany() return ; SHIFT + ALT + Q

$w::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("w")
    } Else {
        SecondaryHero.unitMove()
    }
return ; W
$+w:: SecondaryHero.useMainSpell() return ; SHIFT + W
$^w:: SecondaryHero.useSecondarySpell() return ; CTRL + W
$^!w:: SecondaryHero.useThirdSpell() return ; CTRL + ALT + W
$^+w:: SecondaryHero.useUltimate() return ; CTRL + SHIFT + W
$!w:: SecondaryHero.bindOneOrMany() return ; ALT + W
$+!w:: SecondaryHero.bindManyToMany() return ; SHIFT + ALT + W

$e::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("e")
    } Else {
        LastHero.unitMove()
    }
return ; E
$+e:: LastHero.useMainSpell() return ; SHIFT + E
$^e:: LastHero.useSecondarySpell() return ; CTRL + E
$^!e:: LastHero.useThirdSpell() return ; CTRL + ALT + E
$^+e:: LastHero.useUltimate() return ; CTRL + SHIFT + E
$!e:: LastHero.bindOneOrMany() return ; ALT + E
$+!e:: LastHero.bindManyToMany() return ; SHIFT + ALT + E

$r:: ; R
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("r")
    } Else {
        MainHero.unitMove()
        SecondaryHero.unitMove()
        LastHero.unitMove()
    }
return

$+r:: ; SHIFT + R
    MainHero.useMainSpell()
    Sleep, 50
    SecondaryHero.useMainSpell()
    Sleep, 50
    LastHero.useMainSpell()
return

$^r:: ; CTRL + R
    MainHero.heroLvlUp()
    SecondaryHero.heroLvlUp()
    LastHero.heroLvlUp()
return

;----------------------------------------Armys

$a:: 
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("a")
    } Else {
        ArmyOne.unitMove()
    }
return ; A
$+a:: ArmyOne.unitMove("attack") return ; SHIFT + A
$!a:: ArmyOne.bindOneOrMany() return ; ALT + A
$+!a:: ArmyOne.bindManyToMany() return ; SHIFT + ALT + A

$s::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("s")
    } Else {
        ArmyTwo.unitMove()
    }
return ; S
$+s:: ArmyTwo.unitMove("attack") return ; SHIFT + S
$!s:: ArmyTwo.bindOneOrMany() return ; ALT + S
$+!s:: ArmyTwo.bindManyToMany() return ; SHIFT + ALT + S

$d::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("d")
    } Else {
        ArmyThree.unitMove()
    }
return ; D
$+d:: ArmyThree.unitMove("attack") return ; SHIFT + D
$!d:: ArmyThree.bindOneOrMany() return ; ALT + D
$+!d:: ArmyThree.bindManyToMany() return ; SHIFT + ALT + D

$f:: ; F
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("f")
    } Else {
        ArmyOne.unitMove()
        ArmyTwo.unitMove()
        ArmyThree.unitMove()
    }
return

$+f:: ; SHIFT + F
    ArmyOne.unitMove("attack")
    ArmyTwo.unitMove("attack")
    ArmyThree.unitMove("attack")
return

;----------------------------------------Builders
$z::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("z")
    } Else {
        BuilderEntity.startBuilding()
    }
return ; Z

steps := 1

; $tab::
;     If (BuilderEntity.builderModeState()) {
;         BuilderEntity.selectNextBuild()
;     }
; return ; TAB

$x::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("x")
    } Else {
        BuildersGroup.unitMove()
    }
return ; X

$!x:: BuildersGroup.bindOneOrMany() return ; ALT + X
$+!x:: BuildersGroup.bindManyToMany() return ; SHIFT + ALT + X

; WheelUp:: BuilderEntity.scrollBuildings(1) return ; MouseWhellUP
; WheelDown:: BuilderEntity.scrollBuildings(-1) return ; MouseWhellDown

;----------------------------------------Buildings

$c::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("c")
    } Else {
        BuildingsEntity.toggleBuildings()
    }
return ; C
$!c:: BuildingsEntity.bindOneOrMany() return ; ALT + C

$v::
    If (BuilderEntity.builderModeState()) {
        BuilderEntity.buildBuilding("v")
    }
return ; C
;----------------------------------------Globals

~RButton:: ; RIGHT CLICK
    BuilderEntity.endBuilding()
Return

+Esc::Reload ; SHIFT + ESC
^Esc::ExitApp ; CTRL + ESC
