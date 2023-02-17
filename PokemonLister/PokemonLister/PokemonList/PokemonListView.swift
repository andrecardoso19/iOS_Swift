//
//  HomeView.swift
//  PokemonLister
//
//  Created by andre.aragao on 26/01/23.
//

import Foundation
import UIKit

final class PokemonListView: UIView {
    var performGoToPokedex: (() -> Void) = { }
    
    private lazy var pokeLogoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "PokeLogo")
        view.backgroundColor = PokeColors.darkBlueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var kantoPokedexButton: UIButton = {
       let view = UIButton()
        view.backgroundColor = PokeColors.logoYellowColor
        view.layer.cornerRadius = 5
        view.setTitle("Visualizar Pokédex de Kanto", for: .normal)
        view.setTitleColor(PokeColors.lightBlueColor, for: .normal)
        view.titleLabel?.font = .boldSystemFont(ofSize: 17)
        view.addTarget(self, action: #selector(goToPokedex), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupLayoutConstraints()
        self.backgroundColor = PokeColors.darkBlueColor
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(pokeLogoImageView)
        self.addSubview(kantoPokedexButton)
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            pokeLogoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pokeLogoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pokeLogoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            pokeLogoImageView.heightAnchor.constraint(equalTo: pokeLogoImageView.widthAnchor, multiplier: 0.366),
            
            kantoPokedexButton.widthAnchor.constraint(equalTo: pokeLogoImageView.widthAnchor, multiplier: 0.9),
            kantoPokedexButton.centerXAnchor.constraint(equalTo: pokeLogoImageView.centerXAnchor),
            kantoPokedexButton.topAnchor.constraint(equalTo: pokeLogoImageView.bottomAnchor, constant: 25),
            kantoPokedexButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func goToPokedex() {
        performGoToPokedex()
    }
}
