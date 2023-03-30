//
//  AppetizersView.swift
//  Appetizers
//
//  Created by andre.aragao on 29/03/23.
//

import SwiftUI

struct AppetizersListView: View {
    @StateObject var viewModel = AppetizersListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                    // iOS 15
                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                //iOS 15 changes edthe default
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail ? true : false)
            }
//            .onAppear {
//                viewModel.getAppetizers()
//            }
            //iOS 15, it goes to async, if user "cancels" the transition of view, it is cancelled too
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        // deprecated
        .alert(item: $viewModel.alertItem) { alertItem  in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
    
}

struct AppetizersView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
