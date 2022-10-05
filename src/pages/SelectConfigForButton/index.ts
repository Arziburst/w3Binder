// Bus
import { reduxConfig } from '../../bus/config';
import { reduxSelectBindButton } from '../../bus/client/selectBindButton';

// Utils
import {
    searchUnits,
    makeIdButtonUnit,
    filterRace,
} from '../../utils';

// Data
import { units } from '../../data/index';

// Templates
const templateRaces = require('../../components/Races/index.handlebars');
const templateBindButtons = require('../../components/BindButtons/index.handlebars');
const templateButtonUnit = require('../../components//ButtonUnit/index.handlebars');
const templateNoSuchData = require('../../components/NoSuchData/index.handlebars');

// Components
import {
    racesAddEventListenerOnIcons,
    bindButtonsAddEventListener,
    categories,
} from '../../components';

// Event
import { buttonBackToCategoriesEventClick } from '../../components/Categories/event';

// Styles
import './index.scss';

// Types
import { Neutral, Unit } from '../../bus/config/types';

export const addButtonsWithUnit = (value: string, units: Unit[]) => {
    const main = document.querySelector('#main');
    const contentAfterSearch = document.querySelector('#contentAfterSearch');

    if (!(main && contentAfterSearch)) {
        return;
    }

    if (value.length > 0) {
        const foundUnits: Unit[] = searchUnits({ input: value, units });

        if (foundUnits.length === 0) {
            contentAfterSearch.innerHTML = `${templateNoSuchData()}`;

            return;
        }

        contentAfterSearch.innerHTML = `${foundUnits.map((objectUnit) => templateButtonUnit(
            {
                id:         makeIdButtonUnit(objectUnit.unitName),
                unitName:   objectUnit.unitName,
                unitImgUrl: objectUnit.unitImgUrl,
            },
        )).join('')}`;

        foundUnits.forEach((objectUnit) => {
            const buttonQS = document.querySelector(`#${makeIdButtonUnit(objectUnit.unitName)}`);
            buttonQS && buttonQS.addEventListener('click', () => {
                const { setConfig } = reduxConfig();
                const selectBindButton = reduxSelectBindButton().selectBindButton;

                setConfig({
                    type:  selectBindButton.key,
                    value: { ...objectUnit, bindKey: selectBindButton.bindKey },
                });

                const { config } = reduxConfig();
                main.innerHTML = `${templateRaces()}${templateBindButtons({ config })}`;
                racesAddEventListenerOnIcons();
                bindButtonsAddEventListener();
            });
        });

        return;
    }

    contentAfterSearch.innerHTML = `${units.map((objectUnit) => templateButtonUnit(
        {
            id:         makeIdButtonUnit(objectUnit.unitName),
            unitName:   objectUnit.unitName,
            unitImgUrl: objectUnit.unitImgUrl,
        },
    )).join('')}`;

    units.forEach((objectUnit) => {
        const buttonQS = document.querySelector(`#${makeIdButtonUnit(objectUnit.unitName)}`);
        buttonQS && buttonQS.addEventListener('click', () => {
            const { setConfig } = reduxConfig();
            const selectBindButton = reduxSelectBindButton().selectBindButton;

            setConfig({
                type:  selectBindButton.key,
                value: { ...objectUnit, bindKey: selectBindButton.bindKey },
            });

            const { config } = reduxConfig();
            main.innerHTML = `${templateRaces()}${templateBindButtons({ config })}`;
            racesAddEventListenerOnIcons();
            bindButtonsAddEventListener();
        });
    });
};

export const buttonBackToMainPageEventClick = () => {
    const main = document.querySelector('#main');
    if (!main) {
        console.log('no such document.querySelector > buttonBackEventClick');

        return;
    }
    const { config } = reduxConfig();
    main.innerHTML = `${templateRaces()}${templateBindButtons({ config })}`;
    racesAddEventListenerOnIcons();
    bindButtonsAddEventListener();
};

export const inputSearchGlobalEventInput = (event: Event | any) => {
    const buttonBack = document.querySelector('#buttonBack');

    const neutral: Neutral = 'neutral';

    if (!buttonBack) {
        return;
    }

    if (event.target.value.length > 0) {
        console.log('text');
        buttonBack.removeEventListener('click', buttonBackToMainPageEventClick);
        buttonBack.addEventListener('click', buttonBackToCategoriesEventClick);
    }

    addButtonsWithUnit(event.target.value, filterRace({
        data:                      units,
        filter:                    ({ unit, race }) => unit.race === race || unit.race === neutral,
        filterIfNoDataAfterFilter: ({ unit }) => typeof unit.unitName === 'string',
    }));
};

export const selectConfigForButton = () => {
    const main = document.querySelector('#main');
    const buttonBack = document.querySelector('#buttonBack');
    const inputSearch = document.querySelector('#inputSearch');
    const contentAfterSearch = document.querySelector('#contentAfterSearch');

    if (!(main && buttonBack && inputSearch && contentAfterSearch)) {
        console.log('no such document.querySelector');

        return;
    }

    // back to MAIN page
    buttonBack.addEventListener('click', buttonBackToMainPageEventClick);

    // InputSearch Global
    inputSearch.addEventListener('input', inputSearchGlobalEventInput);

    categories();
};

