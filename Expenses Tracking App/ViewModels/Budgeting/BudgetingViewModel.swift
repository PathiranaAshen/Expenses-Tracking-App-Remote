//
//  BudgetingViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-12.
//

import Foundation
import SwiftUI
import Firebase

class BudgetingViewModel: ObservableObject {
    @Published var category: String
    @Published var budgetAmount = ""
    @Published var period: String
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    @Published var userCategories: [String] = []
    
    init() {
        self.category = ""
        self.period = ""
        fetchUserCategories()
    }
    
    func addCategory() {
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
            "category": category,
            "budgetAmount": Double(budgetAmount) ?? 0.0,
            "period": period
        ]

        // Reference to the Firestore database
        let db = Firestore.firestore()

        // Add a new document with an auto-generated ID to the "expense_tracking" collection
        var ref: DocumentReference? = nil
        ref = db.collection("budgeting").addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error)")
                self.alertMessage = "Failed to add expense"
                self.showAlert = true
            } else {
                // Update the document with the auto-generated ID
                let docID = ref!.documentID
                db.collection("budgeting").document(docID).updateData(["id": docID]) { error in
                    if let error = error {
                        print("Error updating document with ID: \(docID), error: \(error)")
                    }
                    else {
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
        category = ""
        budgetAmount = ""
        period = ""
    }
    
    func fetchUserCategories() {
            // Ensure there's a current user
            guard let currentUser = Auth.auth().currentUser else {
                self.alertMessage = "User not authenticated"
                self.showAlert = true
                return
            }

            // Reference to the Firestore database
            let db = Firestore.firestore()

            // Query to retrieve categories for the current user
            db.collection("expense_tracking")
                .whereField("user_id", isEqualTo: currentUser.uid)
                .getDocuments { (querySnapshot, error) in
                    if let error = error {
                        print("Error fetching user categories: \(error)")
                    } else {
                        // Clear the existing userCategories
                        self.userCategories.removeAll()

                        // Add retrieved categories to the userCategories array
                        for document in querySnapshot?.documents ?? [] {
                            if let category = document["category"] as? String {
                                self.userCategories.append(category)
                            }
                        }
                    }
                }
        }
}

