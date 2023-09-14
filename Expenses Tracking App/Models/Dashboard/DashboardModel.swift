//
//  DashboardModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation

struct DashboardModel {
    var income: Double
    var expenses: Double
    var savings: Double
    
    var total: Double {
        income - expenses
    }
    
    var savingsPercentage: Double {
        (savings / income) * 100
    }
}
