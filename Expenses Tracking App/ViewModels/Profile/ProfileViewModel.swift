//
//  ProfileViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-22.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var user: UserProfile
    
    init(user: UserProfile) {
        self.user = user
    }
    
    // Add functions to update the user's profile information as needed
}
