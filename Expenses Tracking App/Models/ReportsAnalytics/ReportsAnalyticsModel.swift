//
//  ReportsAnalyticsModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation

struct ExpenseReport: Hashable {
    let category: String
    let amountSpent: Double
}

struct IncomeReport: Hashable {
    let source: String
    let amountEarned: Double
}
