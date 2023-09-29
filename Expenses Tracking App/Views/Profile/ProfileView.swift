//
//  ProfileView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-22.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var isSidebarOpen: Bool // Binding to control sidebar visibility

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Image("user icon 4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding(.bottom, 20)

                Spacer()

                // Display user profile information
                Text("Name: \(viewModel.name)")
                    .padding()
                    .font(.title)

                Text("Email: \(viewModel.email)")
                    .padding()
                    .font(.title3)

                Spacer()
            }
            .navigationBarTitle("Profile")
            .frame(maxWidth: .infinity)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(), isSidebarOpen: .constant(false))
    }
}
