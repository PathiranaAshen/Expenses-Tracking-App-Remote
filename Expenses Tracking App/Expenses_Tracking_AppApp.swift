//
//  Expenses_Tracking_AppApp.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-02.
//

import SwiftUI

@main
struct Expenses_Tracking_AppApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //LoginView(viewModel: LoginViewModel())
            DashboardView(viewModel: DashboardViewModel())
            //ExpenseTrackingView(viewModel:  ExpenseTrackingViewModel())
            //BudgetingView(viewModel: BudgetingViewModel())
            //ReportsAndAnalyticsView(viewModel:  ReportsAndAnalyticsViewModel())
        }
    }
}
