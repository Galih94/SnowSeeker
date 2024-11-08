//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 04/11/24.
//
import SwiftUI

enum ShortBy: String {
    case none, alhabet, country
}

struct ContentView: View {
    @State private var favorites = Favorites()
    @State private var searchText = ""
    @State private var shortBy: ShortBy = .none
    @State private var showPopOverShort = false
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts.sortBy(shortBy)
        } else {
            return resorts.filter { $0.name.localizedStandardContains(searchText)}.sortBy(shortBy)
        }
    }
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1.0)
                            }
                        VStack(alignment: .leading, content: {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        })
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showPopOverShort.toggle()
                    }, label: {
                        Text("Short by: \(shortBy.rawValue)")
                    })
                }
            }
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
        .alert("Short by", isPresented: $showPopOverShort) {
            Button("None") {
                shortBy = .none
                showPopOverShort.toggle()
            }
            Button("Name") {
                shortBy = .alhabet
                showPopOverShort.toggle()
            }
            Button("Country") {
                shortBy = .country
                showPopOverShort.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
