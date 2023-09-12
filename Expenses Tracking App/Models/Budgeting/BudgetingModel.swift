//
//  BudgetingModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-12.
//

import Foundation
import SwiftUI

class Category: Identifiable, ObservableObject {
    var id = UUID()
    var name: String
    @Published var budgetAmount: Double
    var period: BudgetPeriod

    init(name: String, budgetAmount: Double, period: BudgetPeriod) {
        self.name = name
        self.budgetAmount = budgetAmount
        self.period = period
    }
}

enum BudgetPeriod {
    case weekly
    case monthly
}
