//
//  PokedexListViewModel.swift
//  PokemonLister
//
//  Created by andre.aragao on 17/02/23.
//

import Foundation

protocol PokedexListViewModeling {
    var pokedex: Pokedex { get }
}

final class PokedexListViewModel: PokedexListViewModeling {
    private let service: PokemonServicing
    private(set) var pokedex: Pokedex
    
    init(pokedex: Pokedex = Pokedex(id: 0, name: "", pokemon_entries: []), service: PokemonServicing = PokemonService()) {
        self.pokedex = pokedex
        self.service = service
    }
}
