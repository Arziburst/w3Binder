// Core
import lodash from 'lodash';

// Bus
import { reduxToggles } from '../../bus/client/toggles';
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
import { Unit } from '../../bus/config/types';

export const addButtonsWithUnit = (value: string, units: Unit[]) => {
    const main = document.querySelector('#main');
    const contentAfterSearch = document.querySelector('#contentAfterSearch');

    if (!(main && contentAfterSearch)) {
        return;
    }

    if (value.length > 0) {
        const foundUnits: Unit[] = searchUnits({ input: value, units });

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

export const inputSearchGlobal = lodash.debounce((event: Event | any) => {
    const { togglesRedux, setToggleAction } = reduxToggles();

    if (togglesRedux.isUserStartedSearchingAndInputIsEmpty === false && event.target.value.length === 0) {
        const buttonBack = document.querySelector('#buttonBack');
        if (!buttonBack) {
            return;
        }
        console.log('isUserStartedSearchingAndInputIsEmpty');
        buttonBack.addEventListener('click', buttonBackToCategoriesEventClick);
        setToggleAction({ type: 'isUserStartedSearchingAndInputIsEmpty', value: true });
    }

    addButtonsWithUnit(event.target.value, filterRace({
        data:                      units,
        filter:                    ({ unit, race }) =>  unit.type === race,
        filterIfNoDataAfterFilter: ({ unit }) =>  typeof unit.type === 'string',
    }));
}, 300);

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
    inputSearch.addEventListener('input', inputSearchGlobal);

    categories();
};

