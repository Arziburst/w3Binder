;----------------------------------------Imports

#Include, ./src/unit.ahk
#Include, ./src/unitData.ahk
#Include, ./src/tools.ahk

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

;----------------------------------------Heroes

F1:: MainHero.unitMove() return
+F1:: MainHero.useMainSpell() return
^F1:: MainHero.useSecondarySpell() return
!F1:: MainHero.useItem() return
F14:: MainHero.bindOneOrMany() return

F2:: SecondaryHero.unitMove() return
+F2:: SecondaryHero.useMainSpell() return
^F2:: SecondaryHero.useSecondarySpell() return
!F2:: SecondaryHero.useItem() return
F15:: SecondaryHero.bindOneOrMany() return

F3:: LastHero.unitMove() return
+F3:: LastHero.useMainSpell() return
^F3:: LastHero.useSecondarySpell() return
!F3:: LastHero.useItem() return
F16:: LastHero.bindOneOrMany() return

F5::
    MainHero.unitMove()
    SecondaryHero.unitMove()
    LastHero.unitMove()
return

+F5::
    MainHero.useMainSpell()
    Sleep, 50
    SecondaryHero.useMainSpell()
    Sleep, 50
    LastHero.useMainSpell()
return

!F5::
    MainHero.useItem()
    Sleep, 50
    SecondaryHero.useItem()
    Sleep, 50
    LastHero.useItem()
return

F10::
    MainHero.heroLvlUp()
    SecondaryHero.heroLvlUp()
    LastHero.heroLvlUp()
return

;----------------------------------------Armys

F6:: ArmyOne.unitMove() return
+F6:: ArmyOne.unitMove("attack") return
F17:: ArmyOne.bindOneOrMany() return
+F17:: ArmyOne.bindOneToMany() return
^F17:: ArmyOne.bindManyToMany() return

F7:: ArmyTwo.unitMove() return
+F7:: ArmyTwo.unitMove("attack") return
F18:: ArmyTwo.bindOneOrMany() return
+F18:: ArmyTwo.bindOneToMany() return
^F18:: ArmyTwo.bindManyToMany() return

F8:: ArmyThree.unitMove() return
+F8:: ArmyThree.unitMove("attack") return
F19:: ArmyThree.bindOneOrMany() return
+F19:: ArmyThree.bindOneToMany() return
^F19:: ArmyThree.bindManyToMany() return

F9::
    ArmyOne.unitMove()
    ArmyTwo.unitMove()
    ArmyThree.unitMove()
return

+F9::
    ArmyOne.unitMove("attack")
    ArmyTwo.unitMove("attack")
    ArmyThree.unitMove("attack")
return

;----------------------------------------Buildings

F12::
    toggleBuildingsByBind() ; ./src/tools.ahk
return

F20::
    BuildingOne.bindOneOrMany()
    buildingBindChecker(BuildingOne.bindKey) ; ./src/tools.ahk
return

F21::
    BuildingTwo.bindOneOrMany()
    buildingBindChecker(BuildingTwo.bindKey) ; ./src/tools.ahk
return

F22::
    BuildingThree.bindOneOrMany()
    buildingBindChecker(BuildingThree.bindKey) ; ./src/tools.ahk
return
; ----------------------------------------------

; F11::
; return


; F13::
; return

; !Esc::
; return


+Esc::Reload
^Esc::ExitApp
