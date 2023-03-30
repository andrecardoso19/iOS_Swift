//
//  LoadingView.swift
//  Appetizers
//
//  Created by andre.aragao on 29/03/23.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
            //iOS 15 update
//                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea()
            
//            ActivityIndicator()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}
