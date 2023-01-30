//
//  ViewController.swift
//  PokemonLister
//
//  Created by andre.aragao on 26/01/23.
//

import UIKit

class PokemonListViewController: UIViewController {
    let viewModel: PokemonListViewModel
    var pokemonListView = PokemonListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    init(viewModel: PokemonListViewModel = PokemonListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.setupView()
        self.view = pokemonListView
        self.viewModel.errorDelegate = self
        self.viewModel.getPokemonList()
    }
    
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
        let vc = PokedexListViewController(viewModel: self.viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Houve um erro ao carregar informações", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}

extension PokemonListViewController: ErrorDelegate {
    func onError() {
        self.showAlert()
    }
}
