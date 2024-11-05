//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 04/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvil", "Sofie"]
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { $0.localizedStandardContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something?")
            .navigationTitle("Searching")
            
        }
    }
}

#Preview {
    ContentView()
}
