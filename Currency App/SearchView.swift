//
//  SearchView.swift
//  Currency App
//
//  Created by MYKHAILO NAUMOV on 2/20/26.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                TextField("Search country...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                ScrollView {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        ForEach(getFilteredCountries(), id: \.key) { country in
                            
                            NavigationLink {
                                
                                CountryDetailView(countryCode: country.key)
                                
                            }
                            
                            label: {
                                
                                Text(country.value)
                                    .padding(.horizontal)
                                
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Search Countries")
        }
    }
    
    
    func getFilteredCountries() -> [(key: String, value: String)] {
        
        var results: [(key: String, value: String)] = []
        
        for country in countriesDict {
            
            if searchText.isEmpty {
                
                results.append(country)
                
            }
            else if country.value.lowercased().contains(searchText.lowercased()) {
                
                results.append(country)
                
            }
        }
        
        return results
        
    }
    
}

