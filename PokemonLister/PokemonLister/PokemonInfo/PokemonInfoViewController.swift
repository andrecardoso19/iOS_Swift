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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    init(viewModel: PokemonInfoViewModeling = PokemonInfoViewModel(pokemonUrl: "")) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print(self.viewModel.pokemonUrl)
//        self.setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
