//
//  CountryDetailView.swift
//  Currency App
//
//  Created by MYKHAILO NAUMOV on 2/20/26.
//

import SwiftUI

struct CountryDetailView: View {
    
    var countryCode: String
    @State var countryData: NSDictionary? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Country Information")
                .font(.title)
            
            Button("Load Country Info") {
                loadCountry()
            }
            
            if let data = countryData {
                Text("Name: \(getName(data))")
                Text("Capital: \(getCapital(data))")
                Text("Region: \(getRegion(data))")
                Text("Population: \(getPopulation(data))")
                Text("Currency: \(getCurrency(data))")
            } else {
                Text("No data loaded")
            }
            
            Spacer()
        }
        .padding()
    }
    
    func loadCountry() {
        CountryService().loadCountry(countryCode: countryCode.uppercased())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.countryData = CountryService.countryData
        }
    }
    
    func getName(_ data: NSDictionary) -> String {
        if let name = data["name"] as? NSDictionary {
            return name["common"] as? String ?? "N/A"
        }
        return "N/A"
    }
    
    func getCapital(_ data: NSDictionary) -> String {
        if let capitals = data["capital"] as? [String], capitals.count > 0 {
            return capitals[0]
        }
        return "N/A"
    }
    
    func getRegion(_ data: NSDictionary) -> String {
        return data["region"] as? String ?? "N/A"
    }
    
    func getPopulation(_ data: NSDictionary) -> String {
        if let pop = data["population"] as? Int {
            return String(pop)
        }
        return "N/A"
    }
    
    func getCurrency(_ data: NSDictionary) -> String {
        if let currencies = data["currencies"] as? NSDictionary {
            for (_, value) in currencies {
                if let obj = value as? NSDictionary {
                    return obj["name"] as? String ?? "N/A"
                }
            }
        }
        return "N/A"
    }
}
