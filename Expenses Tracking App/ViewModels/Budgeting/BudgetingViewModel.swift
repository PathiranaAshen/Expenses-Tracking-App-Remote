//
//  BudgetingViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-12.
//

import Foundation
import Combine

class BudgetingViewModel: ObservableObject {
    @Published var categories: [Category] = []
    
    init() {
        // Initialize categories with default values or retrieve from a data source
        categories = [
            Category(name: "Groceries", budgetAmount: 500.0, period: .monthly),
            Category(name: "Entertainment", budgetAmount: 100.0, period: .monthly),
            Category(name: "Rent", budgetAmount: 1200.0, period: .monthly)
            // Add more categories if needed
        ]
    }
    
    func addCategory() {
        // Implement this function's code to save categories to a data source
    }
}
