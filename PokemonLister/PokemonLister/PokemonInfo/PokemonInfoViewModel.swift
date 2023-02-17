//
//  PokemonInfoViewModel.swift
//  PokemonLister
//
//  Created by andre.aragao on 30/01/23.
//

import Foundation
import UIKit

protocol PokemonInfoViewModelDelegate: AnyObject {
    func onError(error: PokedexError)
    func updateImageView()
}

protocol PokemonInfoViewModeling {
    var pokemonNumber: String { get }
    var delegate: PokemonInfoViewModelDelegate? { get set }
    var pokemonImage: UIImage? { get }
    var pokedex: Pokedex { get }
    func getImage() -> Void
}

final class PokemonInfoViewModel: PokemonInfoViewModeling {
    private let service: PokemonServicing
    private(set) var pokemonNumber: String
    private(set) var pokemonImage: UIImage?
    private(set) var pokedex: Pokedex
    weak var delegate: PokemonInfoViewModelDelegate?
    
    init(service: PokemonServicing = PokemonService(), pokemonNumber: String, pokedex: Pokedex = Pokedex(id: 0, name: "", pokemon_entries: [])) {
        self.service = service
        self.pokemonNumber = pokemonNumber
        self.pokedex = pokedex
    }
    
    func getImage() -> Void {
        let group = DispatchGroup()
        group.enter()
        
        service.getPokemonImage(url: "https://nexus.traction.one/images/pokemon/pokemon/\(pokemonNumber).png", completion: { [ weak self ] result in
            DispatchQueue.main.async { [ weak self ] in
                guard let self = self else { return }

                switch result {
                case .success(let imageData):
                    self.pokemonImage = UIImage(data: imageData)
                    group.leave()

                    group.notify(queue: .main, execute: {
                        self.delegate?.updateImageView()
                    })
                case .failure(let error):
                    self.delegate?.onError(error: error)
                }
            }
        })
    }
}
