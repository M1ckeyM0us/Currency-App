//
//  CountryInfo.swift
//  Currency App
//
//  Created by MYKHAILO NAUMOV on 2/20/26.
//

import SwiftUI

struct BrowseView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                
                Text("Browse Country Profiles")
                    .font(.title)
                
                NavigationLink("United States") {
                    CountryDetailView(countryCode: "usa")
                }
                
                NavigationLink("Ukraine") {
                    CountryDetailView(countryCode: "ukr")
                }
                
                NavigationLink("Japan") {
                    CountryDetailView(countryCode: "jpn")
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
