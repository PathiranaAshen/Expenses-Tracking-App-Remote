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
    
    func addExpense() {
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
