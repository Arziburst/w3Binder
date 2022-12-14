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

const setCurrentRace = (data: any) => {
    if (data) {
        const parsedConfig: any = JSON.parse(data);
        reduxConfig().setSavedClientConfig(parsedConfig);

        const arr = new Set();
        const neutral: Neutral = 'neutral';

        Object.values(parsedConfig).forEach((obj: any) => {
            if (typeof obj.race === 'string' && obj.race !== neutral) {
                arr.add(obj.race);
            }
        });

        if (arr.size === 1) {
            reduxSelectRace().setRace(arr.values().next().value);
        }
    }
};

const setConfig = (ConfigJSONFromAhk: string) => {
    if (ConfigJSONFromAhk) {
        setCurrentRace(ConfigJSONFromAhk);
    }

    createMainPage();
};
window.setConfig = setConfig;


const { NODE_ENV } = process.env;
if (NODE_ENV === 'development') {
    const fakeData: any = JSON.stringify({ isAutoMove: false, b: { unitName: 'Peon', unitImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/f/f6/BTNPeon.png/revision/latest?cb=20090112015218', spells: false, type: 'army', race: 'orc', buildings: [ 'h', 'b', 'm', 'w', 'o', 'a', 's', 'e', 't', 'v' ], bindKey: 0 }, q: { unitName: 'Far Seer', unitImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/6/63/BTNHeroFarseer.png/revision/latest?cb=20090112005324', spells: [{ key: 'c', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/e/ee/BTNChainLightning.png/revision/latest?cb=20090111223436', isClick: true, isAura: false }, { key: 'f', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/4/4e/BTNFarSight.png/revision/latest?cb=20090112003639', isClick: true, isAura: false }, { key: 't', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/5/56/BTNSpiritWolf.png/revision/latest?cb=20090112021703', isClick: false, isAura: false }, { key: 'e', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/8/86/BTNEarthquake.png/revision/latest?cb=20090112001121', isClick: true, isAura: false }], type: 'hero', race: 'orc', bindKey: 1 }, w: { unitName: 'Shadow Hunter', unitImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/5/5a/BTNShadowHunter.png/revision/latest?cb=20090112040540', spells: [{ key: 'e', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/6/66/BTNHealingWave.png/revision/latest?cb=20090112033621', isClick: true, isAura: false }, { key: 'x', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/2/24/BTNHex.png/revision/latest?cb=20090112033717', isClick: true, isAura: false }, { key: 'w', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/e/e8/BTNSerpentWard.png/revision/latest?cb=20090112040529', isClick: true, isAura: false }, { key: 'v', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/f/fa/BTNBigBadVoodooSpell.png/revision/latest?cb=20090111201159', isClick: true, isAura: false }], type: 'hero', race: 'orc', bindKey: 2 }, e: { unitName: 'Tauren Chieftain', unitImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/8/8d/BTNHeroTaurenChieftain.png/revision/latest?cb=20090112005419', spells: [{ key: 'w', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/e/e3/BTNShockWave.png/revision/latest?cb=20090112021117', isClick: true, isAura: false }, { key: 't', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/b/bc/BTNWarStomp.png/revision/latest?cb=20090112023315', isClick: false, isAura: false }, { key: 'e', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/3/37/PASBTNCommand.png/revision/latest?cb=20090513192842', isClick: false, isAura: true }, { key: 'r', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/0/0a/PASBTNReincarnation.png/revision/latest?cb=20090513193342', isClick: false, isAura: true }], type: 'hero', race: 'orc', bindKey: 3 }, a: { unitName: 'Grunt', unitImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/f/fa/BTNGrunt.png/revision/latest?cb=20090112004800', spells: false, type: 'army', race: 'orc', bindKey: 4 }, s: { unitName: 'Headhunter', unitImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/4/42/BTNHeadhunter.png/revision/latest?cb=20110523182155', spells: [{ key: 'b', spellImgUrl: 'https://static.wikia.nocookie.net/wowpedia/images/1/10/BTNHeadHunterBerserker.png/revision/latest?cb=20090112033559', isClick: false, isAura: false }], type: 'army', race: 'orc', bindKey: 5 }});

    setCurrentRace(fakeData);

    createMainPage();
}
