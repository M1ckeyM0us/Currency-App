//
//  ContentView.swift
//  Currency App
//
//  Created by MYKHAILO NAUMOV on 2/18/26.
//
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "globe")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}
