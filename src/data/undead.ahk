class heroOneData {
    static bindKey := 1
    static spells := ["c", "e", "u", "d"] ; DK
    static upgradePriority := ["c", "u", "d", "e"]
    static combo := { key: "c", isClick: true }
}

class heroTwoData {
    static bindKey := 2
    static spells := ["n", "f", "r", "d"] ; Leech
    static upgradePriority := ["n", "f", "d", "r"]
    static combo := { key: "n", isClick: true }
}

class heroThreeData {
    static bindKey := 3
    static spells := ["c", "e", "v", "n"] ; Demon
    static upgradePriority := ["n", "c", "v", "e"]
    static combo := { key: "c", isClick: true }
}

class armyOneData {
    static bindKey := 4
    static spells := [ "d", "o", false, "b" ] ; Sphinx
}

class armyTwoData {
    static bindKey := 5
    static spells := [ "r", "u", "c", false ] ; Necromant
}

class armyThreeData {
    static bindKey := 6
    static spells := [ "c", "n", "o", false ] ; Banshee
}

class buildingsData {
    static buildingsBinds := [ 7, 8, 9 ]
}

class buildersData {
    static bindKey := 0
    static spells := [ false, "u", false, "c" ]
    static buildings := [ "n", "c", "g", "v", "z", "a", "t", "h", "s", "b", "r" ]
}