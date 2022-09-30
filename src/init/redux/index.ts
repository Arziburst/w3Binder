// Core
import { configureStore } from '@reduxjs/toolkit';

// Reducers
import toggles from '../../bus/client/toggles';
import config from '../../bus/config/slice';
import selectedRace from '../../bus/client/selectedRace';
import selectBindButton from '../../bus/client/selectBindButton';

export const store = configureStore({
    reducer: {
        toggles,
        config,
        selectedRace,
        selectBindButton,
    },
});

