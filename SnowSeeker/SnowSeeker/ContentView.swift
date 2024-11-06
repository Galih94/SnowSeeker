//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Galih Samudra on 04/11/24.
//
import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var body: some View {
        NavigationSplitView {
            List(resorts) { resort in
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
                    }
                }
            }
            .navigationTitle("Resorts")
        } detail: {
            Text("Detail")
        }
    }
}

#Preview {
    ContentView()
}
