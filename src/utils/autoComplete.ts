// Types
type AutoComplete = {
    inp: any
    arr: Array<any>
    selectItemCallback: Function
}
type CloseAllLists = {
    elmnt?: any
}

export const autoComplete = ({ inp, arr, selectItemCallback }: AutoComplete) => {
    let currentFocus: any = null;

    const closeAllLists = ({ elmnt }: CloseAllLists) => {
        const x: any = document.getElementsByClassName('autocomplete-items');
        for (let i = 0; i < x.length; i++) {
            if (elmnt !== x[ i ] && elmnt !== inp) {
                x[ i ].parentNode.removeChild(x[ i ]);
            }
        }
    };

    const removeActive = (x: any) => {
        for (let i = 0; i < x.length; i++) {
            x[ i ].classList.remove('autocomplete-active');
        }
    };

    const addActive = (x: any) => {
        if (!x) {
            return;
        }
        removeActive(x);
        if (currentFocus >= x.length) {
            currentFocus = 0;
        }
        if (currentFocus < 0) {
            currentFocus = x.length - 1;
        }
        x[ currentFocus ].classList.add('autocomplete-active');
    };

    inp.addEventListener('input', () => {
        let a: HTMLElement | null = null;
        let val = inp.value;

        closeAllLists({});
        if (!val) {
            return;
        }
        currentFocus = -1;

        a = document.createElement('div');
        a.setAttribute('id', 'autocomplete-list');
        a.setAttribute('class', 'autocomplete-items');

        inp.parentNode.appendChild(a);

        for (let i = 0; i < arr.length; i++) {
            if (arr[ i ].substr(0, val.length).toUpperCase() === val.toUpperCase()) {
                const b = document.createElement('div');
                b.innerHTML = '<strong>' + arr[ i ].substr(0, val.length) + '</strong>';
                b.innerHTML += arr[ i ].substr(val.length);
                b.innerHTML += '<input type=\'hidden\' value=\'' + arr[ i ] + '\'>';
                b.addEventListener('click', function() {
                    const selectedValue = this.getElementsByTagName('input')[ 0 ].value;
                    inp.value = selectedValue;
                    selectItemCallback(selectedValue);
                    closeAllLists({});
                });
                a.appendChild(b);
            }
        }
    });

    document.addEventListener('click', function (event: any) {
        closeAllLists(event.target);
    });

    inp.addEventListener('keydown', function(event: any) {
        let x: any = document.getElementById(inp.id + 'autocomplete-list');
        if (x) {
            x = x.getElementsByTagName('div');
        }
        if (event.keyCode === 40) {
            // eslint-disable-next-line no-plusplus
            currentFocus++;
            addActive(x);
        } else if (event.keyCode === 38) { //up
            // eslint-disable-next-line no-plusplus
            currentFocus--;
            addActive(x);
        } else if (event.keyCode === 13) {
            event.preventDefault();
            if (currentFocus > -1) {
                if (x) {
                    x[ currentFocus ].click();
                }
            }
        }
    });
};
