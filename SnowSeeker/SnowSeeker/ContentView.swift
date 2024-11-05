//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 04/11/24.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
        }
    }
}

#Preview {
    ContentView()
}
