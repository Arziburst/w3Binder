global builderModeOn := false
global actualBuilding := 1

class BuilderMode {
    __New(bindKey) {
        this.bindKey := bindKey
        this.buildings := ["z", "g", "v", "r", "c", "h", "n", "a"] ; "t", "s", "b"
    }

    selectBuildersGroup() {
        Send, % this.bindKey
    }

    pickBuilding() {
        Send, {Esc}
        Send, b
        Send % this.buildings[actualBuilding]
    }

    startBuilding() {
        this.selectBuildersGroup()
        this.pickBuilding()
        builderModeOn := true
    }

    scrollBuildings(argument) {
        If (builderModeOn = false) {
            return
        }

        buildingsArrayLength := this.buildings.Length()
        actualBuilding := actualBuilding + argument

        If (actualBuilding >= buildingsArrayLength) {
            actualBuilding := 1
        }

        If (actualBuilding <= 0) {
            actualBuilding := buildingsArrayLength
        }

        this.pickBuilding()
    }
}
