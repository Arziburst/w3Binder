; Constants
image2 := "https://static.wikia.nocookie.net/wowpedia/images/5/5f/BTNHeroDeathKnight-Reforged.png/revision/latest?cb=20210508061720"
image1 := "https://static.wikia.nocookie.net/wowpedia/images/c/c7/BTNHeroLich-Reforged.png/revision/latest?cb=20210508062320"
image3 := "https://static.wikia.nocookie.net/wowpedia/images/0/05/BTNHeroDreadLord-Reforged.png/revision/latest?cb=20210508062247"

Gui, Main:+AlwaysOnTop

Gui, Main:Add, ActiveX, w156 h156, % "mshtml:<img src='" image2 "' />"
Gui, Main:Add, ActiveX, w156 h156, % "mshtml:<img src='" image1 "' />"
Gui, Main:Add, ActiveX, w156 h156, % "mshtml:<img src='" image3 "' />"

Gui, Main:Add, Text,, Please enter your name:
Gui, Main:Add, Edit, vName
Gui, Main:Add, Button, Default w80, OK

global isMainGuiExist := false

toggleMainGui() {
    If (isMainGuiExist) {
        Gui, Main:Hide
        isMainGuiExist := false
    } else {
        Gui, Main:Show
        isMainGuiExist := true
    }
}