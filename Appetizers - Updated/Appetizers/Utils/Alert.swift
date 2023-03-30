//
//  Alert.swift
//  BarcodeScanner
//
//  Created by andre.aragao on 29/03/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData          = AlertItem(title: Text("Server Error"),
                                              message: Text("The data received from the server was invalid. Please contact support"),
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidResponse      = AlertItem(title: Text("Server Error"),
                                              message: Text("The data received from the server was invalid. Please try again later or contact support"),
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidURL           = AlertItem(title: Text("Server Error"),
                                              message: Text("There was a issua connecting to the server. Please try again"),
                                              dismissButton: .default(Text("Ok")))
    
    static let unableToComplete     = AlertItem(title: Text("Server Error"),
                                              message: Text("Unable to complete your request at this time. Please verify your connection"),
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidForm          = AlertItem(title: Text("Invalid Form"),
                                              message: Text("Please verify all fields"),
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidEmail       = AlertItem(title: Text("Invalid Email"),
                                              message: Text("Please enter a valid e-mail"),
                                              dismissButton: .default(Text("Ok")))
    
    static let userSaveSuccess       = AlertItem(title: Text("Profile Saved"),
                                              message: Text("Success"),
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidUserData       = AlertItem(title: Text("Profile Error"),
                                              message: Text("Failure on saving or retrieving your profile"),
                                              dismissButton: .default(Text("Ok")))
}
