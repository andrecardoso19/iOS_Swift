//
//  RegisterViewModel.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
import UIKit
import CoreData

//MARK: - Protocols
protocol RegisterViewModelDelegate: AnyObject {
    //Necessary to display alert/reloadData on View Controller
    func displayAlert(title: String, message: String)
    func displayAlertWithAction(title: String, message: String)
    func onSuccessPopView()
}

protocol RegisterViewModeling {
    var delegate: RegisterViewModelDelegate? { get set }
    
    func displayAlert(title: String, message: String)
    func displayAlertWithAction(title: String, message: String)
    func popViewController()
}

//MARK: - Struct, Class
struct RegisterData {
    let title: String
    let placeholder: String
    var keyboardType: UIKeyboardType = .default
}

final class RegisterViewModel {
    private let service = CoreDataService()
    weak var delegate: RegisterViewModelDelegate?
    
    // MARK: - Register INIT
    lazy var registerInformation: [RegisterData] = [
        .init(title: "Nome", placeholder: "Ex.: João da Silva"),
        .init(title: "CPF", placeholder: "Ex.: 000.000.000-00", keyboardType: .numberPad),
        .init(title: "Data de Nascimento", placeholder: "Ex.: 01/01/2000"),
        .init(title: "E-mail", placeholder: "Ex.: joao.silva@email.com"),
        .init(title: "Renda Mensal", placeholder: "Ex.: 999,99", keyboardType: .numberPad),
        .init(title: "Patrimônio Liquido", placeholder: "Ex.: 999,99", keyboardType: .numberPad)
    ]
    
//    SAÍ PARA ALMOÇAR
    
    // MARK: - New Client attributes and Add Functions
    var newClientName = ""
    var newClientCpf = ""
    var newClientBirthDate = ""
    var newClientEmail = ""
    var newClientMonthlyIncome = ""
    var newClientNetWorth = ""
    
    func addNewClient(){
        let newClient = Client(name: newClientName, cpf: newClientCpf, birthDate: newClientBirthDate, email: newClientEmail, monthlyIncome: newClientMonthlyIncome, netWorth: newClientNetWorth)
        let verify = verifyTf()
        let verifyEmail = verifyEmail(email: newClient.email)
        let verifyCpf = verifyCpf(cpf: newClientCpf)
        
        // for tests below
        //let verify = true
        //let verifyEmail = true
        //let verifyCpf = true
        
        if verify == true && verifyEmail == true && verifyCpf == true{
            clients.append(newClient)
            service.addClient(newClient: newClient)
            
            displayAlertWithAction(title: "Sucsso", message: "Cadastro concluído!")
            popViewController()
            
            print(newClient)
        }
    }
    
    // MARK: - Register Verify
    func verifyTf() -> Bool {
        let valuesTyped: [String] = [newClientName, newClientCpf, newClientEmail, newClientBirthDate, String(newClientMonthlyIncome), newClientNetWorth]
        
        for i in 0...valuesTyped.count-1{
            print("indice: \(i), valor: \(valuesTyped[i])")
            if valuesTyped[i] == "" || valuesTyped[i]  == "0.0"{
                self.delegate?.displayAlert(title: "Erro", message: "Preencha todos os Campos")
                return false
            }
        }
        return true
    }
    
    func verifyCpf(cpf: String) -> Bool {
        let cpfVerify = cpf.isValidCPF
        
        for i in 0...clients.count-1{
            if newClientCpf == clients[i].cpf {
                self.delegate?.displayAlert(title: "Erro", message: "CPF já cadastrado")
                return false
            }
        }
        
        if cpfVerify == true {
            return true
        } else {
            self.delegate?.displayAlert(title: "Erro", message: "CPF Inválido")
            return false
        }
    }
    
    func verifyEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let validate = emailPred.evaluate(with: email)
        
        if validate == true {
            return true
        } else {
            self.delegate?.displayAlert(title: "Erro", message: "E-mail Inválido")
            return false
        }
    }
    
    func verifyDate(date: Date) -> Bool{
        let date = date
        
        let minAge: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!;
        print(minAge)
        let maxAge: Date = Calendar.current.date(byAdding: .year, value: -120, to: Date())!;
        print(maxAge)
        
        if date >= minAge || date <= maxAge {
            self.delegate?.displayAlert(title: "Erro", message: "Idade Inválida, a idade mínima é 18 anos e a máxima 120 anos")
            newClientBirthDate = ""
            return false
        } else {
            return true
        }
    }

}

//MARK: - CPF validation
extension Collection where Element == Int {
    var digitoCPF: Int {
        var number = count + 2
        let digit = 11 - reduce(into: 0) {
            number -= 1
            $0 += $1 * number
        } % 11
        return digit > 9 ? 0 : digit
    }
}

extension StringProtocol {
    var isValidCPF: Bool {
        let numbers = compactMap(\.wholeNumberValue)
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        return numbers.prefix(9).digitoCPF == numbers[9] &&
               numbers.prefix(10).digitoCPF == numbers[10]
    }
}

//MARK: - RegisterViewModelin Extension
extension RegisterViewModel: RegisterViewModeling {
    
    func popViewController() {
        self.delegate?.onSuccessPopView()
    }
    
    
    func displayAlert(title: String, message: String) {
        delegate?.displayAlert(title: title, message: message)
    }
    
    func displayAlertWithAction(title: String, message: String) {
        delegate?.displayAlertWithAction(title: title, message: message)
    }
}
