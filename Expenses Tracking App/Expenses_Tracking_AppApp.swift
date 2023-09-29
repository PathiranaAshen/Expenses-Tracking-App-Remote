//
//  Expenses_Tracking_AppApp.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-02.
//

import SwiftUI
import Firebase

@main
struct Expenses_Tracking_AppApp: App {
    
    init() {
        FirebaseApp.configure()
        print("Firebase Configured.")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
