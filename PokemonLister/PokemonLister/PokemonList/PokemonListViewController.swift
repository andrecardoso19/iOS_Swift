//
//  ViewController.swift
//  PokemonLister
//
//  Created by andre.aragao on 26/01/23.
//

import UIKit

final class PokemonListViewController: UIViewController {
    private var viewModel: PokemonListViewModeling
    private var pokemonListView = PokemonListView()

    init(viewModel: PokemonListViewModeling = PokemonListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.setupView()
        self.view = pokemonListView
        self.viewModel.delegate = self
        self.viewModel.getPokemonList()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        pokemonListView.performGoToPokedex = { [weak self] in
            guard let self = self else { return }
            self.performGoToPokedex()
        }
    }
    
    private func performGoToPokedex() {
        let vc = PokedexListViewController(viewModel: PokedexListViewModel(pokedex: viewModel.pokedex))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showAlert(error: PokedexError) {
        let alert = UIAlertController(title: "Error", message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension PokemonListViewController: PokemonListViewModelDelegate {
    func onSuccess() {
        
    }
    
    func onError(error: PokedexError) {
        self.showAlert(error: error)
    }
}
