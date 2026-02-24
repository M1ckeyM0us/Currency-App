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
    @State var message = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                TextField("Enter country name", text: $countryName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Submit") {
                    findCountry()
                }
                
                Text(message)
                    .foregroundColor(.red)
                
                Spacer()
            }
            .navigationTitle("Search Country")
        }
    }
    
    func findCountry() {
        let input = countryName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        for (code, name) in countriesDict {
            if name.lowercased() == input.lowercased() {
                selectedCountryCode = code
                message = "Country selected"
                return
            }
        }
        
        message = "Country not found"
    }
}
