// Bus
import { reduxConfig } from '../../bus/config';

// Templates
const templateRaces = require('../Races/index.handlebars');
const templateBindButtons = require('../BindButtons/index.handlebars');

// Components
import { bindButtonsAddEventListener } from '../BindButtons';

// Styles
import './index.scss';

window.addEventListener('load', () => {
    const main = document.querySelector('#main');

    if (!main) {
        console.log('no such document.querySelector main');

        return;
    }

    const { config } = reduxConfig();

    main.innerHTML = `${templateRaces()}${templateBindButtons({ config })}`;
    bindButtonsAddEventListener();

    console.log();
});
