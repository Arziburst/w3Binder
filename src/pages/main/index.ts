// Bus
import { reduxConfig } from '../../bus/config';

// Templates
const templateRaces = require('../../components/Races/index.handlebars');
const templateBindButtons = require('../../components/BindButtons/index.handlebars');

// Components
import {
    bindButtonsAddEventListener,
    racesAddEventListenerOnIcons,
} from '../../components';

export const createMainPage = () => {
    const main = document.querySelector('#main');

    if (!main) {
        console.log('no such document.querySelector main');

        return;
    }

    const { config } = reduxConfig();

    main.innerHTML = `${templateRaces()}${templateBindButtons({ config })}`;
    racesAddEventListenerOnIcons();
    bindButtonsAddEventListener();
};
