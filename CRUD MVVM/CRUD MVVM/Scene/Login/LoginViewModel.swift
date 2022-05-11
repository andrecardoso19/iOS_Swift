//
//  LoginViewModel.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func displayAlert(title: String, message: String)
    func onSuccessPush()
}

protocol LoginViewModeling {
    var delegate: LoginViewModelDelegate? { get set }
    
    func displayAlert(title: String, message: String)
    func pushViewController()
}

//MARK: - Class
final class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?
    
}

//MARK: Extension
extension LoginViewModel: LoginViewModeling {
    
    func displayAlert(title: String, message: String) {
        delegate?.displayAlert(title: title, message: message)
    }
    
    func pushViewController() {
        delegate?.onSuccessPush()
    }
    
}
