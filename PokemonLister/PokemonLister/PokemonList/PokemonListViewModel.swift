//
//  HomeViewModel.swift
//  PokemonLister
//
//  Created by andre.aragao on 26/01/23.
//

import Foundation

protocol PokemonListViewModelDelegate: AnyObject {
    func onError(error: PokedexError)
}

protocol PokemonListViewModeling {
    var delegate: PokemonListViewModelDelegate? { get set }
    var pokedex: Pokedex { get }
    func getPokemonList()
}

final class PokemonListViewModel: PokemonListViewModeling {
    private let service: PokemonServicing
    // setado internamente, mas visualizado externamente(get)
    private(set) var pokedex: Pokedex = Pokedex(id: 0, name: "", pokemon_entries: [])
    weak var delegate: PokemonListViewModelDelegate?
    
    init(service: PokemonServicing = PokemonService()) {
        self.service = service
    }
    
    func getPokemonList(){
        service.fetchPokemonList(completion: { [weak self] result in
            // dispatchqueue.main pra mandar o success ou failure pra main thread(realizar ajuste visual)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                switch result {
                case .success(let pokedex):
                    self.pokedex = pokedex
                case .failure(let error):
                    self.delegate?.onError(error: error)
                }
            }
        })
    }
}
