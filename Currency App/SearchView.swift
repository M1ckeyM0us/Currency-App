//
//  SearchView.swift
//  Currency App
//
//  Created by MYKHAILO NAUMOV on 2/20/26.
//

import SwiftUI

struct SearchView: View {
    
    @State var countryName = ""
    @Binding var selectedCountryCode: String
    
    // Filters the country
    // for exmaple if you will write uni it will give options like Unites States or United Kingdom
    var filteredCountries: [(key: String, value: String)] {
        if countryName.isEmpty {
            return countriesDict.sorted { $0.value < $1.value }
        }
        else {
            return countriesDict
                .filter { $0.value.lowercased().contains(countryName.lowercased()) }
                .sorted { $0.value < $1.value }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Enter country name", text: $countryName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(filteredCountries, id: \.key) { country in
                    Button(country.value) {
                        selectedCountryCode = country.key
                        countryName = country.value
                    }
                }
                
            }
            .navigationTitle("Search Country")
        }
    }
}
