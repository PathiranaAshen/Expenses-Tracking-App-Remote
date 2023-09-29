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
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                
                VStack(spacing: 30) { // Used a VStack for equal button widths
                    Button("Log in") {
                        viewModel.loginUser()
                    }
                    .frame(maxWidth: 326) // Ensure equal button widths
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .fontWeight(.heavy)
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text("Login"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Ok")))
                    }
                    
                    NavigationLink(destination: DashboardView(viewModel: DashboardViewModel()), isActive: $viewModel.isNavigationActive) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Text("Don't have an account, Sign Up below")
                        .font(.subheadline)
                        .padding()
                        
                    Button("Register") {
                        isRegistrationViewPresented.toggle()
                    }
                    .frame(maxWidth: 326) // Ensure equal button widths
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    .fontWeight(.heavy)
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
