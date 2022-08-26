class Buildings {
    selectedKeyBind := false

    __New(options) {
        this.buildingsBinds := options.buildingsBinds
    }

    ArrayIndexOf(arr, item) {
        for i, val in arr {
            if (val = item) {
                return i
            }
        }

        return 1
    }

    nextStep() {
        indexOfSelectedKeyBind := this.ArrayIndexOf(this.buildingsBinds, this.selectedKeyBind)
        nextKeyIndex := indexOfSelectedKeyBind + 1

        if (nextKeyIndex > this.buildingsBinds.Length()) {
            nextKeyIndex := 1
        }

        this.selectedKeyBind := this.buildingsBinds[nextKeyIndex]

        return this.selectedKeyBind
    }

    bindOneOrMany() {
        selectedKB := ""

        If (this.selectedKeyBind = false) {
            this.selectedKeyBind := this.buildingsBinds[1]
            selectedKB := this.selectedKeyBind
        } else {
            selectedKB := this.nextStep()
        }

        Send, ^{Click}
        Send ^%selectedKB%
    }

    toggleBuildings() {
        If (this.selectedKeyBind = false) {
            return
        }

        selectedKB := this.nextStep()

        Send, %selectedKB%
    }
}
