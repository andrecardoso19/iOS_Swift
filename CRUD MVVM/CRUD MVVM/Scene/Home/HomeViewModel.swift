//
//  HomeViewModel.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import Foundation
//MARK: - protocol
protocol HomeViewModelDelegate: AnyObject {
    
}

protocol HomeViewModeling {
    
}

struct OptionData{
    let imageTile: String
    let optionTitle: String
}

//MARK: - Class
final class HomeViewModel {
    // MARK: - init
    var optionInformation: [OptionData] = [
        .init(imageTile: "creditcard", optionTitle: "Meus Cartões"),
        .init(imageTile: "dollarsign.circle", optionTitle: "Empréstimos"),
        .init(imageTile: "iphone", optionTitle: "Recarga de celular"),
        .init(imageTile: "bag", optionTitle: "FourShopping"),
        .init(imageTile: "heart.text.square", optionTitle: "Seguro"),
    ]
    
    weak var delegate: HomeViewModelDelegate?
}
