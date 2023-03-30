//
//  XDismissButton.swift
//  Appetizers
//
//  Created by andre.aragao on 30/03/23.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .frame(width: 40, height: 40)
                .tint(.brandPrimary)
        }
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}
