// Core
import { CaseReducer, PayloadAction } from '@reduxjs/toolkit';

type Unit = {
    bindKey: number,
    untiName: string,
    spells: Array<string>
} | false

export type ConfigState = {
    q: Unit,
    w: Unit,
    a: Unit,
    s: Unit,
    d: Unit,
    z: Unit,
    x: Unit,
    c: Unit,
    b: Unit
}

// Contracts
export type BaseContact<T = any> = CaseReducer<ConfigState, PayloadAction<T>>
