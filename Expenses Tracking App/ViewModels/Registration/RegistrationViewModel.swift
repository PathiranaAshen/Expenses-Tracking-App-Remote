//
//  RegistrationViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-08.
//

import Foundation
import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    func registerUser() {
        
        if password == confirmPassword {
            
        }
        else {
            
        }
        
    }
}
