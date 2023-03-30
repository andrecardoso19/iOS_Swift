//
//  ContentView.swift
//  Appetizers
//
//  Created by andre.aragao on 29/03/23.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.items.count)
        }
        //iOS 15 update accent color in assets
//        .tint(.brandPrimary)
    }
}
