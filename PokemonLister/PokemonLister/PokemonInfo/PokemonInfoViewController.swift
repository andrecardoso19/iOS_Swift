//
//  PokemonInfoViewController.swift
//  PokemonLister
//
//  Created by andre.aragao on 30/01/23.
//

import Foundation
import UIKit

final class PokemonInfoViewController: UIViewController {
    private var viewModel: PokemonInfoViewModeling
    private let pokemonInfoView = PokemonInfoView()

    init(viewModel: PokemonInfoViewModeling = PokemonInfoViewModel(pokemonNumber: "")) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        setupView()
        self.view = pokemonInfoView
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        viewModel.getImage()
    }
    
    private func showAlert(error: PokedexError) {
        let alert = UIAlertController(title: "Error", message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension PokemonInfoViewController: PokemonInfoViewModelDelegate {
    func updateImageView() {
        pokemonInfoView.pokemonImageView.image = viewModel.pokemonImage
    }
    
    func onError(error: PokedexError) {
        self.showAlert(error: error)
    }
}
