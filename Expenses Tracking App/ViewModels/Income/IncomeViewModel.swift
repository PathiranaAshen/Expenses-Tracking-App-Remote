//
//  IncomeViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-28.
//

import Foundation
import SwiftUI
//import Firebase

class IncomeViewModel: ObservableObject {
    @Published var income = ""
    @Published var amount = ""
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    /*func addIncome() {
        // Ensure there's a current user
        guard let currentUser = Auth.auth().currentUser else {
            self.alertMessage = "User not authenticated"
            self.showAlert = true
            return
        }
        
        // Retrieve the user's UID and email
        let uid = currentUser.uid
        let email = currentUser.email ?? ""

        // Create a dictionary with the data you want to insert (excluding the ID)
        let data: [String: Any] = [
            "user_id": uid,
            "email": email,
            "income": income,
            "amount": Double(amount) ?? 0.0
        ]

        // Reference to the Firestore database
        let db = Firestore.firestore()

        // Add a new document with an auto-generated ID to the "expense_tracking" collection
        var ref: DocumentReference? = nil
        ref = db.collection("income").addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error)")
                self.alertMessage = "Failed to add income"
                self.showAlert = true
            } else {
                // Update the document with the auto-generated ID
                let docID = ref!.documentID
                db.collection("income").document(docID).updateData(["id": docID]) { error in
                    if let error = error {
                        print("Error updating document with ID: \(docID), error: \(error)")
                    } else {
                        print("Document updated with ID: \(docID)")
                        self.alertMessage = "Income Added..."
                        self.showAlert = true
                    }
                }
            }

            // Clearing the input fields after adding expenses
            self.clearFields()
        }
    }*/
    
    func clearFields() {
        income = ""
        amount = ""
    }
}
