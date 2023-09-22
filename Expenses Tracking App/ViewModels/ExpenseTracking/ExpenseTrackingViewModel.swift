//
//  ExpenseTrackingViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-11.
//

import Foundation
import SwiftUI

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
        showAlert = true
        alertMessage = "Expense Added..."
        // Clearing the input fields after adding expenses
        clearFields()
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
