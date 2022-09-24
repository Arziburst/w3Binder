import '@babel/polyfill';

// Init
import './index.scss';
import './init/redux';
// View
import './components';

// Bus
import { reduxConfig } from './bus/config';
reduxConfig();
alert('all good');
