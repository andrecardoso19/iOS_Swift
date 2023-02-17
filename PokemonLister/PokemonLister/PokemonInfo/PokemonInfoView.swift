//
//  PokemonInfoView.swift
//  PokemonLister
//
//  Created by andre.aragao on 17/02/23.
//

import Foundation
import UIKit

final class PokemonInfoView: UIView {
    var pokemonImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupLayoutConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = PokeColors.darkBlueColor
        addSubview(pokemonImageView)
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            pokemonImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            pokemonImageView.heightAnchor.constraint(equalTo: pokemonImageView.widthAnchor),
            pokemonImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pokemonImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
        ])
    }
}
