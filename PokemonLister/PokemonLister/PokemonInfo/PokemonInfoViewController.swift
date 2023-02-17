//
//  PokemonInfoViewController.swift
//  PokemonLister
//
//  Created by andre.aragao on 30/01/23.
//

import Foundation
import UIKit

final class PokemonInfoViewController: UIViewController {
    private let viewModel: PokemonInfoViewModeling
    private let pokemonInfoView = PokemonInfoView()

    init(viewModel: PokemonInfoViewModeling = PokemonInfoViewModel(pokemonUrl: "")) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view = pokemonInfoView
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
