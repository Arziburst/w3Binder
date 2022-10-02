// Core
import { createSlice } from '@reduxjs/toolkit';
import { store } from '../../../init/redux';

const initialState = false;

// Slice
export const raceSlice = createSlice({
    name:     'selectedRace',
    initialState,
    reducers: {
        setRace:   (state, action) => action.payload,
        resetRace: () => initialState,
    },
});

// Interfaces
const raceActions = raceSlice.actions;
export default raceSlice.reducer;

export const reduxSelectRace = () => {
    return {
        race:      store.getState().selectedRace,
        setRace:   (race: string) => void store.dispatch(raceActions.setRace(race)),
        resetRace: () => void store.dispatch(raceActions.resetRace()),
    };
};
