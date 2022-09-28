; To Js
setConfigToJs() {
	window := getWindow()

	FileRead,cofigJson,./w3binder.config.json

	window.setConfig(cofigJson)
}

setConfig(newReduxJsonconfig := false) {
    If (newReduxJsonconfig) {
        ; FileWrite,newReduxJsonconfig,cofigJson,./w3binder.config.json
    }

    FileRead,cofigJson,./w3binder.config.json
    
    config := jsonToObject(cofigJson)

    isAutoMove := config.isAutoMove

    q := new Unit(config.q, isAutoMove)
    w := new Unit(config.w, isAutoMove)
    e := new Unit(config.e, isAutoMove)
    r := new Unit(config.r, isAutoMove)
    a := new Unit(config.a, isAutoMove)
    s := new Unit(config.s, isAutoMove)
    d := new Unit(config.d, isAutoMove)
    f := new Unit(config.f, isAutoMove)
    z := new Unit(config.z, isAutoMove)
    x := new Unit(config.x, isAutoMove)
    c := new Unit(config.c, isAutoMove)
    v := new Unit(config.v, isAutoMove)
    b := new Unit(config.b, isAutoMove)

    builderMode := new BuilderMode(config.b.bindKey, config.b.buldings)

    units := [ q, w, e, r, a, s, d, f, z, x, c, v, b ]

    core := new Core(units, builderMode)

    global core := core
    global builderMode := builderMode
}

; From Js
setConfigFromJS(reduxConfig := false) {
	; javascript write redux to json and pass to ahk
	; ahk write json to file system as w3binder.config.json
	; ahk reed config file and set new bids

	If (reduxConfig) {
		setConfig(reduxConfig)
	}
}