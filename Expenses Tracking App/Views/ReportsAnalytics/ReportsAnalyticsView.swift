//
//  ReportsAnalyticsView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation
import SwiftUI

struct ReportsAndAnalyticsView: View {
    @ObservedObject var viewModel: ReportsAndAnalyticsViewModel

    var body: some View {
        NavigationView {
            VStack {
                /*Text("Reports and Analytics")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)*/

                // Display Expense Reports
                VStack(alignment: .leading) {
                    Text("Expense Reports")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 10)
                    
                    List(viewModel.expenseReports) { report in
                        HStack {
                            Text(report.category)
                            Spacer()
                            Text("$\(report.amountSpent, specifier: "%.2f")")
                        }
                    }
                }
                .padding()
                
                // Display Income Reports
                VStack(alignment: .leading) {
                    Text("Income Reports")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 10)
                    
                    List(viewModel.incomeReports) { report in
                        HStack {
                            Text(report.source)
                            Spacer()
                            Text("$\(report.amountEarned, specifier: "%.2f")")
                        }
                    }
                }
                .padding()

                Spacer()
            }
            .navigationBarTitle("Reports and Analytics")
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
        }
    }
}

struct ReportsAndAnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsAndAnalyticsView(viewModel: ReportsAndAnalyticsViewModel())
    }
}
