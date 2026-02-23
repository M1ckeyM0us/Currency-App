//
//  CountryDetailView.swift
//  Currency App
//
//  Created by MYKHAILO NAUMOV on 2/20/26.
//

import SwiftUI

struct CountryDetailView: View {
    
    var countryCode: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text(countryCode.uppercased())
                    .font(.largeTitle)
                
                Divider()
                
                Text("Information")
                    .font(.headline)
                
                Text("Capital: ...")
                Text("Region: ...")
                
                Divider()
                
                Text("Economy")
                    .font(.headline)
                
                Text("GDP: ...")
                Text("Income Level: ...")
                
                Divider()
                
                Text("Life / Population")
                    .font(.headline)
                
                Text("Population: ...")
                
                Divider()
                
                Text("Environment")
                    .font(.headline)
                
                Text("CO2 Emissions: ...")
                
            }
            .padding()
        }
        .navigationTitle("Country Info")
    }
}
