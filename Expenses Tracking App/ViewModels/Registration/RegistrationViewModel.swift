//
//  RegistrationViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-08.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

/*protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}*/

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var fullname: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    @Published var isNavigationActive = false // Flag to control navigation

    func navigateToLoginView() {
        isNavigationActive = true
    }
    
    func registerUser() {
        if password == confirmPassword {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    self.alertMessage = "Error registering user: \(error.localizedDescription)"
                    self.showAlert = true
                }
                else if let result = result {
                    self.showAlert = true
                    
                    let userId = result.user.uid
                    
                    //Storing User data in Firestore
                    let db = Firestore.firestore()
                    let userCollection = db.collection("User")
                    let userData = [
                        "user_id": userId,
                        "email": self.email,
                        "fullname": self.fullname,
                        "password": self.password
                    ]
                    userCollection.document(result.user.uid).setData(userData) { error in
                        if let error = error {
                            self.alertMessage = "Error saving user: \(error.localizedDescription)"
                        }
                        else {
                            self.alertMessage = "User registered successfully"
                            
                            self.navigateToLoginView()
                        }
                    }
                }
            }
        }
        else {
            self.alertMessage = "Passwords do not match"
            self.showAlert = true
        }
    }
}
