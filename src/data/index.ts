
// unitImportJsonMarker
import Acolyte from './Acolyte.json';

// Types
import { Unit } from '../bus/config/types'; // todo remove any[]

export const units: Array<Omit<Unit, 'bindKey'>> = [
    // unitJsonMarker
    Acolyte,
];
