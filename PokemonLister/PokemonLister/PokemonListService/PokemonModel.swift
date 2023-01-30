//
//  PokemonModel.swift
//  PokemonLister
//
//  Created by andre.aragao on 26/01/23.
//

import Foundation

struct Pokedex: Codable {
    let id: Int
    let name: String
    let pokemon_entries: [PokemonEntry]
}

struct PokemonEntry: Codable {
    let entry_number: Int
    let pokemon_species: PokemonSpecies
}

struct PokemonSpecies: Codable {
//    let id: Int
    let url: String
    let name: String
}
