//
//  CharacterDetailItemView.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import SwiftUI

struct CharacterDetailItemView: View {
    let title: String
    let value: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .lineLimit(1)

            Spacer()

            Text(value)
                .font(.title2)
                .lineLimit(1)

        }
        .padding()
        .background(Color("BackgroundItemColor"))
        .cornerRadius(10)
    }
}

#Preview {
    CharacterDetailItemView(title: "Status", value: "Alive")
}
