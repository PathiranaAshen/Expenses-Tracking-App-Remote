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
                /*Text("User Profile")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)*/
                Spacer()
                
                Image("user icon 4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                
                Spacer()
                
                // Display user profile information
                Text("Name: \(viewModel.user.name)")
                    .padding()
                    .font(.title)
                
                Text("Email: \(viewModel.user.email)")
                    .padding()
                    .font(.title3)
                
                Spacer()
            }
            .navigationBarTitle("Profile")
            /*.navigationBarItems(leading:
                Button(action: {
                    withAnimation {
                        isSidebarOpen.toggle()
                    }
                }) {
                    Image(systemName: isSidebarOpen ? "xmark" : "line.horizontal.3")
                        .font(.title)
                        .padding()
                        .foregroundColor(.primary)
                }
            )*/
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
        ProfileView(viewModel: ProfileViewModel(user: UserProfile(id: "1", name: "Ashen Pathirana", email: "ashen@example.com")), isSidebarOpen: .constant(false))
    }
}
