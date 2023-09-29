//
//  ReportsAnalyticsViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation
import Firebase

class ReportsAndAnalyticsViewModel: ObservableObject {
    @Published var isLoadingExpenseReports = false
    @Published var isLoadingIncomeReports = false
    @Published var error: Error?
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    @Published var expenseReports: [ExpenseReport] = []
    @Published var incomeReports: [IncomeReport] = []
    
    private var expenseListener: ListenerRegistration?
    private var incomeListener: ListenerRegistration?
    
    init() {
        fetchExpenseReports()
        fetchIncomeReports()
    }
    
    deinit {
        expenseListener?.remove()
        incomeListener?.remove()
    }
    
    func fetchExpenseReports() {
        isLoadingExpenseReports = true
        let expenseCollection = Firestore.firestore().collection("expense_tracking")
        
        guard let currentUser = Auth.auth().currentUser else {
            self.alertMessage = "User not authenticated"
            self.showAlert = true
            return
        }

        // Retrieve the user's UID
        let userId = currentUser.uid
        
        expenseListener = expenseCollection.whereField("user_id", isEqualTo: userId).addSnapshotListener { (querySnapshot, error) in
            self.isLoadingExpenseReports = false
            if let error = error {
                self.error = error
                return
            }
            
            var reports: [ExpenseReport] = []
            for document in querySnapshot?.documents ?? [] {
                if let category = document["category"] as? String,
                   let amountSpent = document["amount"] as? Double {
                    let report = ExpenseReport(category: category, amountSpent: amountSpent)
                    reports.append(report)
                }
            }
            self.expenseReports = reports
        }
    }
    
    func fetchIncomeReports() {
        isLoadingIncomeReports = true
        let incomeCollection = Firestore.firestore().collection("income")
        
        guard let currentUser = Auth.auth().currentUser else {
            self.alertMessage = "User not authenticated"
            self.showAlert = true
            return
        }

        // Retrieve the user's UID
        let userId = currentUser.uid
        
        incomeListener = incomeCollection.whereField("user_id", isEqualTo: userId).addSnapshotListener { (querySnapshot, error) in
            self.isLoadingIncomeReports = false
            if let error = error {
                self.error = error
                return
            }
            
            var reports: [IncomeReport] = []
            for document in querySnapshot?.documents ?? [] {
                if let source = document["income"] as? String,
                   let amountEarned = document["amount"] as? Double {
                    let report = IncomeReport(source: source, amountEarned: amountEarned)
                    reports.append(report)
                }
            }
            self.incomeReports = reports
        }
    }
}


