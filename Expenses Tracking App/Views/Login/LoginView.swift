//
//  LoginView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-10.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var isRegistrationViewPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                VStack(spacing: 30) { // Used a VStack for equal button widths
                    Button("Login") {
                        viewModel.loginUser()
                    }
                    .frame(maxWidth: 100) // Ensure equal button widths
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    Button("Register") {
                        isRegistrationViewPresented.toggle()
                    }
                    .frame(maxWidth: 100) // Ensure equal button widths
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationBarTitle("Login")
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
        }
        .sheet(isPresented: $isRegistrationViewPresented) {
            RegistrationView(viewModel: RegistrationViewModel())
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
