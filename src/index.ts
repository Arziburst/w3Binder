import '@babel/polyfill';

// Init
import './init/redux';

// View
import './elements';
import './components';
import './pages';

// Bus
import { reduxConfig } from './bus/config';
import { reduxSelectRace } from './bus/client/selectedRace';

// Images
import './assets/images/border_iron.png';
import './assets/images/background_wood.jpg';

import './assets/images/icon_race_human.png';
import './assets/images/icon_race_orc.png';
import './assets/images/icon_race_undead.png';
import './assets/images/icon_race_nightElf.png';

// Pages
import { createMainPage } from './pages';

// Styles
import './index.scss';

// Types
import { Neutral } from './bus/config/types';

const setConfig = (ConfigJSONFromAhk: string) => {
    if (ConfigJSONFromAhk) {
        const parsedConfig: any = JSON.parse(ConfigJSONFromAhk);
        reduxConfig().setSavedClientConfig(parsedConfig);

        const arr = new Set();
        const neutral: Neutral = 'neutral';

        Object.values(parsedConfig).forEach((obj: any) => (typeof obj.type === 'string' && obj.type !== neutral) && arr.add(obj.type));

        if (arr.size === 1) {
            reduxSelectRace().setRace(arr.values().next().value);
        }
    }

    createMainPage();
};
window.setConfig = setConfig;


const { NODE_ENV } = process.env;
if (NODE_ENV === 'development') {
    const fakeData: any = JSON.stringify({
        isAutoMove: true,
        q:          {
            bindKey:    1,
            unitName:   'Dreadlord',
            unitImgUrl: false,
            spells:     [
                {
                    key:         'c',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'e',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'u',
                    spellImgUrl: false,
                    isClick:     false,
                    isAura:      true,
                },
                {
                    key:         'd',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
            ],
            type:       'undead',
            isBuilding: false,
        },
        w: {
            bindKey:    2,
            unitName:   'Lich',
            unitImgUrl: false,
            spells:     [
                {
                    key:         'n',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'f',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'r',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'd',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
            ],
            type:       'undead',
            isBuilding: false,
        },
        e: {
            bindKey:    3,
            unitName:   '3',
            unitImgUrl: false,
            spells:     [
                {
                    key:         'c',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'e',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'v',
                    spellImgUrl: false,
                    isClick:     false,
                    isAura:      true,
                },
                {
                    key:         'n',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
            ],
            type:       'undead',
            isBuilding: false,
        },
        r: false,
        a: {
            bindKey:    4,
            unitName:   'armyA',
            unitImgUrl: false,
            spells:     [
                {
                    key:         'd',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'o',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                false,
                {
                    key:         'b',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
            ],
            type:       'undead',
            isBuilding: false,
        },
        s: {
            bindKey:    5,
            unitName:   'armyS',
            unitImgUrl: false,
            spells:     [
                {
                    key:         'r',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'u',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'c',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                false,
            ],
            type:       'undead',
            isBuilding: false,
        },
        d: {
            bindKey:    6,
            unitName:   'armyD',
            unitImgUrl: false,
            spells:     [
                {
                    key:         'c',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'n',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                {
                    key:         'o',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
                false,
            ],
            type:       'undead',
            isBuilding: false,
        },
        f: false,
        z: {
            bindKey:    7,
            unitName:   'armyZ',
            unitImgUrl: false,
            spells:     false,
            type:       'undead',
            isBuilding: false,
        },
        x: {
            bindKey:    8,
            unitName:   'armyX',
            unitImgUrl: false,
            spells:     false,
            type:       'undead',
            isBuilding: false,
        },
        c: {
            bindKey:    9,
            unitName:   'armyC',
            unitImgUrl: false,
            spells:     false,
            type:       'undead',
            isBuilding: false,
        },
        v: false,
        b: {
            bindKey:   0,
            buildings: [
                'n',
                'c',
                'g',
                'v',
                'z',
                'a',
                't',
                'h',
                's',
                'b',
                'r',
            ],
            unitName:   'buildB',
            unitImgUrl: false,
            spells:     [
                false,
                {
                    key:         'u',
                    spellImgUrl: false,
                    isClick:     false,
                    isAura:      false,
                },
                false,
                {
                    key:         'c',
                    spellImgUrl: false,
                    isClick:     true,
                    isAura:      false,
                },
            ],
            type:       'undead',
            isBuilding: false,
        },
    });

    if (fakeData) {
        const parsedConfig: any = JSON.parse(fakeData);
        reduxConfig().setSavedClientConfig(parsedConfig);

        const arr = new Set();
        const neutral: Neutral = 'neutral';

        Object.values(parsedConfig).forEach((obj: any) => (typeof obj.type === 'string' && obj.type !== neutral) && arr.add(obj.type));

        if (arr.size === 1) {
            reduxSelectRace().setRace(arr.values().next().value);
        }
    }

    createMainPage();
}
