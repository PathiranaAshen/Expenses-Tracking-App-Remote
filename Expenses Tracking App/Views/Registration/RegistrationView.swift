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
        NavigationView {
            VStack {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Register") {
                    viewModel.registerUser()
                }
                .frame(maxWidth: 100)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                Spacer()
            }
            .navigationBarTitle("Registration")
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))            /*.background(Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)))*/
        }
    }
}





/*struct RegistrationView: View {
    @ObservedObject var viewModel: RegistrationViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Registration")) {
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .accessibilityLabel("Email")
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .accessibilityLabel("Password")
                    
                    SecureField("Confirm Password", text: $viewModel.confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .accessibilityLabel("Confirm Password")
                }
                
                Section {
                    Button("Register") {
                        viewModel.registerUser()
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .accessibilityLabel("Register")
                }
            }
            .navigationBarTitle("Registration")
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}*/

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: RegistrationViewModel())
    }
}
