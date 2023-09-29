//
//  ContentView.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-02.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var isLoginViewPresented = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Image("image4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.40)
                        .clipped()
                        .blendMode(.color) // Blend with background color

                    VStack {
                        Image("appicon4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.bottom, 20)
                            .blendMode(.color)
                        
                        Text("Take control of your finances...")
                            .font(.title3)
                            .foregroundColor(.blue)
                            .padding()
                            .italic()

                        Text("Expense Tracking App")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()

                        Button("Join") {
                            isLoginViewPresented.toggle()
                        }
                        .frame(maxWidth: 260)
                        .padding()
                        .font(.title3)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .fontWeight(.heavy)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: geometry.size.height * 0.5)
                    .background(LinearGradient(
                        gradient: Gradient(colors: [Color(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)), .white]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
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

















/*
struct ContentView: View {
    @State private var isLoginViewPresented = false

    var body: some View {
        NavigationView {
            VStack {
                /*Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .padding()*/
                
                /*Image("image1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 250)
                    .padding(.bottom, 20)
                    .blendMode(.color)*/
                
                Image("appicon2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                    .blendMode(.color)
                
                Text("Take control of your finances...")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .padding()
                    .italic()
                
                Text("Expense Tracking App")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Button("Join") {
                    isLoginViewPresented.toggle()
                }
                .frame(maxWidth: 100)
                .padding()
                .font(.title3)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .fontWeight(.heavy)
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
*/














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
