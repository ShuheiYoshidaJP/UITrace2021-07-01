//
//  LoginView.swift
//  UITrace2021年7月1日
//
//  Created by 吉田周平 on 2021/07/01.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 36)
            Text("Enter your name")
                .font(.headline)
            HStack {
                VStack {
                    TextField("", text: $viewModel.firstName)
                    HorizontalLine(color: .gray)
                    Text("first")
                        .foregroundColor(.gray)
                }
                .padding()
                VStack {
                    TextField("", text: $viewModel.lastName)
                    HorizontalLine(color: .gray)
                    Text("last")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            Button(action: {
                viewModel.isChecked.toggle()
            }, label: {
                Label("I'am 13 years or older", systemImage: viewModel.checkBoxImage)
                    .foregroundColor(.gray)
            })
            Spacer()
                .frame(height: 144)
            Button(action: {
            }, label: {
                Text("Sync contacts and continue")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(viewModel.bgColor)
                    .cornerRadius(24)
                    .padding(.horizontal)
            })
                .disabled(viewModel.continueButtonIsDisable)
            Button(action: {}, label: {
                Text("Continue without syncing contacts")
                    .foregroundColor(.gray)
            })
            Spacer()
        }
    }
}

class LoginViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var isChecked = true
    
    var checkBoxImage: String {
        return isChecked ? "square" : "checkmark.square"
    }
    
    var continueButtonIsDisable: Bool {
        return firstName.isEmpty || lastName.isEmpty || isChecked
    }
    
    var bgColor: Color {
        return continueButtonIsDisable ? .gray : .blue
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
