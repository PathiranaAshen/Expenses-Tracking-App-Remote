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
    @State private var selectedCategory: String = ""
    @State private var selectedPeriod: String = "" 

    var body: some View {
        NavigationView {
            VStack {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(viewModel.userCategories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .onChange(of: selectedCategory) { newValue in
                    viewModel.category = newValue
                }
                
                TextField("Budget Amount", text: $viewModel.budgetAmount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()

                Picker("Period", selection: $selectedPeriod) {
                    Text("Weekly").tag("Weekly")
                    Text("Monthly").tag("Monthly")
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .onChange(of: selectedPeriod) { newValue in
                    viewModel.period = newValue
                }

                VStack(spacing: 10) {
                    Button("Add Category") {
                        viewModel.addCategory()
                    }
                    .frame(maxWidth: 326) // Ensure equal button widths
                    .frame(maxHeight: 20)
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .fontWeight(.heavy)

                    Button("Clear") {
                        viewModel.clearFields()
                    }
                    .frame(maxWidth: 326) // Ensure equal button widths
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
                    .fontWeight(.heavy)
                }
                Spacer()
            }
            .navigationBarTitle("Budgeting")
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(""), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
            .onAppear {
                viewModel.fetchUserCategories()
            }
        }
    }
}

struct BudgetingView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetingView(viewModel: BudgetingViewModel())
    }
}


