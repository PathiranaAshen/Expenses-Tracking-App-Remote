//
//  IncomeView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-28.
//

import Foundation
import SwiftUI

struct IncomeView: View {
    @ObservedObject var viewModel: IncomeViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Income", text: $viewModel.income)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Amount", text: $viewModel.amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()
                
                VStack(spacing: 10) { // Used HStack for equal button widths
                    Button("Add Income") {
                        //viewModel.addIncome()
                    }
                    .frame(maxWidth: 316) // Ensure equal button widths
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
                    .frame(maxWidth: 316) // Ensure equal button widths
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
                    .fontWeight(.heavy)
                }
                
                Spacer()
            }
            .navigationBarTitle("Income")
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

struct IncomeView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeView(viewModel: IncomeViewModel())
    }
}
