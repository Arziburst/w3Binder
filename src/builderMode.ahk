class BuilderMode {
    builderMode := false

    __New(options) {
        this.bindKey := options.bindKey
        this.buildings := options.buildings
    }

    builderModeState() {
        return this.builderMode
    }

    selectBuildersGroup() {
        Send, % this.bindKey
    }

    continueBuilding() {
        ; Send, {Esc}
        Send, b
    }

    startBuilding() {
        this.builderMode := true
        this.selectBuildersGroup()
        this.continueBuilding()
    }

    endBuilding() {
        this.builderMode := false
    }

    ; scrollBuildings(step) {
    ;     If (this.builderMode = false) {
    ;         return
    ;     }

    ;     buildingsArrayLength := this.buildings.Length()
    ;     this.actualBuilding := this.actualBuilding + step

    ;     If (this.actualBuilding >= buildingsArrayLength) {
    ;         this.actualBuilding := 1
    ;     }

    ;     If (this.actualBuilding <= 0) {
    ;         this.actualBuilding := buildingsArrayLength
    ;     }

    ;     this.continueBuilding()
    ; }
}
