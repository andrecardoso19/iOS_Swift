//
//  PokemonInfoViewModel.swift
//  PokemonLister
//
//  Created by andre.aragao on 30/01/23.
//

import Foundation

protocol PokemonInfoViewModeling {
    var pokemonUrl: String { get }
}

final class PokemonInfoViewModel: PokemonInfoViewModeling {
    private let service: PokemonServicing
    private(set) var pokemonUrl: String
    
    init(service: PokemonServicing = PokemonService(), pokemonUrl: String) {
        self.service = service
        self.pokemonUrl = pokemonUrl
    }
}
