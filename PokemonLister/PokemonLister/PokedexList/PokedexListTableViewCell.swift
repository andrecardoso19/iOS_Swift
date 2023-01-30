//
//  PokedexListTableViewCell.swift
//  PokemonLister
//
//  Created by andre.aragao on 27/01/23.
//

import Foundation
import UIKit

final class PokedexListTableViewCell: UITableViewCell {
    static let reuseId = "PokedexListTableViewCell"
    
    private lazy var entryNumberLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20)
        view.textColor = PokeColors.logoYellowColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pokemonNameLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20)
        view.textColor = PokeColors.logoYellowColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = PokeColors.darkBlueColor
        
        setupSubviews()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(entryNumber: String, pokemonName: String) {
        entryNumberLabel.text = entryNumber
        pokemonNameLabel.text = pokemonName
    }
    
    private func setupSubviews() {
        self.contentView.addSubview(entryNumberLabel)
        self.contentView.addSubview(pokemonNameLabel)
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            entryNumberLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            entryNumberLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            entryNumberLabel.widthAnchor.constraint(equalToConstant: 50),
            
            pokemonNameLabel.leadingAnchor.constraint(equalTo: entryNumberLabel.trailingAnchor),
            pokemonNameLabel.centerYAnchor.constraint(equalTo: entryNumberLabel.centerYAnchor)
        ])
    }
}
