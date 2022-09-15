class heroOneData {
    static bindKey := 1
    static spells := ["c", "e", "u", "d"]
    static upgradePriority := ["c", "u", "d", "e"]
    static comboKey := "c"
}

class heroTwoData {
    static bindKey := 2
    static spells := ["n", "f", "r", "d"]
    static upgradePriority := ["n", "f", "d", "r"]
    static comboKey := "n"
}

class heroThreeData {
    static bindKey := 3
    static spells := ["c", "e", "v", "n"]
    static upgradePriority := ["n", "c", "v", "e"]
    static comboKey := "c"
}

class armyOneData {
    static bindKey := 4
}

class armyTwoData {
    static bindKey := 5
}

class armyThreeData {
    static bindKey := 6
}

class buildingsData {
    static buildingsBinds := [ 7, 8, 9 ]
}

class buildersData {
    static bindKey := 0
    ; static buildings := [ "h", "b", "m", "w", "o", "a", "s", "e", "t", "v" ] ; Horde
    static buildings := [ "n", "c", "g", "v", "z", "a", "t", "h", "s", "b", "r" ] ; Undead
}