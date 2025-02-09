//
//  ContentView.swift
//  CoinCatcher
//
//  Created by Mohammed Ruhit on 27/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PortfolioView()
                .tabItem {
                    Label("Portfolio", systemImage: "chart.bar")
                }
            
            TaxCalculatorView()
                .tabItem {
                    Label("Tax Calculator", systemImage: "doc.text.magnifyingglass")
                }
            
            RiskAnalysisView()
                .tabItem {
                    Label("Risk Analysis", systemImage: "exclamationmark.triangle")
                }
            
            ScamDatabaseView()
                .tabItem {
                    Label("Scam Database", systemImage: "shield.lefthalf.filled")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
