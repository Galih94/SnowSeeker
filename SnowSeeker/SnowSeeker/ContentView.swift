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
    @State private var layoutVertically = false
    var body: some View {
        Button(action: {
            layoutVertically.toggle()
        }, label: {
            if layoutVertically {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
        })
    }
}

#Preview {
    ContentView()
}
