//
//  ProfileModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-22.
//

import Foundation
import FirebaseFirestoreSwift

struct UserProfile: Codable, Identifiable {
    var id: String
    var name: String
    var email: String
}
