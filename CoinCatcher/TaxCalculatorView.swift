//
//  TaxCalculatorView.swift
//  CoinCatcher
//
//  Created by Mohammed Ruhit on 27/1/25.
//

import SwiftUI

struct TaxCalculatorView: View {
    @State private var transactionType = "Buy"
    @State private var amount: String = ""
    @State private var price: String = ""
    @State private var taxResult: String = ""
    
    let transactionTypes = ["Buy", "Sell", "Stake"]
    
    var body: some View {
        NavigationView {
            Form {
                // Transaction Type Picker
                Picker("Transaction Type", selection: $transactionType) {
                    ForEach(transactionTypes, id: \.self) { type in
                        Text(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                // Crypto Amount Input
                TextField("Crypto Amount (e.g., 0.5)", text: $amount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                
                // Price Input
                TextField("Price per Unit (USD)", text: $price)
                    .keyboardType(.decimalPad)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                
                // Calculate Tax Button
                Button("Calculate Tax") {
                    calculateTax()
                }
                .buttonStyle(.borderedProminent)
                
                // Display Tax Result
                if !taxResult.isEmpty {
                    Text(taxResult)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .navigationTitle("Tax Calculator")
        }
    }
    
    // Calculate Tax Logic
    func calculateTax() {
        guard let amount = Double(amount), let price = Double(price) else {
            taxResult = "Please enter valid numbers."
            return
        }
        
        let tax = transactionType == "Sell" ? amount * price * 0.15 : 0 // 15% tax only on sell transactions
        
        // Format the result to 2 decimal places
        taxResult = "Estimated Tax: $\(String(format: "%.2f", tax))"
    }
}

struct TaxCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TaxCalculatorView()
    }
}
