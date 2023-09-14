//
//  DashboardViewModel.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var dashboardData: DashboardModel
    
    init() {
        // Test with my sample data
        dashboardData = DashboardModel(income: 5000, expenses: 3000, savings: 2000)
    }
}
