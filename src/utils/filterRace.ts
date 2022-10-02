// Bus
import { reduxSelectRace } from '../bus/client/selectedRace';

// Types
import { Unit } from '../bus/config/types';

type TypeFilter = ({ unit, race }:{ unit: Unit, race: string}) => boolean

type Types = {
    data: Array<Unit>
    filter: TypeFilter
    filterIfNoDataAfterFilter?: TypeFilter
}

export const filterRace = ({ data, filter, filterIfNoDataAfterFilter }: Types) => {
    const race: any = reduxSelectRace().race;

    const result = data.filter((unit) => filter({ unit, race }));

    if (!race && filterIfNoDataAfterFilter && result.length === 0) {
        return data.filter((unit) => filterIfNoDataAfterFilter({ unit, race }));
    }

    return result;
};
