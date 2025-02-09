//
//  PortfolioView.swift
//  CoinCatcher
//
//  Created by Mohammed Ruhit on 27/1/25.
//

import SwiftUI

struct PortfolioView: View {
    @State private var portfolio = [
        CryptoAsset(name: "Bitcoin", holdings: 1.2, value: 36000, riskLevel: "High"),
        CryptoAsset(name: "Ethereum", holdings: 5, value: 12000, riskLevel: "Medium"),
        CryptoAsset(name: "Cardano", holdings: 100, value: 400, riskLevel: "Low")
    ]
    
    @State private var alertThreshold: Double = 40000
    @State private var showAlert: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                List(portfolio) { asset in
                    VStack(alignment: .leading) {
                        Text(asset.name)
                            .font(.headline)
                        HStack {
                            Text("Holdings: \(asset.holdings, specifier: "%.2f")")
                            Spacer()
                            Text("Value: $\(asset.value, specifier: "%.2f")")
                        }
                        .font(.subheadline)
                        Text("Risk Level: \(asset.riskLevel)")
                            .foregroundColor(asset.riskLevel == "High" ? .red : (asset.riskLevel == "Medium" ? .orange : .green))
                    }
                }
                
                HStack {
                    TextField("Alert Threshold ($)", value: $alertThreshold, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    
                    Button("Set Alert") {
                        checkPriceAlert()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .navigationTitle("Portfolio")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Price Alert"), message: Text("An asset has exceeded the threshold of $\(alertThreshold, specifier: "%.2f")."), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func checkPriceAlert() {
        for asset in portfolio {
            if asset.value > alertThreshold {
                showAlert = true
                return
            }
        }
        showAlert = false
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
