//
//  ReportsAnalyticsModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation

struct ExpenseReport: Identifiable {
    var id = UUID()
    var category: String
    var amountSpent: Double
}

struct IncomeReport: Identifiable {
    var id = UUID()
    var source: String
    var amountEarned: Double
}
