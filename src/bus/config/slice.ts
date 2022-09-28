// Core
import { createSlice } from '@reduxjs/toolkit';

// Types
import * as types from './types';

// Reducers
import * as reducers from './reducers';

export const initialState: types.ConfigState = {
    isAutoMove: true,
    q:          false,
    w:          false,
    e:          false,
    r:          false,
    a:          false,
    s:          false,
    d:          false,
    f:          false,
    z:          false,
    x:          false,
    c:          false,
    v:          false,
    b:          false,
};

export const configSlice = createSlice<types.ConfigState, typeof reducers>({
    name: 'config',
    initialState,
    reducers,
});

export const sliceName = configSlice.name;
export const configActions = configSlice.actions;
export default configSlice.reducer;
