//
//  ListViewModel.swift
//  Appetizers
//
//  Created by andre.aragao on 29/03/23.
//

import Foundation

// @MainActor everything UI related will go to main thread
@MainActor final class AppetizersListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidURL
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    // iOS 15
    func getAppetizers() {
        isLoading = true
        
        // async contexxt, no need of weak self
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                // if its a APError, show specific alert, else: generic error
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
