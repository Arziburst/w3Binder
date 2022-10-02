// Core
import { CaseReducer, PayloadAction } from '@reduxjs/toolkit';

// State
import { initialState } from './slice';

type Human = 'human'
type Orc = 'orc'
type Undead = 'undead'
type NightElf = 'nightElf'
export type Neutral = 'neutral'

type Spell = {
    key: string
    isClick: boolean
    isAura: boolean
    spellImgUrl: string | boolean
} | boolean

export type Unit = {
    unitName: string,
    unitImgUrl: string | boolean
    spells: Array<Spell> | boolean
    type: Human | Orc | Undead | NightElf | Neutral | string
    isBuilding: boolean
    buildings?: string[]
}

export type FullUnit = Unit & { bindKey: number }

type ConfigUnit = FullUnit | false

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
    b: FullUnit & { buildings: Array<string | boolean> } | false
}

// Contracts
export type BaseContact<T = any> = CaseReducer<ConfigState, PayloadAction<T>>

export type BindButtons = keyof typeof initialState;
export type OptionsConfig = {
    type: BindButtons,
    value: FullUnit | FullUnit & { buildings: Array<string | boolean> } | boolean
};
