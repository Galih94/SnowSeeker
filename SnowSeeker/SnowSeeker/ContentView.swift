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
    var player: Player
    var body: some View {
        Text("Your high score is: \(player.highScore)")
    }
}

struct ContentView: View {
    @State private var player = Player()
    var body: some View {
        Text("Hello \(player.name)")
        HighScoreView(player: player)
    }
}

#Preview {
    ContentView()
}
