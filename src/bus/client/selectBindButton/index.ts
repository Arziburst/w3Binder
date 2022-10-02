// Core
import { createSlice } from '@reduxjs/toolkit';
import { store } from '../../../init/redux';

type SelectBindButton = {
    key: string | any,
    bindKey: number
}

const initialState: SelectBindButton | boolean = false;

// Slice
export const selectBindButtonSlice = createSlice({
    name:     'selectBindButton',
    initialState,
    reducers: {
        setSelectBindButton:   (state, action) => action.payload,
        resetSelectBindButton: () => initialState,
    },
});

// Interfaces
const selectBindButtonActions = selectBindButtonSlice.actions;
export default selectBindButtonSlice.reducer;

export const reduxSelectBindButton = () => {
    const selectBindButton: any = store.getState().selectBindButton;

    return {
        selectBindButton:    selectBindButton as SelectBindButton,
        setSelectBindButton: (selectBindButton: SelectBindButton) => {
            store.dispatch(selectBindButtonActions.setSelectBindButton(selectBindButton));
        },
        resetSelectBindButton: () => void store.dispatch(selectBindButtonActions.resetSelectBindButton()),
    };
};
