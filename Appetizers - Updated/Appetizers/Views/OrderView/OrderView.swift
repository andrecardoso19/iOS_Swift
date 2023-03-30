//
//  OrderView.swift
//  Appetizers
//
//  Created by andre.aragao on 29/03/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    // list borderless
                    .listStyle(PlainListStyle())
                    
                    //iOS 15 modifiers
                    Button {
                        print("order placed")
                    } label: {
//                        AppetizerButton(title: "$ \(order.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$ \(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items. \nPlease add an appetizer")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
