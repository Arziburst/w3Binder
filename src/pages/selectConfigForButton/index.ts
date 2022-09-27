// Utils
import { searchUnits, autoComplete } from '../../utils';

// Data
import { units } from '../../data/index';

// Templates
const templateButton = require('../../elements/Button/index.handlebars');
const templateCategories = require('../../components/Categories/index.handlebars');

// Styles
import './index.scss';

// Types
import { Unit } from '../../bus/config/types';

export const searchAndAutoComplete = () => {
    const inputSearch: any = document.querySelector('#inputSearch');
    const contentAfterSearch = document.querySelector('#contentAfterSearch');

    if (!(contentAfterSearch && inputSearch)) {
        console.log('no such document.querySelector');

        return;
    }

    inputSearch.addEventListener('input', (event: any) => {
        console.log('text');

        if (event.target.value.length > 0) {
            const foundUnits: Unit[] = searchUnits({ input: event.target.value, units });

            contentAfterSearch.innerHTML = `${foundUnits.map((objectUnit) => templateButton({ body: objectUnit.unitName })).join('')}`;

            return;
        }

        contentAfterSearch.innerHTML = templateCategories();
    });

    autoComplete({
        inp:                inputSearch,
        arr:                units.map((objectUnit) => objectUnit.unitName),
        selectItemCallback: (value: string) => {
            if (value.length > 0) {
                const foundUnits: Unit[] = searchUnits({ input: value, units });

                contentAfterSearch.innerHTML = `${foundUnits.map((objectUnit) => templateButton({ body: objectUnit.unitName })).join('')}`;

                return;
            }

            contentAfterSearch.innerHTML = templateCategories();
        },
    });
};

