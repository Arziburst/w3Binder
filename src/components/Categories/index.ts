// Data
import { units } from '../../data';

// Templates
const templateButtonUnit = require('../ButtonUnit/index.handlebars');
const templateRaces = require('../Races/index.handlebars');
const templateBindButtons = require('../BindButtons/index.handlebars');


// Utils
import { filterRace, makeIdButtonUnit } from '../../utils';

// Styles
import './index.scss';

// Types
import { Army, Building, Hero, Neutral, Unit } from '../../bus/config/types';
import { addButtonsWithUnit, inputSearchGlobal } from '../../pages';
import { reduxConfig } from '../../bus/config';
import { reduxSelectBindButton } from '../../bus/client/selectBindButton';
import { racesAddEventListenerOnIcons } from '../Races';
import { bindButtonsAddEventListener } from '../BindButtons';

// Events
import { buttonBackToMainPageEventClick } from '../../pages';
import { buttonBackToCategoriesEventClick } from './event';


export const categories = () => {
    const buttonBack = document.querySelector('#buttonBack');
    const inputSearch: Element | any = document.querySelector('#inputSearch');

    const contentAfterSearch = document.querySelector('#contentAfterSearch');

    const categoryUnitsRace = document.querySelector('#categoryUnitsRace');
    const categoryUnitsNeutral = document.querySelector('#categoryUnitsNeutral');
    const categoryBuildingRace = document.querySelector('#categoryBuildingRace');
    const categoryBuildingNeutral = document.querySelector('#categoryBuildingNeutral');

    const neutral: Neutral = 'neutral';
    const hero: Hero = 'hero';
    const army: Army = 'army';
    const building: Building = 'building';

    if (!(
        buttonBack
        && inputSearch
        && contentAfterSearch
        && categoryUnitsRace
        && categoryUnitsNeutral
        && categoryBuildingRace
        && categoryBuildingNeutral
    )) {
        return;
    }

    const innerHTMLCategory = (data: any) => {
        const main = document.querySelector('#main');

        if (!main) {
            console.log('no such document.querySelector');

            return;
        }

        // buttonBack
        buttonBack.removeEventListener('click', buttonBackToMainPageEventClick);
        buttonBack.addEventListener('click', buttonBackToCategoriesEventClick);

        // inputSearch
        inputSearch.removeEventListener('input', inputSearchGlobal);
        inputSearch.addEventListener('input', (event: Event | any) => {
            addButtonsWithUnit(event.target.value, data);
        });

        contentAfterSearch.innerHTML = `${data.map((objectUnit: any) => templateButtonUnit({
            id:         makeIdButtonUnit(objectUnit.unitName),
            unitName:   objectUnit.unitName,
            unitImgUrl: objectUnit.unitImgUrl,
        })).join('')}`;

        data.forEach((objectUnit: Unit) => {
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

    // Units
    categoryUnitsRace.addEventListener('click', () => {
        innerHTMLCategory(filterRace({
            data:   units,
            filter: ({ unit, race }) => unit.race === race && (
                unit.type === hero || unit.type === army),
            filterIfNoDataAfterFilter: ({ unit }) => unit.race !== neutral && (
                unit.type === hero || unit.type === army),
        }));
    });
    categoryUnitsNeutral.addEventListener('click', () => {
        innerHTMLCategory(filterRace({
            data:   units,
            filter: ({ unit }) => unit.race === neutral && (
                unit.type === hero || unit.type === army),
        }));
    });

    // Building
    categoryBuildingRace.addEventListener('click', () => {
        innerHTMLCategory(filterRace({
            data:                      units,
            filter:                    ({ unit, race }) => unit.race === race && unit.type === building,
            filterIfNoDataAfterFilter: ({ unit }) => unit.race !== neutral && unit.type === building,
        }));
    });
    categoryBuildingNeutral.addEventListener('click', () => {
        innerHTMLCategory(filterRace({
            data:   units,
            filter: ({ unit }) => unit.race === neutral && unit.type === building,
        }));
    });
};
