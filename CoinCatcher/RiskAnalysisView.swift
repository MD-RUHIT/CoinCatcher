//
//  RiskAnalysisView.swift
//  CoinCatcher
//
//  Created by Mohammed Ruhit on 27/1/25.
//

import SwiftUI

struct RiskAnalysisView: View {
    @State private var portfolio = [
        CryptoAsset(name: "Bitcoin", holdings: 1.2, value: 36000, riskLevel: "High"),
        CryptoAsset(name: "Ethereum", holdings: 5, value: 12000, riskLevel: "Medium"),
        CryptoAsset(name: "Cardano", holdings: 100, value: 400, riskLevel: "Low")
    ]
    
    var body: some View {
        NavigationView {
            List(portfolio) { asset in
                VStack(alignment: .leading) {
                    Text(asset.name)
                        .font(.headline)
                    HStack {
                        Text("Value: $\(asset.value, specifier: "%.2f")")
                        Spacer()
                        Text("Risk Level: \(asset.riskLevel)")
                            .foregroundColor(asset.riskLevel == "High" ? .red : (asset.riskLevel == "Medium" ? .orange : .green))
                    }
                }
            }
            .navigationTitle("Risk Analysis")
        }
    }
}

struct CryptoAsset: Identifiable {
    let id = UUID()
    let name: String
    let holdings: Double
    let value: Double
    let riskLevel: String
}

struct RiskAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        RiskAnalysisView()
    }
}
