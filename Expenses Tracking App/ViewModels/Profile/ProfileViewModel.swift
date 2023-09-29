//
//  ProfileViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""

    private var db = Firestore.firestore()
    private var userCollectionRef: CollectionReference

    init() {
        self.userCollectionRef = db.collection("User")

        // Fetch user data from Firestore
        fetchUserData()
    }

    private func fetchUserData() {
        if let userEmail = Auth.auth().currentUser?.email {
            userCollectionRef.whereField("email", isEqualTo: userEmail)
                .getDocuments { [weak self] (querySnapshot, error) in
                    if let error = error {
                        print("Error fetching user data: \(error.localizedDescription)")
                        return
                    }

                    if let document = querySnapshot?.documents.first {
                        let data = document.data()
                        self?.name = data["fullname"] as? String ?? ""
                        self?.email = data["email"] as? String ?? ""
                    }
                }
        }
    }
}

