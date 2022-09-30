// Bus
import { reduxSelectBindButton } from '../../bus/client/selectBindButton';
import { reduxConfig } from '../../bus/config';

// Templates
const templateSelectConfigForButton = require('../../pages/SelectConfigForButton/index.handlebars');

// Pages
import { selectConfigForButton } from '../../pages';

// Styles
import './index.scss';

// Types
import { BindButtons } from '../../bus/config/types';
type Buttons = Array<{
    element: Element | null,
    key: BindButtons,
    bindKey: number
}>
// eslint-disable-next-line init-declarations
declare const AHK: any;

export const bindButtonsAddEventListener = () => {
    const main = document.querySelector('#main');
    const buttonIsAutoMove = document.querySelector('#buttonIsAutoMove');

    const buttonSaveConfig = document.querySelector('#buttonSaveConfig');

    if (!(
        main
        && buttonSaveConfig
        && buttonIsAutoMove
    )) {
        console.log('no such document.querySelector main && buttonQ && buttonW ...');

        return;
    }

    const buttons: Buttons = [
        {
            element: document.querySelector('#buttonQ'),
            key:     'q',
            bindKey: 1,
        },
        {
            element: document.querySelector('#buttonW'),
            key:     'w',
            bindKey: 2,
        },
        {
            element: document.querySelector('#buttonE'),
            key:     'e',
            bindKey: 3,
        },
        // { // todo
        //     element:    document.querySelector('#buttonR'),
        //     key: 'r',
        //     bindKey:    0,
        // },
        {
            element: document.querySelector('#buttonA'),
            key:     'a',
            bindKey: 4,
        },
        {
            element: document.querySelector('#buttonS'),
            key:     's',
            bindKey: 5,
        },
        {
            element: document.querySelector('#buttonD'),
            key:     'd',
            bindKey: 6,
        },
        // { // todo
        //     element:    document.querySelector('#buttonF'),
        //     key: 'f',
        //     bindKey:    0,
        // },
        {
            element: document.querySelector('#buttonZ'),
            key:     'z',
            bindKey: 7,
        },
        {
            element: document.querySelector('#buttonX'),
            key:     'x',
            bindKey: 8,
        },
        {
            element: document.querySelector('#buttonC'),
            key:     'c',
            bindKey: 9,
        },
        // { // todo
        //     element:    document.querySelector('#buttonV'),
        //     key: 'v',
        //     bindKey:    0,
        // },
    ];

    buttons.forEach((objectButton) => {
        objectButton.element && objectButton.element.addEventListener('click', () => {
            main.innerHTML = templateSelectConfigForButton();

            reduxSelectBindButton().setSelectBindButton({ key: objectButton.key, bindKey: objectButton.bindKey });

            selectConfigForButton();
        });
    });

    if (reduxConfig().config.isAutoMove === true) {
        buttonIsAutoMove.setAttribute('checked', 'checked');
    }
    buttonIsAutoMove.addEventListener('click', () => {
        const { config, setConfig } = reduxConfig();
        setConfig({ type: 'isAutoMove', value: !config.isAutoMove });
    });


    // Save config and send config to AHK
    buttonSaveConfig.addEventListener('click', () => {
        const { config } = reduxConfig();
        const stringifiedConfig = JSON.stringify(config);

        AHK('setConfigFromJS', stringifiedConfig);
    });
};
