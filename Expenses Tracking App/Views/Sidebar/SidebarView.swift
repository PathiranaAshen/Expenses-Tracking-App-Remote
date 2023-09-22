//
//  SidebarView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation
import SwiftUI

struct SidebarView: View {
    @Binding var isSidebarOpen: Bool
    @Environment(\.dismiss) var dismiss
    @State private var isLoggedOut = false

    var body: some View {
        VStack(alignment: .leading) {
            
            /*Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding()
                .alignmentGuide(.trailing) { _ in
                    return -10
                }*/
            
            Image("appicon4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.bottom, 20)
                .blendMode(.color)

            // Add buttons for navigation
            NavigationLink(destination: ProfileView(viewModel: ProfileViewModel(user: UserProfile(id: "1", name: "Ashen Pathirana", email: "ashen@example.com")), isSidebarOpen: $isSidebarOpen), label: {
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

            NavigationLink(destination: ReportsAndAnalyticsView(viewModel: ReportsAndAnalyticsViewModel())) {
                Text("Reports and Analytics")
            }
            .padding()

            Button(action: {
                // Implement Log Out functionality here
                isSidebarOpen = false
                isLoggedOut = true
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
                    // Implement Navigation to the Login Screen
                      },
                      secondaryButton: .cancel()
                )
            }
            
            Spacer()
        }
        .frame(width: 500)
        .background(Color.white)
        .shadow(radius: 10)
    }
}
