//
//  ReportsAnalyticsView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation
import SwiftUI
import Firebase

struct ReportsAndAnalyticsView: View {
    @ObservedObject var viewModel: ReportsAndAnalyticsViewModel

    var body: some View {
        NavigationView {
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                
                VStack(alignment: .leading) {
                    Text("Expense Reports")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 10)

                    if viewModel.isLoadingExpenseReports {
                        Text("Loading expense report...")
                            .foregroundColor(.gray)
                    } else if let error = viewModel.error {
                        Text("Error: \(error.localizedDescription)")
                            .foregroundColor(.red)
                    } else {
                        // Display one record
                        /*Text("Category: \(viewModel.expenseReports.first?.category ?? "")")
                        Text("Amount Spent: $\(viewModel.expenseReports.first?.amountSpent ?? 0.0, specifier: "%.2f")")*/
                        
                        // Display multiple records
                        ForEach(viewModel.expenseReports, id: \.self) { report in
                            Text("Category: \(report.category)")
                            Text("Amount Spent: Rs.\(report.amountSpent, specifier: "%.2f")")
                        }
                    }
                }
                .padding()
                )
                .padding()

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                
                VStack(alignment: .leading) {
                    Text("Income Reports")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 10)

                    if viewModel.isLoadingIncomeReports {
                        Text("Loading income report...")
                            .foregroundColor(.gray)
                    } else if let error = viewModel.error {
                        Text("Error: \(error.localizedDescription)")
                            .foregroundColor(.red)
                    } else {
                        // Display one record
                        /*Text("Source: \(viewModel.incomeReports.first?.source ?? "")")
                        Text("Amount Earned: $\(viewModel.incomeReports.first?.amountEarned ?? 0.0, specifier: "%.2f")")*/
                        
                        // Display multiple records
                        ForEach(viewModel.incomeReports, id: \.self) { report in
                            Text("Source: \(report.source)")
                            Text("Amount Earned: Rs.\(report.amountEarned, specifier: "%.2f")")
                        }
                    }
                }
                .padding()
                )
                .padding()

                Spacer()
            }
            .navigationBarTitle("Reports and Analytics")
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .onAppear {
            // Load data when the view appears
            viewModel.fetchExpenseReports()
            viewModel.fetchIncomeReports()
        }
    }
}

