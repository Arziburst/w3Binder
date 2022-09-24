import { store } from '../../init/redux'; /* Typed selector */


export const reduxConfig = () => {
    const config = store.getState().config;

    alert(config.q);
};
