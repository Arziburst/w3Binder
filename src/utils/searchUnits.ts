import { Unit } from '../bus/config/types';

// Types
type SearchWordS = {
    input: string
    units: Unit[]
}

export const searchUnits = ({ input, units }: SearchWordS): Unit[] => {
    return units.filter((object: Unit) => object.unitName.toLowerCase().includes(input.toLowerCase()));
};
