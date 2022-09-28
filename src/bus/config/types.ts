// Core
import { CaseReducer, PayloadAction } from '@reduxjs/toolkit';

// State
import { initialState } from './slice';

type Human = 'human'
type Orc = 'orc'
type Undead = 'undead'
type NightElf = 'nightElf'
type Neutral = 'neutral'

type Spell = {
    key: string
    isClick: boolean
    isAura: boolean
    spellImgUrl: string
}

export type Unit = {
    bindKey: number
    unitName: string,
    unitImgUrl: string
    spells: Array<Spell>
    type: Human | Orc | Undead | NightElf | Neutral
    isBuilding: boolean
}

type ConfigUnit = Unit | false

export type ConfigState = {
    isAutoMove: boolean
    q: ConfigUnit,
    w: ConfigUnit,
    e: ConfigUnit,
    r: false
    a: ConfigUnit,
    s: ConfigUnit,
    d: ConfigUnit,
    f: false
    z: ConfigUnit,
    x: ConfigUnit,
    c: ConfigUnit,
    v: false
    b: Unit & { buldings: Array<string> } | false
}

// Contracts
export type BaseContact<T = any> = CaseReducer<ConfigState, PayloadAction<T>>

export type BindButtons = keyof typeof initialState;
export type OptionsConfig = { type: BindButtons, value: Unit };
