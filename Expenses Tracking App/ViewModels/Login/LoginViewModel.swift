//
//  LoginViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-10.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isNavigationActive = false // Flag to control navigation
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else {return}
            
            if let error = error {
                self.alertMessage = "Login failed: \(error.localizedDescription)"
                self.showAlert = true
            }
            else {
                // Authentication success, navigate to DashboardView
                self.navigateToDashboard()
            }
        }
    }
    
    func navigateToDashboard() {
        isNavigationActive = true
    }
}
