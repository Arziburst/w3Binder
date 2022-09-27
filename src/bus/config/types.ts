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

type Unit = {
    unitName: string,
    spells: Array<Spell>
    unitImgUrl: string
    type: Human | Orc | Undead | NightElf | Neutral
    isBuilding: boolean
} | false

export type ConfigState = {
    q: Unit,
    w: Unit,
    e: Unit,
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
