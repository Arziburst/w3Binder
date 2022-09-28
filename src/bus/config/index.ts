import { store } from '../../init/redux'; /* Typed selector */
import { configActions } from './slice';

// Types
import { ConfigState, OptionsConfig } from './types';

export const reduxConfig = () => {
    const config = store.getState().config;

    return {
        config:          config,
        setConfig:       (payload: OptionsConfig) => store.dispatch(configActions.setConfig(payload)),
        setGlobalConfig: (payload: ConfigState) => {
            if (payload.q) {
                // alert(payload.q.unitName);
            }
            // store.dispatch(configActions.setConfig(payload))
        },
        resetConfig: () => store.dispatch(configActions.resetConfig()),
    };

    // alert(config.q);
};
