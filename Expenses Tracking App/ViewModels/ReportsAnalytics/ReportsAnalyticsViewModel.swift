//
//  ReportsAnalyticsViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation
import SwiftUI

class ReportsAndAnalyticsViewModel: ObservableObject {
    @Published var expenseReports: [ExpenseReport] = []
    @Published var incomeReports: [IncomeReport] = []

    // Add logic here to update and fetch the reports
    
    init() {
        // Example data for testing purposes
        expenseReports = [
            ExpenseReport(category: "Groceries", amountSpent: 250.0),
            ExpenseReport(category: "Entertainment", amountSpent: 100.0),
            ExpenseReport(category: "Rent", amountSpent: 1200.0),
        ]
        
        incomeReports = [
            IncomeReport(source: "Salary", amountEarned: 3500.0),
            IncomeReport(source: "Freelance Work", amountEarned: 800.0),
        ]
    }
}
