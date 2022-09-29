// Bus
import { reduxConfig } from '../../bus/config';

// Utils
import {
    searchUnits,
    autoComplete,
    makeIdButtonUnit,
    filterRace,
} from '../../utils';

// Data
import { units } from '../../data/index';

// Components
import {
    racesAddEventListenerOnIcons,
    bindButtonsAddEventListener,
    categories,
} from '../../components';

// Templates
const templateRaces = require('../../components/Races/index.handlebars');
const templateBindButtons = require('../../components/BindButtons/index.handlebars');

const templateButtonUnit = require('../../components//ButtonUnit/index.handlebars');

// Styles
import './index.scss';

// Types
import { Neutral, Unit } from '../../bus/config/types';
import { reduxSelectBindButton } from '../../bus/client/selectBindButton';

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
                id:   makeIdButtonUnit(objectUnit.unitName),
                body: objectUnit.unitName,
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
            id:   makeIdButtonUnit(objectUnit.unitName),
            body: objectUnit.unitName,
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

export const inputSearchGlobal = (event: Event | any) => {
    console.log('inputSearch GLOBAL');
    addButtonsWithUnit(event.target.value, filterRace({
        data:                      units,
        filter:                    ({ unit, race }) =>  unit.type === race,
        filterIfNoDataAfterFilter: ({ unit }) =>  typeof unit.type === 'string',
    }));
};

export const selectConfigForButton = () => {
    const main = document.querySelector('#main');
    const buttonBack = document.querySelector('#buttonBack');
    const inputSearch = document.querySelector('#inputSearch');
    const contentAfterSearch = document.querySelector('#contentAfterSearch');

    const neutral: Neutral = 'neutral';

    if (!(main && buttonBack && inputSearch && contentAfterSearch)) {
        console.log('no such document.querySelector');

        return;
    }

    // back to MAIN page
    buttonBack.addEventListener('click', () => {
        const { config } = reduxConfig();
        main.innerHTML = `${templateRaces()}${templateBindButtons({ config })}`;
        racesAddEventListenerOnIcons();
        bindButtonsAddEventListener();
    });

    // InputSearch Global
    inputSearch.addEventListener('input', inputSearchGlobal);

    // autoComplete
    // autoComplete({ // todo autoComplete
    //     inp: inputSearch,

    //     arr: filterRace({
    //         data:   units,
    //         filter: ({ unit, race }) =>  unit.type === race || unit.type === neutral,
    //     }).map((objectUnit) => objectUnit.unitName),

    //     selectItemCallback: (value: string) => {
    //         addButtonsWithUnit(
    //             value,
    //             filterRace({
    //                 data:   units,
    //                 filter: ({ unit, race }) =>  unit.type === race || unit.type === neutral,
    //             }),
    //         );
    //     },
    // });

    categories();
};

