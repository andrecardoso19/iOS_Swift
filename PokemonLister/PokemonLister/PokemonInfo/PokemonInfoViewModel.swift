//
//  PokemonInfoViewModel.swift
//  PokemonLister
//
//  Created by andre.aragao on 30/01/23.
//

import Foundation

final class PokemonInfoViewModel {
    private let service: PokemonServicing
    var pokemonUrl: String
    
    init(service: PokemonServicing = PokemonService(), pokemonUrl: String) {
        self.service = service
        self.pokemonUrl = pokemonUrl
    }
}
