// Data
import { units } from '../../data';

// Bus
import { reduxConfig } from '../../bus/config';
import { reduxSelectRace } from '../../bus/client/selectedRace';

// Styles
import './index.scss';

// Types
import { filterRace } from '../../utils';

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
            [ 'human', 'orc', 'undead', 'nightElf' ].forEach((str) => {
                el.classList.remove(`races--active_${str}`);
            });
        });
    };

    const addEventClick = (HTMLElement: Element, raceClick: string) => {
        HTMLElement.addEventListener('click', () => {
            reduxSelectRace().setRace(raceClick);

            const buildersCurrentRace = filterRace({
                data:   units,
                filter: ({ unit, race }) => unit.type === race && Array.isArray(unit.buildings),
            });

            reduxConfig().setConfig({ type: 'b', value: { ...buildersCurrentRace[ 0 ], bindKey: 0 }});

            resetAllActiveRaces();
            const raceState = reduxSelectRace().race;

            if (typeof raceState === 'string' && raceState === raceClick) {
                HTMLElement.classList.add(`races--active_${raceClick}`);
            }
        });

        const raceState = reduxSelectRace().race;
        if (typeof raceState === 'string' && raceState === raceClick) {
            HTMLElement.classList.add(`races--active_${raceClick}`);
        }
    };

    addEventClick(selectHuman, 'human');

    addEventClick(selectOrc, 'orc');

    addEventClick(selectUndead, 'undead');

    addEventClick(selectNightElf, 'nightElf');
};
