//
//  HomeViewModel.swift
//  PokemonLister
//
//  Created by andre.aragao on 26/01/23.
//

import Foundation

final class PokemonListViewModel {
    private let service: PokemonServicing
    var pokedex: Pokedex = Pokedex(id: 0, name: "", pokemon_entries: [])
    
    init(service: PokemonServicing = PokemonService()) {
        self.service = service
    }
    
    func getPokemonList(){
        service.fetchPokemonList(completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let pokedex):
                self.pokedex = pokedex
            case .failure(let pokemonError):
                // tratar erro
                break
            }
        })
        
    }
}
