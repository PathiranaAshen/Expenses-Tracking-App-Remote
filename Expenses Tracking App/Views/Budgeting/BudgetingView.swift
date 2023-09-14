//
//  BudgetingView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-12.
//

import Foundation
import SwiftUI

struct BudgetingView: View {
    @ObservedObject var viewModel: BudgetingViewModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.categories) { category in
                        BudgetCategoryRow(category: category)
                    }
                }

                Button("Add Category") {
                    viewModel.addCategory()
                }
                .frame(maxWidth: 100)
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .navigationBarTitle("Budgeting")
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
        }
    }
}

struct BudgetingView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetingView(viewModel: BudgetingViewModel())
    }
}
