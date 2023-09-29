//
//  ExpenseTrackingView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-11.
//

import Foundation
import SwiftUI

struct ExpenseTrackingView: View {
    @ObservedObject var viewModel: ExpenseTrackingViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding()
                
                TextField("Category", text: $viewModel.category)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Amount", text: $viewModel.amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()
                
                TextField("Description", text: $viewModel.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Location", text: $viewModel.location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                VStack(spacing: 10) { // Used HStack for equal button widths
                    Button("Add Expense") {
                        viewModel.addExpense()
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
            .navigationBarTitle("Expense Tracking")
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
            
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(""), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
            
        }
    }
}

struct ExpenseTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTrackingView(viewModel: ExpenseTrackingViewModel())
    }
}
