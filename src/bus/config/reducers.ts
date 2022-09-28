
// Core
import { PayloadAction } from '@reduxjs/toolkit';

// State
import { initialState } from './slice';

// Types
import * as types from './types';

export const setConfig: types.BaseContact = (state, action: PayloadAction<types.OptionsConfig>) => ({
    ...state,
    [ action.payload.type ]: action.payload.value,
});


export const resetConfig = () => initialState;
