//
//  BudgetCategoryRow.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-12.
//

import Foundation
import SwiftUI

struct BudgetCategoryRow: View {
    @ObservedObject var category: Category

    var body: some View {
        VStack {
            Text("Category")
                .font(.headline)
                .padding(.top)
            
            TextField("Category", text: $category.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            VStack {
                Text("Budget Amount")
                    .font(.headline)
                    .padding(.top)
                
                TextField("Budget Amount", value: $category.budgetAmount, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()

                Text("Period")
                    .font(.headline)
                    .padding(.top)
                
                Picker("Period", selection: $category.period) {
                    Text("Weekly").tag(BudgetPeriod.weekly)
                    Text("Monthly").tag(BudgetPeriod.monthly)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

struct BudgetCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        BudgetCategoryRow(category: Category(name: "", budgetAmount: 0.0, period: .monthly))
    }
}
