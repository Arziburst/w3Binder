// Types
import { Unit } from '../bus/config/types';

export const makeIdButtonUnit = (unitName: Unit['unitName']) => `button_unit_${unitName.toLocaleLowerCase().split(' ')
    .join('_')}`;
