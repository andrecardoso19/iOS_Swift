//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by andre.aragao on 29/03/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            // every child of tabview will have access to order
            AppetizerTabView().environmentObject(order)
        }
    }
}
