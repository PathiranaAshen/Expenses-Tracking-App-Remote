//
//  ExpenseTrackingViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-11.
//

import Foundation
import SwiftUI
import Firebase

class ExpenseTrackingViewModel: ObservableObject {
    @Published var date = Date()
    @Published var dateText = ""
    @Published var category = ""
    @Published var amount = ""
    @Published var description = ""
    @Published var location = ""
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    func addExpense() {
        // Ensure there's a current user
        guard let currentUser = Auth.auth().currentUser else {
            self.alertMessage = "User not authenticated"
            self.showAlert = true
            return
        }
        
        // Retrieve the user's UID and email
        let uid = currentUser.uid
        let email = currentUser.email ?? ""

        // Create a dictionary with the data without the ID
        let data: [String: Any] = [
            "user_id": uid,
            "email": email,
            "date": date,
            "category": category,
            "amount": Double(amount) ?? 0.0,
            "description": description,
            "location": location
        ]

        // Reference to the Firestore database
        let db = Firestore.firestore()

        // Add a new document with an auto-generated ID to the "expense_tracking" collection
        var ref: DocumentReference? = nil
        ref = db.collection("expense_tracking").addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error)")
                self.alertMessage = "Failed to add expense"
                self.showAlert = true
            } else {
                // Update the document with the auto-generated ID
                let docID = ref!.documentID
                db.collection("expense_tracking").document(docID).updateData(["id": docID]) { error in
                    if let error = error {
                        print("Error updating document with ID: \(docID), error: \(error)")
                    } else {
                        print("Document updated with ID: \(docID)")
                        self.alertMessage = "Expense Added..."
                        self.showAlert = true
                    }
                }
            }

            // Clearing the input fields after adding expenses
            self.clearFields()
        }
    }
    
    func clearFields() {
        date = Date()
        dateText = ""
        category = ""
        amount = ""
        description = ""
        location = ""
    }
}
