//
//  ContentView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-02.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoginViewPresented = false

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .padding()
                
                Text("Take control of your finances...")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                
                Text("Expense Tracking App")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Button("Join") {
                    isLoginViewPresented.toggle()
                }
                .frame(maxWidth: 100)
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                startPoint: .top,
                endPoint: .bottom
            ))
        }
        .sheet(isPresented: $isLoginViewPresented) {
            LoginView(viewModel: LoginViewModel())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






/*struct ContentView: View {
    var body: some View {
        VStack {
            /*Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")*/
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
