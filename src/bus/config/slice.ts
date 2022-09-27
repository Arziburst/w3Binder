// Core
import { createSlice } from '@reduxjs/toolkit';

// Types
import * as types from './types';

// Reducers
import * as reducers from './reducers';

const initialState: types.ConfigState = {
    q: false,
    w: false,
    e: false,
    a: false,
    s: false,
    d: false,
    z: false,
    x: false,
    c: false,
    b: false,
};

export const configSlice = createSlice<types.ConfigState, typeof reducers>({
    name: 'config',
    initialState,
    reducers,
});

export const sliceName = configSlice.name;
export const configActions = configSlice.actions;
export default configSlice.reducer;
