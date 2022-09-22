const data = [];

function normal_js_function(s) {
    alert("hello from javascript alone.");
}
function my_js_and_ahk_function(a, b) {
    // let AHK do the calculation instead of javascript
    var result = AHK('ahkToJs', a, b);
    alert('AHK + js: ' + result);
}