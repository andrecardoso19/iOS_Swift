//
//  AccountView.swift
//  Appetizers
//
//  Created by andre.aragao on 29/03/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    // iOS 15 focus (using to change textfield), .focused, .onSubmit
    @FocusState private var focusedTextField: FormTextField?
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                    // label of return
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("E-mail", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .submitLabel(.continue)
                    
//                    DatePicker("Birthday",
//                               selection: $viewModel.user.birthDate,
//                               displayedComponents: .date)
                    
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthDate,
                               in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                               displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
//                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentFills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("🤣 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

enum FormTextField {
    case firstName, lastName, email
}
