class Buildings {
    __New(options) {
        this.selectedKeyBind := false
        this.buildingsBinds := options.buildingsBinds
    }

    _ArrayIndexOf(arr, item) {
        for i, val in arr {
            if (val = item) {
                return i
            }
        }
    }

    _nextStep() {
        indexOfSelectedKeyBind := this._ArrayIndexOf(this.buildingsBinds, this.selectedKeyBind)
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
            this._nextStep()
        }

        selectedKB := this.selectedKeyBind

        Send, ^{Click}
        Send, ^%selectedKB%
    }

    toggleBuildings() {
        If (this.selectedKeyBind = false) {
            return
        }

        this._nextStep()

        Send, % this.selectedKeyBind
    }
}
