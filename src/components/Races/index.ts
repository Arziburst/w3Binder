// Styles
import './index.scss';

// Bus
import { reduxConfig } from '../../bus/config';

// Configs
import { configHuman, configOrc, configUndead, configNightElf } from './configs';

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

    if (!(selectHuman && selectOrc)) {
        return;
    }


    let activeRace = '';
    const activeStyle = 'transform: scale(1.4);';

    const resetAllActiveRaces = () => {
        [ selectHuman, selectOrc ].forEach((el) => {
            el.style = 'transform: scale(1);';
        });
    };

    // Human
    selectHuman.addEventListener('click', (event: any) => {
        selectRace({ event, selectedConfig: configHuman });
        resetAllActiveRaces();
        activeRace = 'human';
        if (activeRace === 'human') {
            selectHuman.style = activeStyle;
        }
    });

    // Orc
    selectOrc.addEventListener('click', (event: any) => {
        selectRace({ event, selectedConfig: configOrc });
    });

    // Undead
    document.querySelector('#selectUndead')?.addEventListener('click', (event) => {
        selectRace({ event, selectedConfig: configUndead });
    });

    // Night elf
    document.querySelector('#selectNightElf')?.addEventListener('click', (event) => {
        selectRace({ event, selectedConfig: configNightElf });
    });
});
