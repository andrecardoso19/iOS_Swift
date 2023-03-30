//
//  AddToCartButton.swift
//  Appetizers
//
//  Created by andre.aragao on 30/03/23.
//

import SwiftUI

struct AppetizerButton: View {
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerButton(title: "aaaaa")
    }
}
