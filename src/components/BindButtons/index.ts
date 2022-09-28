// Core
import { searchAndAutoComplete } from '..';
import './index.scss';

const templateSelectConfigForButton = require('../../components/selectConfigForButton/index.handlebars');

export const bindButtonsAddEventListener = () => {
    const main = document.querySelector('#main');

    const buttonQ = document.querySelector('#buttonQ');
    const buttonW = document.querySelector('#buttonW');
    const buttonE = document.querySelector('#buttonE');
    const buttonA = document.querySelector('#buttonA');
    const buttonS = document.querySelector('#buttonS');
    const buttonD = document.querySelector('#buttonD');
    const buttonZ = document.querySelector('#buttonZ');
    const buttonX = document.querySelector('#buttonX');
    const buttonC = document.querySelector('#buttonC');

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
        console.log('no such document.querySelector main && buttonQ && buttonW ...');
        console.log(buttonQ);

        return;
    }

    const buttons = [
        {
            element: buttonQ,
            text:    'q',
        },
        {
            element: buttonW,
            text:    'w',
        },
        {
            element: buttonE,
            text:    'e',
        },
        {
            element: buttonA,
            text:    'a',
        },
        {
            element: buttonS,
            text:    's',
        },
        {
            element: buttonD,
            text:    'd',
        },
    ];

    buttons.forEach((objectButton: any) => {
        objectButton.element.addEventListener('click', () => {
            console.log('text');
            main.innerHTML = templateSelectConfigForButton();

            searchAndAutoComplete(objectButton.text);
        });
    });
};
