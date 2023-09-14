//
//  DashboardView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation
import SwiftUI

/*struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel
    @State private var isSidebarOpen = false // State to control sidebar visibility

    var body: some View {
        NavigationView {
            VStack {
                /*Text("Dashboard")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)*/

                // Display Income, Expenses, and Savings Cards
                VStack {
                    DashboardCard(title: "Income", value: viewModel.dashboardData.income, color: .green)
                    DashboardCard(title: "Expenses", value: viewModel.dashboardData.expenses, color: .red)
                    DashboardCard(title: "Savings", value: viewModel.dashboardData.savings, color: .blue)
                }
                .padding()

                // Display Total and Savings Percentage
                Text("Total: $\(viewModel.dashboardData.total, specifier: "%.2f")")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 10)

                Text("Savings Percentage: \(viewModel.dashboardData.savingsPercentage, specifier: "%.2f")%")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 10)

                Spacer()
            }
            .navigationBarTitle("Dashboard")
            .navigationBarItems(
                leading: SidebarView(isSidebarOpen: $isSidebarOpen),
                trailing: Button(action: {
                    withAnimation {
                        isSidebarOpen.toggle()
                    }
                }) {
                    Image(systemName: isSidebarOpen ? "xmark" : "line.horizontal.3")
                        .font(.title)
                        .padding()
                        .foregroundColor(.primary)
                }
            )
            .frame(maxWidth: .infinity)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel())
    }
}*/







struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel
    @State private var isSidebarOpen = false // State to control sidebar visibility

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    SidebarView(isSidebarOpen: $isSidebarOpen)
                        .frame(width: isSidebarOpen ? geometry.size.width * 0.6 : 0)
                        .background(Color.white)
                        .shadow(radius: 10)
                        .offset(x: isSidebarOpen ? 0 : -geometry.size.width * 0.6)

                    VStack {
                        Text("Welcome")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 20)
                        // Display Income, Expenses, and Savings Cards
                        VStack {
                            DashboardCard(title: "Income", value: viewModel.dashboardData.income, color: .green)
                            DashboardCard(title: "Expenses", value: viewModel.dashboardData.expenses, color: .red)
                            DashboardCard(title: "Savings", value: viewModel.dashboardData.savings, color: .blue)
                        }
                        .padding()

                        // Display Total and Savings Percentage
                        Text("Total: $\(viewModel.dashboardData.total, specifier: "%.2f")")
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 10)

                        Text("Savings Percentage: \(viewModel.dashboardData.savingsPercentage, specifier: "%.2f")%")
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 10)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(
                        gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                }
            }
            .navigationBarTitle("")
            .navigationBarItems(
                leading:
                    Button(action: {
                        withAnimation {
                            isSidebarOpen.toggle()
                        }
                    }) {
                        Image(systemName: isSidebarOpen ? "xmark" : "line.horizontal.3")
                            .font(.title)
                            .padding()
                            .foregroundColor(.primary)
                    }
            )
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel())
    }
}
