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
    }

    nextStep() {
        indexOfSelectedKeyBind := this.ArrayIndexOf(this.buildingsBinds, this.selectedKeyBind)
        nextKeyIndex := indexOfSelectedKeyBind + 1

        if (nextKeyIndex > this.buildingsBinds.Length()) {
            nextKeyIndex := 1
        }

        this.selectedKeyBind := this.buildingsBinds[nextKeyIndex]
    }

    bindOneOrMany() {
        If (this.selectedKeyBind = false) {
            this.selectedKeyBind := this.buildingsBinds[1]
        } else {
            this.nextStep()
        }

        selectedKB := this.selectedKeyBind

        Send, ^{Click}
        Send, ^%selectedKB%
    }

    toggleBuildings() {
        If (this.selectedKeyBind = false) {
            return
        }

        this.nextStep()

        Send, % this.selectedKeyBind
    }
}
