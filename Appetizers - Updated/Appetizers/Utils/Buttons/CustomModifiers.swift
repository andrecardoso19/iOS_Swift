//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by andre.aragao on 30/03/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
