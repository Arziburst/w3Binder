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
$q:: MainHero.unitMove() return
$+q:: MainHero.useMainSpell() return
$^q:: MainHero.useSecondarySpell() return
$!q:: MainHero.useItem() return

$1:: MainHero.bindOneOrMany() return
F14:: MainHero.bindOneOrMany() return

$w:: SecondaryHero.unitMove() return
$+w:: SecondaryHero.useMainSpell() return
$^w:: SecondaryHero.useSecondarySpell() return
$!w:: SecondaryHero.useItem() return

$2:: SecondaryHero.bindOneOrMany() return
F15:: SecondaryHero.bindOneOrMany() return

$e:: LastHero.unitMove() return
$+e:: LastHero.useMainSpell() return
$^e:: LastHero.useSecondarySpell() return
$!e:: LastHero.useItem() return

$3:: LastHero.bindOneOrMany() return
F16:: LastHero.bindOneOrMany() return

$r::
    MainHero.unitMove()
    SecondaryHero.unitMove()
    LastHero.unitMove()
return

$+r::
    MainHero.useMainSpell()
    Sleep, 50
    SecondaryHero.useMainSpell()
    Sleep, 50
    LastHero.useMainSpell()
return

$!r::
    MainHero.useItem()
    Sleep, 50
    SecondaryHero.useItem()
    Sleep, 50
    LastHero.useItem()
return

$z::
    MainHero.heroLvlUp()
    SecondaryHero.heroLvlUp()
    LastHero.heroLvlUp()
return

;----------------------------------------Armys

$a:: ArmyOne.unitMove() return
$+a:: ArmyOne.unitMove("attack") return
$4:: ArmyOne.bindOneOrMany() return
$+4:: ArmyOne.bindManyToMany() return

$s:: ArmyTwo.unitMove() return
$+s:: ArmyTwo.unitMove("attack") return
$5:: ArmyTwo.bindOneOrMany() return
$+5:: ArmyTwo.bindManyToMany() return

$d:: ArmyThree.unitMove() return ; D
$+d:: ArmyThree.unitMove("attack") return
$6:: ArmyThree.bindOneOrMany() return
$+6:: ArmyThree.bindManyToMany() return

$f::
    ArmyOne.unitMove()
    ArmyTwo.unitMove()
    ArmyThree.unitMove()
return

$+f::
    ArmyOne.unitMove("attack")
    ArmyTwo.unitMove("attack")
    ArmyThree.unitMove("attack")
return

;----------------------------------------Builders

$x:: BuildersGroup.unitMove() return
$7:: BuildersGroup.bindOneOrMany() return
$+7:: BuildersGroup.bindManyToMany() return

$+x:: BuilderEntity.startBuilding() return
WheelUp:: BuilderEntity.scrollBuildings(1) return
WheelDown:: BuilderEntity.scrollBuildings(-1) return

;----------------------------------------Buildings

$c:: BuildingsEntity.toggleBuildings() return
$8:: BuildingsEntity.bindOneOrMany() return

;----------------------------------------Globals

~LButton::
    If (BuilderEntity.builderModeState()) {
        Send, +{Click}
        BuilderEntity.continueBuilding()
    }
Return

~RButton::
    BuilderEntity.endBuilding()
Return

+Esc::Reload
^Esc::ExitApp
