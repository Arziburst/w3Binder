// Bus
import { reduxConfig } from '../../bus/config';

// Templates
const templateSelectConfigForButton = require('../../pages/SelectConfigForButton/index.handlebars');

// Pages
import { selectConfigForButton } from '../../pages';

// Styles
import './index.scss';

// Types
import { BindButtons } from '../../bus/config/types';
import { reduxSelectBindButton } from '../../bus/client/selectBindButton';
type Buttons = Array<{
    element: Element,
    key: BindButtons,
    bindKey: number
}>
// eslint-disable-next-line init-declarations
declare const AHK: any;

export const bindButtonsAddEventListener = () => {
    const main = document.querySelector('#main');

    const buttonQ = document.querySelector('#buttonQ');
    const buttonW = document.querySelector('#buttonW');
    const buttonE = document.querySelector('#buttonE');
    // const buttonR = document.querySelector('#buttonR');  // todo
    const buttonA = document.querySelector('#buttonA');
    const buttonS = document.querySelector('#buttonS');
    const buttonD = document.querySelector('#buttonD');
    // const buttonF = document.querySelector('#buttonF');  // todo
    const buttonZ = document.querySelector('#buttonZ');
    const buttonX = document.querySelector('#buttonX');
    const buttonC = document.querySelector('#buttonC');
    // const buttonV = document.querySelector('#buttonV');  // todo

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

    const buttons: Buttons = [
        {
            element: buttonQ,
            key:     'q',
            bindKey: 1,
        },
        {
            element: buttonW,
            key:     'w',
            bindKey: 2,
        },
        {
            element: buttonE,
            key:     'e',
            bindKey: 3,
        },
        // { // todo
        //     element:    buttonR,
        //     key: 'r',
        //     bindKey:    0,
        // },
        {
            element: buttonA,
            key:     'a',
            bindKey: 4,
        },
        {
            element: buttonS,
            key:     's',
            bindKey: 5,
        },
        {
            element: buttonD,
            key:     'd',
            bindKey: 6,
        },
        // { // todo
        //     element:    buttonF,
        //     key: 'f',
        //     bindKey:    0,
        // },
        {
            element: buttonZ,
            key:     'z',
            bindKey: 7,
        },
        {
            element: buttonX,
            key:     'x',
            bindKey: 8,
        },
        {
            element: buttonC,
            key:     'c',
            bindKey: 9,
        },
        // { // todo
        //     element:    buttonV,
        //     key: 'v',
        //     bindKey:    0,
        // },
    ];

    buttons.forEach((objectButton) => {
        objectButton.element.addEventListener('click', () => {
            main.innerHTML = templateSelectConfigForButton();

            reduxSelectBindButton().setSelectBindButton({ key: objectButton.key, bindKey: objectButton.bindKey });

            selectConfigForButton();
        });
    });

    // Save config and send config to AHK
    buttonSaveConfig.addEventListener('click', () => {
        const { config } = reduxConfig();
        const stringifiedConfig = JSON.stringify(config);

        AHK('setConfigFromJS', stringifiedConfig);
    });
};
