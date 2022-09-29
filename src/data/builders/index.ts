import Human from './Human.json';
import Orc from './Orc.json';
import Undead from './Undead.json';
import NightElf from './NightElf.json';

// Types
import { Builder } from '../../bus/config/types';

export const builders: Array<Builder> = [
    Human,
    Orc,
    Undead,
    NightElf,
];
