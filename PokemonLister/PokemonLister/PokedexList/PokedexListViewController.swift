//
//  PokedexListViewController.swift
//  PokemonLister
//
//  Created by andre.aragao on 27/01/23.
//

import Foundation
import UIKit

final class PokedexListViewController: UIViewController {
    private let viewModel: PokedexListViewModeling
    private var tableView = UITableView(frame: .zero, style: .grouped)
    
    init(viewModel: PokedexListViewModeling = PokedexListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "Kanto Pokédex"
        self.view.backgroundColor = PokeColors.darkBlueColor
        setupTableView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        self.view.addSubview(tableView)
        tableView.backgroundColor = PokeColors.darkBlueColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PokedexListTableViewCell.self, forCellReuseIdentifier: PokedexListTableViewCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
        tableView.reloadData()
    }
}

extension PokedexListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokedexListTableViewCell", for: indexPath) as? PokedexListTableViewCell else {
            return UITableViewCell()
            
        }
        
        let cellInfo = viewModel.pokedex
        
        cell.setupView(entryNumber: "\(cellInfo.pokemon_entries[indexPath.row].entry_number)", pokemonName: cellInfo.pokemon_entries[indexPath.row].pokemon_species.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokedex.pokemon_entries.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PokemonInfoViewController(viewModel: PokemonInfoViewModel(pokemonNumber: "\(viewModel.pokedex.pokemon_entries[indexPath.row].entry_number)"))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
