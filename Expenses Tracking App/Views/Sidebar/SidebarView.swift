//
//  SidebarView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct SidebarView: View {
    @Binding var isSidebarOpen: Bool
    @Environment(\.dismiss) var dismiss
    @State private var isLoggedOut = false
    @State private var navigateToContentView = false
    
    //@ObservedObject var profileViewModel = ProfileViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            
            Image("appicon4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.bottom, 20)
                .blendMode(.color)

            // Add buttons for navigation
            /*NavigationLink(destination: ProfileView(viewModel: profileViewModel, isSidebarOpen: $isSidebarOpen), label: {
                Text("Profile")
            })
            .padding()*/
            
            NavigationLink(destination: ProfileView(viewModel: ProfileViewModel(), isSidebarOpen: $isSidebarOpen), label: {
                Text("Profile")
            })
            .padding()
            
            NavigationLink(destination: ExpenseTrackingView(viewModel: ExpenseTrackingViewModel())) {
                Text("Expense Tracking")
            }
            .padding()

            NavigationLink(destination: BudgetingView(viewModel: BudgetingViewModel())) {
                Text("Budgeting")
            }
            .padding()
            
            NavigationLink(destination: IncomeView(viewModel: IncomeViewModel())) {
                Text("Income")
            }
            .padding()

            NavigationLink(destination: ReportsAndAnalyticsView(viewModel: ReportsAndAnalyticsViewModel())) {
                Text("Reports and Analytics")
            }
            .padding()

            Button(action: {
                do {
                    try Auth.auth().signOut()
                    isSidebarOpen = false
                    isLoggedOut = true
                }
                catch {
                    print("Logout error: \(error.localizedDescription)")
                }
            }) {
                Text("Log Out")
            }
            .foregroundColor(.red)
            .padding()
            .alert(isPresented: $isLoggedOut) {
                Alert(title: Text("Log Out"),
                      message:  Text("Are you sure you want to log out?"),
                      primaryButton: .default(Text("Yes")) {
                        dismiss()
                        self.navigateToContentView = true
                    // Implement Navigation to the Login Screen
                      },
                      secondaryButton: .cancel()
                )
            }
            NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
                EmptyView()
            }
            
            Spacer()
        }
        .frame(width: 500)
        .background(Color.white)
        .shadow(radius: 10)
    }
}
