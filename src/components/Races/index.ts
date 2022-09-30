// Data
import { builders } from '../../data';

// Bus
import { reduxConfig } from '../../bus/config';
import { reduxSelectRace } from '../../bus/client/selectedRace';

// Styles
import './index.scss';

// Types
import { Builder } from '../../bus/config/types';

const selectRace = (selectedConfig: Builder) => {
    reduxSelectRace().setRace(selectedConfig.type);
    reduxConfig().setConfig({ type: 'b', value: { ...selectedConfig, bindKey: 0 }});
};


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

    const addEventClick = (HTMLElement: Element, race: string) => {
        HTMLElement.addEventListener('click', () => {
            selectRace(builders.find((obj) => obj.type === race) as Builder);
            resetAllActiveRaces();
            const raceState = reduxSelectRace().race;
            if (typeof raceState === 'string' && raceState === race) {
                HTMLElement.classList.add(`races--active_${race}`);
            }
        });
        const raceState = reduxSelectRace().race;
        if (typeof raceState === 'string' && raceState === race) {
            HTMLElement.classList.add(`races--active_${race}`);
        }
    };

    addEventClick(selectHuman, 'human');

    addEventClick(selectOrc, 'orc');

    addEventClick(selectUndead, 'undead');

    addEventClick(selectNightElf, 'nightElf');
};
