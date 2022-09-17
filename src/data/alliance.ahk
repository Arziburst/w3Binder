class heroOneData {
    static bindKey := 1
    static spells := ["b", "w", "r", "t"] ; Archmage
    static upgradePriority := ["w", "r", "t", "b"]
    static combo := false
}

class heroTwoData {
    static bindKey := 2
    static spells := ["t", "c", "b", "v"] ; Mount king
    static upgradePriority := ["t", "b", "v", "c"]
    static combo := { key: "t", isClick: true }
}

class heroThreeData {
    static bindKey := 3
    static spells := ["t", "d", "v", "r"] ; Paladin
    static upgradePriority := ["r", "t", "d", "v"]
    static combo := { key: "t", isClick: true }
}

class armyOneData {
    static bindKey := 4
    static spells := [ "e", "c", false, false ] ; Dracondor
}

class armyTwoData {
    static bindKey := 5
    static spells := [ "e", "d", "f", false ] ; Priests
}

class armyThreeData {
    static bindKey := 6
    static spells := [ "w", "i", "o", false ] ; Mages
}

class buildingsData {
    static buildingsBinds := [ 7, 8, 9 ]
}

class buildersData {
    static bindKey := 0
    static spells := [ false, "c", false, false ]
    static buildings := [ "h", "b", "l", "s", "f", "a", "r", "w", "t", "g", "v" ]
}