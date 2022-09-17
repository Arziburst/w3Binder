class heroOneData {
    static bindKey := 1
    static spells := ["c", "f", "t", "e"] ; Farseer
    static upgradePriority := ["t", "c", "e", "f"]
    static combo := { key: "c", isClick: true }
}

class heroTwoData {
    static bindKey := 2
    static spells := ["e", "x", "w", "v"] ; Voodoo throll
    static upgradePriority := ["e", "x", "v", "w"]
    static combo := { key: "x", isClick: true }
}

class heroThreeData {
    static bindKey := 3
    static spells := ["w", "t", "e", "r"] ; Tauren
    static upgradePriority := ["t", "e", "r", "w"]
    static combo := { key: "w", isClick: true }
}

class armyOneData {
    static bindKey := 4
    ; static spells := [ "e", false, false, false ] ; Raider
    static spells := [ "w", "t", "e", false ] ; Witchdoctor
}

class armyTwoData {
    static bindKey := 5
    ; static spells := [ "b", false, false, false ] ; Berserk
    static spells := [ "g", "l", "b", false ] ; Shaman
}

class armyThreeData {
    static bindKey := 6
    static spells := [ "r", "d", "c", "f" ] ; Soultravaler
    ; static spells := [ "d", false, false, false ] ; Kodo
}

class buildingsData {
    static buildingsBinds := [ 7, 8, 9 ]
}

class buildersData {
    static bindKey := 0
    static spells := [ false, false, false, false ]
    static buildings := [ "h", "b", "m", "w", "o", "a", "s", "e", "t", "v" ]
}