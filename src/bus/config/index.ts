import { store } from '../../init/redux'; /* Typed selector */
import { configActions } from './slice';

export const reduxConfig = () => {
    const config = store.getState().config;


    return {
        config:    config,
        setConfig: (payload: any) => store.dispatch(configActions.setConfig(payload)),

    };

    // alert(config.q);
};
