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
                
                HStack(spacing: 10) { // Used HStack for equal button widths
                    Button("Add Expense") {
                        viewModel.addExpense()
                    }
                    .frame(maxWidth: 100) // Ensure equal button widths
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    Button("Clear") {
                        viewModel.clearFields()
                    }
                    .frame(maxWidth: 100) // Ensure equal button widths
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationBarTitle("Expense Tracking")
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
        }
    }
}

struct ExpenseTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTrackingView(viewModel: ExpenseTrackingViewModel())
    }
}






/*
struct ExpenseTrackingView: View {
    @ObservedObject var viewModel: ExpenseTrackingViewModel
    @State private var isDatePickerVisible = false // State to control DatePicker visibility
    @State private var isDateSelected = false // State to track if a date is selected

    var body: some View {
        NavigationView {
            VStack {
                if isDatePickerVisible {
                    DatePicker("Date", selection: Binding(
                        get: { viewModel.date },
                        set: { newValue in
                            viewModel.date = newValue
                            isDatePickerVisible = false // Minimize DatePicker after date is selected
                            isDateSelected = true // Track that a date is selected
                        }
                    ), displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                } else {
                    Text(isDateSelected ? viewModel.dateText : "Tap to Select Date") // Display selected date or "Tap to Select Date"
                        .foregroundColor(.blue)
                        .onTapGesture {
                            isDatePickerVisible = true // Expand DatePicker when tapped
                            isDateSelected = false // Reset date selection when tapped
                        }
                }

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

                HStack(spacing: 10) {
                    Button("Add Expense") {
                        viewModel.addExpense()
                    }
                    .frame(maxWidth: 100) // Ensure equal button widths
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)

                    Button("Cancel") {
                        viewModel.clearFields()
                    }
                    .frame(maxWidth: 100) // Ensure equal button widths
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red) // Customize the button color as needed
                    .cornerRadius(10)
                }

                Spacer()
            }
            .navigationBarTitle("Expense Tracking")
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
        }
    }
}

struct ExpenseTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTrackingView(viewModel: ExpenseTrackingViewModel())
    }
}
*/




/*
struct ExpenseTrackingView: View {
    @ObservedObject var viewModel: ExpenseTrackingViewModel
    @State private var isDatePickerVisible = false // State to control DatePicker visibility
    @State private var isDateSelected = false // State to track if a date is selected

    var body: some View {
        NavigationView {
            VStack {
                if isDatePickerVisible {
                    DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .padding()
                        .onChange(of: viewModel.date) { _ in
                            isDatePickerVisible = false // Minimize DatePicker after date is selected
                            isDateSelected = true // Track that a date is selected
                        }
                } else {
                    Text(isDateSelected ? viewModel.dateText : "Tap to Select Date") // Display selected date or "Tap to Select Date"
                        .foregroundColor(.blue)
                        .onTapGesture {
                            isDatePickerVisible = true // Expand DatePicker when tapped
                            isDateSelected = false // Reset date selection when tapped
                        }
                }

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

                HStack(spacing: 10) {
                    Button("Add Expense") {
                        viewModel.addExpense()
                        isDatePickerVisible = false // Minimize DatePicker after adding expense
                    }
                    .frame(maxWidth: 100) // Ensure equal button widths
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)

                    Button("Cancel") {
                        viewModel.clearFields()
                    }
                    .frame(maxWidth: 100) // Ensure equal button widths
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red) // Customize the button color as needed
                    .cornerRadius(10)
                }

                Spacer()
            }
            .navigationBarTitle("Expense Tracking")
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
        }
    }
}

struct ExpenseTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTrackingView(viewModel: ExpenseTrackingViewModel())
    }
}
*/
