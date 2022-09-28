import '@babel/polyfill';

// Init
import './index.scss';
import './init/redux';

// View
import './elements';
import './components';

// Bus
import { reduxConfig } from './bus/config';

// Images
import './assets/images/icon_race_human.png';
import './assets/images/icon_race_orc.png';
import './assets/images/icon_race_undead.png';
import './assets/images/icon_race_night_elf.png';
import './assets/images/border_iron.png';
import './assets/images/background_wood.jpg';


// Window
const setConfig = (ConfigJSONFromAhk: string) => {
    const parsedConfig: any = JSON.parse(ConfigJSONFromAhk);

    reduxConfig().setGlobalConfig(parsedConfig);
};

window.setConfig = setConfig;
