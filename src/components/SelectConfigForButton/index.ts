// Bus
import { reduxConfig } from '../../bus/config';

// Utils
import { searchUnits, autoComplete } from '../../utils';

// Data
import { units } from '../../data/index';

// Templates
const templateRaces = require('../Races/index.handlebars');
const templateBindButtons = require('../BindButtons/index.handlebars');
const templateButton = require('../../elements/Button/index.handlebars');
const templateCategories = require('../../components/Categories/index.handlebars');

// Styles
import './index.scss';

// Types
import { BindButtons, Unit } from '../../bus/config/types';
import { bindButtonsAddEventListener } from '../BindButtons';

export const searchAndAutoComplete = (bindButton: BindButtons) => {
    const main = document.querySelector('#main');
    const inputSearch = document.querySelector('#inputSearch');
    const contentAfterSearch = document.querySelector('#contentAfterSearch');

    if (!(main && contentAfterSearch && inputSearch)) {
        console.log('no such document.querySelector');

        return;
    }

    const variable = (value: string, units: Unit[], contentAfterSearch: any) => {
        if (value.length > 0) {
            const foundUnits: Unit[] = searchUnits({ input: value, units });

            const idButton = (unitName: Unit['unitName']) => `button_unit_${unitName.toLocaleLowerCase().split(' ')
                .join('_')}`;

            contentAfterSearch.innerHTML = `${foundUnits.map((objectUnit) => templateButton(
                {
                    id:   idButton(objectUnit.unitName),
                    body: objectUnit.unitName,
                },
            )).join('')}`;

            foundUnits.forEach((objectUnit) => {
                const buttonQS: any = document.querySelector(`#${idButton(objectUnit.unitName)}`);
                buttonQS.addEventListener('click', () => {
                    const { setConfig } = reduxConfig();
                    setConfig({ type: bindButton, value: objectUnit });

                    main.innerHTML = `${templateRaces()}${templateBindButtons()}`;
                    bindButtonsAddEventListener();

                    // const { config } = reduxConfig();
                    // contentAfterSearch.innerHTML = JSON.stringify(config);


                    //! todo main
                });
            });


            return;
        }

        contentAfterSearch.innerHTML = templateCategories();
    };

    inputSearch.addEventListener('input', (event: any) => {
        variable(event.target.value, units, contentAfterSearch);
    });

    autoComplete({
        inp:                inputSearch,
        arr:                units.map((objectUnit) => objectUnit.unitName),
        selectItemCallback: (value: string) => {
            variable(value, units, contentAfterSearch);
        },
    });
};

