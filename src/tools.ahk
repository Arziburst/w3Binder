global buildingsBindArray := []
global actualBuildingBind := ""

; ----------------------------------------------

buildingBindChecker(bindKey) {
    isBindExist := ""

    for key, buildingBindKey in buildingsBindArray {
        if (buildingBindKey = bindKey) {
            isBindExist := "Exist"
        }
    }

    If (isBindExist) {
        return
    }

    buildingsBindArray.Push(bindKey)
    actualBuildingBind := bindKey
}

; ----------------------------------------------

ArrayIndexOf(arr, item) {
    for i, val in arr {
        if (val = item) {
            return i
        }
    }

    return ""
}

; ----------------------------------------------

toggleBuildingsByBind() {
    If (actualBuildingBind = "") {
        return
    }

    indexOfBind := ArrayIndexOf(buildingsBindArray, actualBuildingBind)
    buildingsBindArrayLength := buildingsBindArray.Length()

    newIndexOfBind := indexOfBind + 1

    If (newIndexOfBind > buildingsBindArrayLength) {
        actualBuildingBind := buildingsBindArray[1]
    } else {
        actualBuildingBind := buildingsBindArray[newIndexOfBind]
    }

    Send, %actualBuildingBind%
}