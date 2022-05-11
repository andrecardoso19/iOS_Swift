//
//  HomeHeaderView.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import UIKit

class HomeHeaderView: UIView {
    weak var viewModel: HomeViewModel?
    
    static let height: CGFloat = 300
    
    //MARK: - UIElements
    //MARK: - greetings, icon
    private lazy var greetingsLabel: UILabel = {
       let view = UILabel()
        view.text = "Olá TESTE"
        view.font = UIFont.boldSystemFont(ofSize: 28)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
       let view = UIImageView()
        view.tintColor = .systemPink
        view.image = UIImage(systemName: "person.circle.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Card
    private lazy var cardImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var balanceTitleLabel: UILabel = {
       let view = UILabel()
        view.text = "Saldo:"
        view.font = UIFont.systemFont(ofSize: 21)
        view.textColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var balanceAmountLabel: UILabel = {
         let view = UILabel()
         view.text = "R$999,99"
         view.font = UIFont.systemFont(ofSize: 21)
         view.textColor = .systemBackground
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
    }()
    
    private lazy var hideBalanceButton: UIButton = {
       let view = UIButton()
        let image = UIImage(systemName: "eye.fill")
        view.tintColor = .systemBackground
        view.setImage(image, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Fast Action Buttons
    private lazy var payBillsButton: UIButton = {
        let view = UIButton()
         view.layer.cornerRadius = 5
         view.setImage(UIImage(systemName: "barcode"), for: .normal)
         view.setTitle("Pagar", for: .normal)
         view.backgroundColor = .systemGray5
        view.tintColor = .systemPink
        view.setTitleColor(.systemPink, for: .normal)
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
    }()
    
    private lazy var pixButton: UIButton = {
        let view = UIButton()
         view.layer.cornerRadius = 5
         view.setImage(UIImage(systemName: "dpad.fill"), for: .normal)
         view.setTitle("Pix", for: .normal)
         view.backgroundColor = .systemGray5
        view.tintColor = .systemPink
        view.setTitleColor(.systemPink, for: .normal)
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
    }()
    
    private lazy var transferButton: UIButton = {
        let view = UIButton()
         view.layer.cornerRadius = 5
         view.setImage(UIImage(systemName: "dollarsign.circle.fill"), for: .normal)
         view.setTitle("Transferir", for: .normal)
         view.backgroundColor = .systemGray5
        view.tintColor = .systemPink
        view.setTitleColor(.systemPink, for: .normal)
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
    }()
    
    //MARK: - INIT
    init(){
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupVIew
    func setupView() {
        self.backgroundColor = .systemBackground
        self.addSubview(greetingsLabel)
        self.addSubview(iconImageView)
        self.addSubview(cardImageView)
        self.addSubview(balanceTitleLabel)
        self.addSubview(balanceAmountLabel)
        self.addSubview(hideBalanceButton)
        
        self.addSubview(pixButton)
        self.addSubview(payBillsButton)
        self.addSubview(transferButton)
    }
    
    //MARK: - SetupConstraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            greetingsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            iconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            iconImageView.centerYAnchor.constraint(equalTo: greetingsLabel.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalTo: greetingsLabel.heightAnchor),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            
            cardImageView.topAnchor.constraint(equalTo: greetingsLabel.bottomAnchor, constant: 10),
            cardImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            cardImageView.heightAnchor.constraint(equalTo: cardImageView.widthAnchor, multiplier: 0.5),
            
            //card details
            balanceTitleLabel.topAnchor.constraint(equalTo: cardImageView.topAnchor, constant: 10),
            balanceTitleLabel.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor, constant: 10),
            
            balanceAmountLabel.centerYAnchor.constraint(equalTo: cardImageView.centerYAnchor),
            balanceAmountLabel.leadingAnchor.constraint(equalTo: balanceTitleLabel.leadingAnchor, constant: 10),
            
            hideBalanceButton.topAnchor.constraint(equalTo: cardImageView.topAnchor, constant: 10),
            hideBalanceButton.trailingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: -10),
            
            payBillsButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.28),
            payBillsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            payBillsButton.heightAnchor.constraint(equalToConstant: 50),
            payBillsButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 10),
            
            pixButton.widthAnchor.constraint(equalTo: payBillsButton.widthAnchor),
            pixButton.centerYAnchor.constraint(equalTo: payBillsButton.centerYAnchor),
            pixButton.heightAnchor.constraint(equalTo: payBillsButton.heightAnchor),
            pixButton.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor),
            
            transferButton.widthAnchor.constraint(equalTo: payBillsButton.widthAnchor),
            transferButton.centerYAnchor.constraint(equalTo: payBillsButton.centerYAnchor),
            transferButton.heightAnchor.constraint(equalTo: payBillsButton.heightAnchor),
            transferButton.trailingAnchor.constraint(equalTo: cardImageView.trailingAnchor)
        ])
    }
    
    //MARK: - Button Perform
    
}
