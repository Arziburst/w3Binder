// Core
import { configureStore } from '@reduxjs/toolkit';

// Reducers
import config from '../../bus/config/slice';

export const store = configureStore({
    reducer: {
        config,
    },
});

