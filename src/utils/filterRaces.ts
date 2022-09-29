// Bus
import { reduxSelectRace } from '../bus/client/selectedRace';

// Types
import { Unit } from '../bus/config/types';

export const filterRaces = (data: Array<Unit>) => {
    const race: any = reduxSelectRace().race;

    const result = data.filter((unit) => unit.type === race || unit.type === 'neutral');

    if (race) {
        return result;
    }

    return data;
};
