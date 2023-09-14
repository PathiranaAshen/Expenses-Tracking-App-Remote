//
//  DashboardCard.swift
//  Expenses Tracking App
//
//  Created by Ashen Pathirana on 2023-09-14.
//

import Foundation
import SwiftUI

struct DashboardCard: View {
    let title: String
    let value: Double
    let color: Color

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
            Text("$\(value, specifier: "%.2f")")
                .font(.largeTitle)
                .foregroundColor(color)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct DashboardCard_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCard(title: "Income", value: 1000.0, color: .green)
        DashboardCard(title: "Expenses", value: 900.0, color: .red)
        DashboardCard(title: "Savings", value: 800.0, color: .blue)
    }
}
