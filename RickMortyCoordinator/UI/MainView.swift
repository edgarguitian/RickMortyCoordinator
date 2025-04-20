//
//  MainView.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import SwiftUI

struct MainView: View {
    let characterList: CharactersListView

    var body: some View {
        TabView {
            characterList
                .tabItem {
                    Label("Characters", systemImage: "person.3.fill")
                }

            Text("Locations")
                .tabItem {
                    Label("Locations", systemImage: "location.fill")
                }
                .accessibilityIdentifier("tabViewLocations")

            Text("Episodes")
                .tabItem {
                    Label("Episodes", systemImage: "tv.fill")
                }
                .accessibilityIdentifier("tabViewEpisodes")
        }
        .accessibilityIdentifier("tabView")
    }
}

#Preview {
    MainView(characterList: CharacterListFactory().create())
}
