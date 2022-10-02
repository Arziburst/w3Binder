// Core
import { createSlice, PayloadAction } from '@reduxjs/toolkit';

// Store
import { store } from '../../../init/redux';

const initialState = {
    isUserStartedSearchingAndInputIsEmpty: false,
};

// Types
export type TogglesKeys = keyof typeof initialState;
type Options = { type: TogglesKeys, value: boolean };

// Slice
export const togglesSlice = createSlice({
    name:     'toggles',
    initialState,
    reducers: {
        toggleCreatorAction: (state, action: PayloadAction<Options>) => ({
            ...state,
            [ action.payload.type ]: action.payload.value,
        }),
        resetTogglesToInitialAction: () => initialState,
    },
});

// Interfaces
const togglesActions = togglesSlice.actions;
export default togglesSlice.reducer;

export const reduxToggles = () => {
    return {
        togglesRedux:          store.getState().toggles,
        setToggleAction:       (options: Options) => void store.dispatch(togglesActions.toggleCreatorAction(options)),
        resetTogglesToInitial: () => void store.dispatch(togglesActions.resetTogglesToInitialAction()),
    };
};
