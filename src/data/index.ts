export * from './builders';

// unitImportJsonMarker
import FarSeer from './FarSeer.json';
import Headhunter from './Headhunter.json';
import Grunt from './Grunt.json';
import OrcHome from './OrcHome.json';
import Acolyte from './Acolyte.json';
import testNut from './testNut.json';

// Types
import { Unit } from '../bus/config/types';

export const units: Array<Unit> = [
    // unitJsonMarker
    FarSeer,
    Headhunter,
    Grunt,
    OrcHome,
    Acolyte,
    testNut,
];
