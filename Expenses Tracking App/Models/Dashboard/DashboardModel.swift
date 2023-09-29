//
//  DashboardModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

/*import Foundation

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
}*/

import Foundation

struct DashboardModel {
    var income: Double = 0.0
    var expenses: Double = 0.0
    var budget: Double = 0.0
    var savings: Double {
        return income - expenses
    }
    var savingsPercentage: Double {
        (savings / income) * 100
    }
}
