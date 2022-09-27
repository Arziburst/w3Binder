// Core
import { CaseReducer, PayloadAction } from '@reduxjs/toolkit';

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
    unitName: string,
    unitImgUrl: string
    spells: Array<Spell>
    type: Human | Orc | Undead | NightElf | Neutral
    isBuilding: boolean
}

type ConfigUnit = Unit | false

export type ConfigState = {
    q: ConfigUnit,
    w: ConfigUnit,
    e: ConfigUnit,
    a: ConfigUnit,
    s: ConfigUnit,
    d: ConfigUnit,
    z: ConfigUnit,
    x: ConfigUnit,
    c: ConfigUnit,
    b: ConfigUnit
}

// Contracts
export type BaseContact<T = any> = CaseReducer<ConfigState, PayloadAction<T>>
