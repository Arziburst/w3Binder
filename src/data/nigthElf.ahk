class heroOneData {
    static bindKey := 1
    static spells := ["e", "f", "r", "t"] ; Deer
    static upgradePriority := ["t", "f", "e", "t"]
    static combo := { key: "e", isClick: true }
}

class heroTwoData {
    static bindKey := 2
    static spells := ["b", "l", "e", "t"] ; demon hunter
    static upgradePriority := ["t", "b", "e", "l"]
    static combo := { key: "b", isClick: true }
}

class heroThreeData {
    static bindKey := 3
    static spells := ["c", "r", "t", "f"] ; Moon priest
    static upgradePriority := ["r", "t", "f", "c"]
    static combo := false
}

class armyOneData {
    static bindKey := 4
    static spells := [ "r", "e", false, "f" ] ; Druid bear
}

class armyTwoData {
    static bindKey := 5
    static spells := [ "t", "w", false, false ] ; Gigants
}

class armyThreeData {
    static bindKey := 6
    static spells := [ "r", "c", false, "f" ] ; Druids crowns
}

class buildingsData {
    static buildingsBinds := [ 7, 8, 9 ]
}

class buildersData {
    static bindKey := 0
    static spells := [ false, "d", false, false ]
    static buildings := [ "t", "r", "h", "p", "m", "a", "l", false, "w", "c", "d" ]
}