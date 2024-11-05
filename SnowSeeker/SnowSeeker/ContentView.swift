//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 04/11/24.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Galih")
            Text("Country: Indonesia")
            Text("Pets: Gecko")
        }
        .font(.title)
    }
}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)
            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ContentView()
}
