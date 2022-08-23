;----------------------------------------Imports

#Include, ./src/unit.ahk
#Include, ./src/unitData.ahk
#Include, ./src/tools.ahk
#Include, ./src/builderMode.ahk

;----------------------------------------Instances

; ./src/unitData.ahk, ./src/unit.ahk
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
BuilderTech := new BuilderMode(BuildersGroup.bindKey)

;----------------------------------------Heroes

F1:: MainHero.unitMove() return ; Q
+F1:: MainHero.useMainSpell() return ; Shift + Q
^F1:: MainHero.useSecondarySpell() return ; Ctrl + Q
!F1:: MainHero.useItem() return ; Alt + Q
F14:: MainHero.bindOneOrMany() return

F2:: SecondaryHero.unitMove() return ; W
+F2:: SecondaryHero.useMainSpell() return ; Shift + W
^F2:: SecondaryHero.useSecondarySpell() return ; Ctrl + W
!F2:: SecondaryHero.useItem() return ; Alt + W
F15:: SecondaryHero.bindOneOrMany() return

F3:: LastHero.unitMove() return ; E
+F3:: LastHero.useMainSpell() return ; Shift + E
^F3:: LastHero.useSecondarySpell() return ; Ctrl + E
!F3:: LastHero.useItem() return ; Alt + E
F16:: LastHero.bindOneOrMany() return

F5:: ; R
    MainHero.unitMove()
    SecondaryHero.unitMove()
    LastHero.unitMove()
return

+F5:: ; Shift + R
    MainHero.useMainSpell()
    Sleep, 50
    SecondaryHero.useMainSpell()
    Sleep, 50
    LastHero.useMainSpell()
return

!F5:: ; Alt + R
    MainHero.useItem()
    Sleep, 50
    SecondaryHero.useItem()
    Sleep, 50
    LastHero.useItem()
return

F10:: ; Z
    MainHero.heroLvlUp()
    SecondaryHero.heroLvlUp()
    LastHero.heroLvlUp()
return

;----------------------------------------Armys

F6:: ArmyOne.unitMove() return ; A
+F6:: ArmyOne.unitMove("attack") return ; Shift + A
F17:: ArmyOne.bindManyToMany() return

F7:: ArmyTwo.unitMove() return ; S
+F7:: ArmyTwo.unitMove("attack") return ; Shift + S
F18:: ArmyTwo.bindManyToMany() return

F8:: ArmyThree.unitMove() return ; D
+F8:: ArmyThree.unitMove("attack") return ; Shift + D
F19:: ArmyThree.bindManyToMany() return

F9:: ; F
    ArmyOne.unitMove()
    ArmyTwo.unitMove()
    ArmyThree.unitMove()
return

+F9:: ; Shift + F
    ArmyOne.unitMove("attack")
    ArmyTwo.unitMove("attack")
    ArmyThree.unitMove("attack")
return

;----------------------------------------Builders
; ./src/builderMode.ahk
F11:: BuildersGroup.unitMove() return ; X
F21:: BuildersGroup.bindOneOrMany() return

+F11:: BuilderTech.startBuilding() return ; Shift + X
WheelUp:: BuilderTech.scrollBuildings(1) return
WheelDown:: BuilderTech.scrollBuildings(-1) return

;----------------------------------------Buildings

; ./src/tools.ahk
F12:: toggleBuildingsByBind() return ; C

F23::
    BuildingOne.bindOneOrMany()
    buildingBindChecker(BuildingOne.bindKey)
return

F24::
    BuildingTwo.bindOneOrMany()
    buildingBindChecker(BuildingTwo.bindKey)
return

+F24::
    BuildingThree.bindOneOrMany()
    buildingBindChecker(BuildingThree.bindKey)
return

; ;----------------------------------------Globals

~LButton::
    If (builderModeOn) {
        BuilderTech.pickBuilding()
    }
Return

~RButton::
    If (builderModeOn) {
        builderModeOn := false
    }
Return

+Esc::Reload
^Esc::ExitApp
