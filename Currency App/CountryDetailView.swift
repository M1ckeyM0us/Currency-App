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
        
        ScrollView {
            VStack(spacing: 20) {
                
                Text("Country Information")
                    .font(.largeTitle)
                    .bold()
                
                Button("Load Country Info") {
                    loadCountry()
                }
                
                if let data = countryData {
                    
                    Text(getFlag(data))
                        .font(.system(size: 80))
                    
                    infoBox(title: "Official Name", value: getOfficialName(data))
                    infoBox(title: "Capital", value: getCapital(data))
                    infoBox(title: "Region", value: getRegion(data))
                    infoBox(title: "Subregion", value: getSubregion(data))
                    infoBox(title: "Population", value: getPopulation(data))
                    infoBox(title: "Area (km²)", value: getArea(data))
                    infoBox(title: "Currency", value: getCurrency(data))
                    infoBox(title: "Timezones", value: getTimezones(data))
                    
                } else {
                    Text("No data loaded")
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    // its really neccessary
    // all of those functions are being used for displaying information
    
    func loadCountry() {
        CountryService().loadCountry(countryCode: countryCode.uppercased())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.countryData = CountryService.countryData
        }
    }
    
    func infoBox(title: String, value: String) -> some View {
        VStack {
            Text(title)
                .font(.headline)
            Text(value)
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
    
    func getFlag(_ data: NSDictionary) -> String {
        if let flag = data["flag"] as? String {
            return flag
        }
        return ""
    }
    
    func getOfficialName(_ data: NSDictionary) -> String {
        if let name = data["name"] as? NSDictionary {
            return name["official"] as? String ?? "N/A"
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
    
    func getSubregion(_ data: NSDictionary) -> String {
        return data["subregion"] as? String ?? "N/A"
    }
    
    func getPopulation(_ data: NSDictionary) -> String {
        if let pop = data["population"] as? Int {
            return String(pop)
        }
        return "N/A"
    }
    
    func getArea(_ data: NSDictionary) -> String {
        if let area = data["area"] as? Double {
            return String(area)
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
    
    func getTimezones(_ data: NSDictionary) -> String {
        if let zones = data["timezones"] as? [String], zones.count > 0 {
            return zones.joined(separator: ", ")
        }
        return "N/A"
    }
}
