//
//  DashboardViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

/*import Foundation
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var dashboardData: DashboardModel
    
    init() {
        // Test with my sample data
        dashboardData = DashboardModel(income: 5000, expenses: 3000, savings: 2000)
    }
}*/

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class DashboardViewModel: ObservableObject {
    @Published var dashboardData: DashboardModel = DashboardModel()
    
    @Published var showAlert = false
    @Published var alertMessage = ""

    private var db = Firestore.firestore()

    init() {
        fetchDashboardData()
    }

    func fetchDashboardData() {
        guard let currentUser = Auth.auth().currentUser else {
            self.alertMessage = "User not authenticated"
            self.showAlert = true
            return
        }

        // Retrieve the user's UID
        let authenticatedUserId = currentUser.uid

        // Fetch expenses
        db.collection("expense_tracking")
            .whereField("user_id", isEqualTo: authenticatedUserId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error fetching expenses: \(error)")
                } else {
                    let totalExpense = querySnapshot?.documents.compactMap { document -> Double? in
                        let data = document.data()
                        if let amount = data["amount"] as? Double {
                            return amount
                        }
                        return nil
                    }.reduce(0.0, +) ?? 0.0
                    self.dashboardData.expenses = totalExpense
                }
            }

        // Fetch income
        db.collection("income")
            .whereField("user_id", isEqualTo: authenticatedUserId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error fetching income: \(error)")
                } else {
                    let totalIncome = querySnapshot?.documents.compactMap { document -> Double? in
                        let data = document.data()
                        if let amount = data["amount"] as? Double {
                            return amount
                        }
                        return nil
                    }.reduce(0.0, +) ?? 0.0
                    self.dashboardData.income = totalIncome
                }
            }

        // Fetch budget
        db.collection("budgeting")
            .whereField("user_id", isEqualTo: authenticatedUserId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error fetching budget: \(error)")
                } else {
                    let totalBudget = querySnapshot?.documents.compactMap { document -> Double? in
                        let data = document.data()
                        if let budgetAmount = data["budgetAmount"] as? Double {
                            return budgetAmount
                        }
                        return nil
                    }.reduce(0.0, +) ?? 0.0
                    self.dashboardData.budget = totalBudget
                }
            }
    }
}
