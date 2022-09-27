// Core
import { searchAndAutoComplete } from '../../pages';
import './index.scss';

const template = require('../../pages/selectConfigForButton/index.handlebars');

window.addEventListener('load', () => {
    const main =  document.querySelector('#main');

    const buttonQ =  document.querySelector('#buttonQ');
    const buttonW =  document.querySelector('#buttonW');
    const buttonE =  document.querySelector('#buttonE');
    const buttonA =  document.querySelector('#buttonA');
    const buttonS =  document.querySelector('#buttonS');
    const buttonD =  document.querySelector('#buttonD');
    const buttonZ =  document.querySelector('#buttonZ');
    const buttonX =  document.querySelector('#buttonX');
    const buttonC =  document.querySelector('#buttonC');

    if (!(
        main
        && buttonQ
        && buttonW
        && buttonE
        && buttonA
        && buttonS
        && buttonD
        && buttonZ
        && buttonX
        && buttonC
    )) {
        console.log('no such document.querySelector');

        return;
    }

    const buttons = [
        {
            element: buttonQ,
        },
        {
            element: buttonW,
        },
        {
            element: buttonE,
        },
        {
            element: buttonA,
        },
        {
            element: buttonS,
        },
        {
            element: buttonD,
        },
    ];

    buttons.forEach((button: any) => {
        button.element.addEventListener('click', () => {
            main.innerHTML = template();

            searchAndAutoComplete();
        });
    });
});
