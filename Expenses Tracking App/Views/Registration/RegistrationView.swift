//
//  RegistrationView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-08.
//

import Foundation
import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: RegistrationViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("appicon4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                    .blendMode(.color)
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                
                TextField("Full Name", text: $viewModel.fullname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                
                Button("Register") {
                    viewModel.registerUser()
                }
                .frame(maxWidth: 326)
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .fontWeight(.heavy)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Registration"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Ok")))
                }
                
                // Navigate to LoginView after Registering success
                NavigationLink(destination: LoginView(viewModel: LoginViewModel()), isActive: $viewModel.isNavigationActive) {
                    EmptyView()
                }
                .hidden()
                
                Spacer()
            }
            .navigationBarTitle("Registration")
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: RegistrationViewModel())
    }
}



















