//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 04/11/24.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player
    var body: some View {
        @Bindable var player = player
        Stepper("Your high score is: \(player.highScore)", value: $player.highScore)
    }
}

struct ContentView: View {
    @State private var player = Player()
    var body: some View {
        VStack {
            Text("Hello \(player.name)")
            HighScoreView()
            Button("Add score") {
                player.highScore += 1
            }
        }
        .environment(player)
    }
}

#Preview {
    ContentView()
}
