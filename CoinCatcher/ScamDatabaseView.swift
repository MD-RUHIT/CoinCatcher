//
//  ScamDatabaseView.swift
//  CoinCatcher
//
//  Created by Mohammed Ruhit on 27/1/25.
//

import SwiftUI

struct Scam: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let reportedBy: String
}

struct ScamDatabaseView: View {
    @State private var scams: [Scam] = [
        Scam(title: "Fake Binance Website", description: "A phishing website mimicking Binance to steal user credentials.", reportedBy: "JohnDoe"),
        Scam(title: "ETH Giveaway Scam", description: "A Twitter account promising ETH giveaways for sending funds.", reportedBy: "CryptoUser123")
    ]
    
    @State private var searchQuery: String = ""
    @State private var newScamTitle: String = ""
    @State private var newScamDescription: String = ""
    @State private var newScamReportedBy: String = ""
    @State private var showAddScamForm: Bool = false

    var filteredScams: [Scam] {
        if searchQuery.isEmpty {
            return scams
        } else {
            return scams.filter { $0.title.lowercased().contains(searchQuery.lowercased()) || $0.description.lowercased().contains(searchQuery.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                TextField("Search for scams...", text: $searchQuery)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding([.leading, .trailing, .top])

                // Scam List
                List(filteredScams) { scam in
                    VStack(alignment: .leading) {
                        Text(scam.title)
                            .font(.headline)
                        Text(scam.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Reported by: \(scam.reportedBy)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }

                // Add Scam Button
                Button(action: {
                    showAddScamForm = true
                }) {
                    Text("Report a New Scam")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding([.leading, .trailing, .bottom])
                }
            }
            .navigationTitle("Scam Database")
            .sheet(isPresented: $showAddScamForm) {
                // Add Scam Form
                VStack {
                    Text("Report a Scam")
                        .font(.headline)
                        .padding()

                    TextField("Title", text: $newScamTitle)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        .padding([.leading, .trailing])

                    TextField("Description", text: $newScamDescription)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        .padding([.leading, .trailing])

                    TextField("Reported By", text: $newScamReportedBy)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        .padding([.leading, .trailing])

                    Button(action: {
                        let newScam = Scam(title: newScamTitle, description: newScamDescription, reportedBy: newScamReportedBy)
                        scams.append(newScam)
                        newScamTitle = ""
                        newScamDescription = ""
                        newScamReportedBy = ""
                        showAddScamForm = false
                    }) {
                        Text("Submit")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding([.leading, .trailing])
                    }
                }
                .padding()
            }
        }
    }
}

struct ScamDatabaseView_Previews: PreviewProvider {
    static var previews: some View {
        ScamDatabaseView()
    }
}
