//
//  LoginViewController.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
    
    //MARK: - UI Elements
    //Label
    private lazy var agencyLabel: UILabel = {
       let view = UILabel()
        view.textColor = .white
        view.text = "Agência com dígito"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accountLabel: UILabel = {
       let view = UILabel()
        view.textColor = .white
        view.text = "Conta com dígito"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //TextField
    private lazy var agencyTextField: UITextField = {
       let view = UITextField()
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.textColor = .systemPink
        view.placeholder = "0000-0"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardType = .decimalPad
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var accountTextField: UITextField = {
       let view = UITextField()
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.textColor = .systemPink
        view.placeholder = "00000000-0"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardType = .decimalPad
        view.layer.cornerRadius = 5
        return view
    }()
    
    // password label and textfield
    private lazy var passwordLabel: UILabel = {
       let view = UILabel()
        view.textColor = .white
        view.text = "Senha(6 Dígitos)"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
       let view = UITextField()
        view.placeholder = "******"
        view.borderStyle = .roundedRect
        view.textColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //button
    private lazy var loginButton: UIButton = {
       let view = UIButton()
        view.backgroundColor = .white
        view.tintColor = .systemPink
        view.setTitleColor(.tintColor, for: .normal)
        view.setTitle("Entrar", for: .normal)
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(performLogin), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    //MARK: - init
    init(){
        super.init(nibName: nil, bundle: nil)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupView
    private func setupView(){
        view.addSubview(agencyLabel)
        view.addSubview(accountLabel)
        view.addSubview(agencyTextField)
        view.addSubview(accountTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    //MARK: - Constraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            agencyLabel.topAnchor.constraint(equalTo: view.centerYAnchor),
            agencyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            accountLabel.topAnchor.constraint(equalTo: agencyLabel.topAnchor),
            accountLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            
            agencyTextField.topAnchor.constraint(equalTo: agencyLabel.bottomAnchor, constant: 5),
            agencyTextField.leadingAnchor.constraint(equalTo: agencyLabel.leadingAnchor),
            agencyTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            accountTextField.topAnchor.constraint(equalTo: agencyTextField.topAnchor),
            accountTextField.leadingAnchor.constraint(equalTo: accountLabel.leadingAnchor),
            accountTextField.widthAnchor.constraint(equalTo: agencyTextField.widthAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: agencyTextField.bottomAnchor, constant: 5),
            passwordLabel.leadingAnchor.constraint(equalTo: agencyTextField.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: accountTextField.trailingAnchor),
            
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10)
        ])
    }
    
    //MARK: - button perform
    @objc func performLogin(){
        self.onSuccessPush()
    }
}

//MARK: - Delegate
extension LoginViewController: LoginViewModelDelegate {
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    func onSuccessPush() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
