// Data
import { units } from '../../data';

// Bus
import { reduxConfig } from '../../bus/config';
import { reduxSelectRace } from '../../bus/client/selectedRace';

// Templates
const templateBindButtons = require('../BindButtons/index.handlebars');


// Styles
import './index.scss';

// Types
import { filterRace } from '../../utils';
import { Unit } from '../../bus/config/types';
import { bindButtonsAddEventListener } from '../BindButtons';

export const racesAddEventListenerOnIcons = () => {
    const selectHuman = document.querySelector('#selectHuman');
    const selectOrc = document.querySelector('#selectOrc');
    const selectUndead = document.querySelector('#selectUndead');
    const selectNightElf = document.querySelector('#selectNightElf');

    if (!(selectHuman && selectOrc && selectUndead && selectNightElf)) {
        return;
    }

    const resetAllActiveRaces = () => {
        [ selectHuman, selectOrc, selectUndead, selectNightElf ].forEach((el) => {
            el.classList.remove('races__item--active');
        });
    };

    const addEventClick = (HTMLElement: Element, raceClick: Unit['race']) => {
        HTMLElement.addEventListener('click', () => {
            const bindButtons = document.querySelector('#bindButtons');

            if (!bindButtons) {
                console.log('document.querySelector("#bindButtons");');

                return;
            }

            reduxSelectRace().setRace(raceClick);

            const buildersCurrentRace = filterRace({
                data:   units,
                filter: ({ unit, race }) => unit.race === race,
            });

            reduxConfig().setConfig({ type: 'b', value: { ...buildersCurrentRace[ 0 ], bindKey: 0 }});

            bindButtons.innerHTML = `${templateBindButtons({ config: reduxConfig().config })}`;

            resetAllActiveRaces();
            const raceState = reduxSelectRace().race;

            if (typeof raceState === 'string' && raceState === raceClick) {
                HTMLElement.classList.add('races__item--active');
            }

            bindButtonsAddEventListener();
        });

        const raceState = reduxSelectRace().race;
        if (typeof raceState === 'string' && raceState === raceClick) {
            HTMLElement.classList.add('races__item--active');
        }
    };

    addEventClick(selectHuman, 'human');

    addEventClick(selectOrc, 'orc');

    addEventClick(selectUndead, 'undead');

    addEventClick(selectNightElf, 'nightElf');
};
