//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 04/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            Text("Searching for: \(searchText)")
                .searchable(text: $searchText, prompt: "Look for something?")
                .navigationTitle("Searching")
                
        }
    }
}

#Preview {
    ContentView()
}
