// Bus
import { reduxSelectBindButton } from '../../bus/client/selectBindButton';
import { reduxConfig } from '../../bus/config';

// Templates
const templateSelectConfigForButton = require('../../pages/SelectConfigForButton/index.handlebars');
const templateBindButtons = require('./index.handlebars');
const templateAreaForText = require('./areaForText.handlebars');

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

const groupUnitsInOneButton = (
    { button, units, text }: { button: Element | null, units: Array<any>, text: string },
) => {
    if (button) {
        const filteredUnits = units.filter((unit) => unit !== false);

        if (filteredUnits.length === 1 && filteredUnits[ 0 ]) {
            button.innerHTML = `<img class="bind_buttons_button__img" src="${filteredUnits[ 0 ].unitImgUrl}" alt="Image ${filteredUnits[ 0 ].unitName}">${templateAreaForText({ text: text.toUpperCase() })}`;
        }
        if (filteredUnits.length === 2) {
            button.innerHTML = filteredUnits.map((unit) => {
                if (unit) {
                    return `<span class="bind_buttons_button__img bind_buttons_button__two_img" style="background-image: url(${unit.unitImgUrl});"></span>`;
                }

                return '';
            }).join('') + templateAreaForText({ text: text.toUpperCase() });
        }
        if (filteredUnits.length === 3) {
            button.innerHTML = filteredUnits.map((unit) => {
                if (unit) {
                    return `<span class="bind_buttons_button__img bind_buttons_button__three_img" style="background-image: url(${unit.unitImgUrl});"></span>`;
                }

                return '';
            }).join('') + templateAreaForText({ text: text.toUpperCase() });
        }
    }
};

export const bindButtonsAddEventListener = () => {
    const main = document.querySelector('#main');
    const bindButtons = document.querySelector('#bindButtons');
    const buttonIsAutoMove = document.querySelector('#buttonIsAutoMove');

    const buttonSaveConfig = document.querySelector('#buttonSaveConfig');

    if (!(
        main
        && bindButtons
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
    ];

    const config = reduxConfig().config;
    groupUnitsInOneButton({ button: document.querySelector('#buttonR'), units: [ config.q, config.w, config.e ], text: 'r' });
    groupUnitsInOneButton({ button: document.querySelector('#buttonF'), units: [ config.a, config.s, config.d ], text: 'f' });
    groupUnitsInOneButton({ button: document.querySelector('#buttonV'), units: [ config.z, config.x, config.c ], text: 'v' });


    buttons.forEach((objectButton) => {
        const key: any = objectButton.key;

        objectButton.element && objectButton.element.addEventListener('click', () => {
            main.innerHTML = templateSelectConfigForButton();

            reduxSelectBindButton().setSelectBindButton({ key: key, bindKey: objectButton.bindKey });

            selectConfigForButton();
        });
        const qs = document.querySelector(`#buttonRemoveUnitFrom${objectButton.key.toUpperCase()}`);

        if (!qs) {
            return;
        }

        qs.addEventListener('click', () => {
            reduxConfig().setConfig({ type: key, value: false });
            bindButtons.innerHTML = `${templateBindButtons({ config: reduxConfig().config })}`;
            bindButtonsAddEventListener();
        });
    });

    // Toggler move
    if (reduxConfig().config.isAutoMove === true) {
        buttonIsAutoMove.setAttribute('checked', 'checked');
    }
    buttonIsAutoMove.addEventListener('click', () => {
        const { config, setConfig } = reduxConfig();
        setConfig({ type: 'isAutoMove', value: !config.isAutoMove });
    });


    // Save config and send config to AHK
    buttonSaveConfig.addEventListener('click', () => {
        const stringifiedConfig = JSON.stringify(reduxConfig().config);

        AHK('setConfigFromJS', stringifiedConfig);
        alert('Your config was save!');
    });
};
