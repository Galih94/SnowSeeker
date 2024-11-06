//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 06/11/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            Text("Please selecte a resort from the left-hand menu; swipe from the leftendge to show it.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
