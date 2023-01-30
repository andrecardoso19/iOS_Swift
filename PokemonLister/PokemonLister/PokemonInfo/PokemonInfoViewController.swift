//
//  PokemonInfoViewController.swift
//  PokemonLister
//
//  Created by andre.aragao on 30/01/23.
//

import Foundation
import UIKit

class PokemonInfoViewController: UIViewController {
    let viewModel: PokemonInfoViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    init(viewModel: PokemonInfoViewModel = PokemonInfoViewModel(pokemonUrl: ""), pokemonUrl: String) {
        self.viewModel = viewModel
        self.viewModel.pokemonUrl = pokemonUrl
        super.init(nibName: nil, bundle: nil)
        print(self.viewModel.pokemonUrl)
//        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
