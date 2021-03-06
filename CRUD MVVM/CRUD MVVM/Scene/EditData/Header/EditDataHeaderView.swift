//
//  EditDataHeaderView.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/4/22.
//

import UIKit

class EditDataHeaderView: UIView {
    weak var viewModel: EditDataViewModel?

    static let height: CGFloat = 40
    
    private lazy var titleLabel: UILabel = {
       let view = UILabel()
        view.text = "Editar"
        view.font = UIFont.boldSystemFont(ofSize: 24)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var deleteButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Excluir", for: .normal)
        let color: UIColor = .systemRed
        view.setTitleColor(color, for: .normal)
        view.addTarget(self, action: #selector(performDelete), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        setupView()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(titleLabel)
        self.addSubview(deleteButton)
    }
    
    func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            
            deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            deleteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant:90)
        ])
    }
    
    @objc func performDelete(){
        viewModel?.displayAlertWithAction(title: "Deletar", message: "Você está prestes a deletar um registro, Tem certeza?")
    }
    
}
