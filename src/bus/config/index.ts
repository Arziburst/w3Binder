import { store } from '../../init/redux';
import { configActions } from './slice';

// Types
import { ConfigState, OptionsConfig } from './types';

export const reduxConfig = () => {
    const config = store.getState().config;

    return {
        config:               config,
        setConfig:            (payload: OptionsConfig) => store.dispatch(configActions.setConfig(payload)),
        setSavedClientConfig: (payload: ConfigState) => store.dispatch(configActions.setSavedClientConfig(payload)),
        resetConfig:          () => store.dispatch(configActions.resetConfig()),
    };
};
