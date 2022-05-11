//
//  Client.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation

struct Client {
    var name: String
    var cpf: String
    var birthDate: String
    var email: String
    var monthlyIncome: String
    var netWorth: String
}

//var clients: [Client] = [Client(name: "", cpf: "", birthDate: "", email: "", monthlyIncome: "", netWorth: "")]
var clients: [Client] = []

var editIndex = 0
