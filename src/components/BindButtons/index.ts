// Bus
import { reduxConfig } from '../../bus/config';

// Components
import { searchAndAutoComplete } from '..';

// Styles
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

    const buttonSaveConfig = document.querySelector('#buttonSaveConfig');

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
        && buttonSaveConfig
    )) {
        console.log('no such document.querySelector main && buttonQ && buttonW ...');

        return;
    }

    const buttons = [
        {
            element:    buttonQ,
            bindButton: 'q',
        },
        {
            element:    buttonW,
            bindButton: 'w',
        },
        {
            element:    buttonE,
            bindButton: 'e',
        },
        {
            element:    buttonA,
            bindButton: 'a',
        },
        {
            element:    buttonS,
            bindButton: 's',
        },
        {
            element:    buttonD,
            bindButton: 'd',
        },
    ];

    buttons.forEach((objectButton: any) => {
        objectButton.element.addEventListener('click', () => {
            main.innerHTML = templateSelectConfigForButton();

            searchAndAutoComplete(objectButton.bindButton);
        });
    });

    buttonSaveConfig.addEventListener('click', () => {
        const { config } = reduxConfig();
        alert(JSON.stringify(config));
    });
};
