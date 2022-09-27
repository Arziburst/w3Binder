// Styles
import './index.scss';

// Bus
import { reduxConfig } from '../../bus/config';

// Types
type SelectRace = {
    event: Event
    selectedConfig: object
};

const selectRace = ({ event, selectedConfig }: SelectRace) => {
    event.preventDefault();
    const { setConfig } = reduxConfig();

    setConfig(selectedConfig); //! todo payload

    const { config } = reduxConfig();

    alert(JSON.stringify(config));

    // inner for test config
    // document.querySelector<any>('#testData').innerHTML = JSON.stringify(config);
};


window.addEventListener('load', () => {
    const selectHuman: any =  document.querySelector('#selectHuman');
    const selectOrc: any =  document.querySelector('#selectOrc');
    const selectUndead: any =  document.querySelector('#selectUndead');
    const selectNightElf: any =  document.querySelector('#selectNightElf');

    if (!(selectHuman && selectOrc && selectUndead && selectNightElf)) {
        return;
    }


    let activeRace = '';
    const activeStyle = 'box-shadow: 0px 0px 10px 5px rgba(255, 255, 255, 0.5);';

    const resetAllActiveRaces = () => {
        [ selectHuman, selectOrc, selectUndead, selectNightElf ].forEach((el) => {
            el.style = 'box-shadow: 0px 0px 10px 5px rgba(0, 0, 0, 0.5);';
        });
    };

    // Human
    selectHuman.addEventListener('click', (event: Event) => {
        selectRace({ event, selectedConfig: {}});
        // resetAllActiveRaces();
        activeRace = 'human';
        if (activeRace === 'human') {
            // selectHuman.style = activeStyle;
        }
    });

    // Orc
    selectOrc.addEventListener('click', (event: Event) => {
        selectRace({ event, selectedConfig: {}});
        // resetAllActiveRaces();
        activeRace = 'orc';
        if (activeRace === 'orc') {
            // selectOrc.style = activeStyle;
        }
    });

    // Undead
    selectUndead.addEventListener('click', (event: Event) => {
        selectRace({ event, selectedConfig: {}});
        // resetAllActiveRaces();
        activeRace = 'undead';
        if (activeRace === 'undead') {
            // selectUndead.style = activeStyle;
        }
    });

    // Night elf
    selectNightElf.addEventListener('click', (event: Event) => {
        selectRace({ event, selectedConfig: {}});
        // resetAllActiveRaces();
        activeRace = 'nightElt';
        if (activeRace === 'nightElt') {
            // selectNightElf.style = activeStyle;
        }
    });
});
