//
//  CharactersListView.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Observation
import SwiftUI

struct CharactersListView: View {
    @State private var viewModel: CharacterListViewModel

    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                if viewModel.errorMessage == nil {
                    ScrollView {
                        ForEach(viewModel.characters, id: \.id) { character in
                            Button(
                                action: {
                                    viewModel.charactersCoordinator
                                        .navigateToCharacter(id: character.id)
                                },
                                label: {
                                    CharacterListItemView(item: character)
                                }
                            )
                            .id(character.id)
                            .accessibilityIdentifier("btnCharacterContainer-\(character.id)")
                            .onAppear {
                                loadMoreCharactersIfNeeded(
                                    currentCharacter: character)
                            }
                        }
                        // .accessibilityIdentifier("forEachCharacters")
                    }
                    .accessibilityIdentifier("scrollCharactersList")
                    .navigationTitle("Characters")
                    .accessibilityIdentifier("listCharacters")
                } else {
                    Text(viewModel.errorMessage!)
                }
            }
        }.task {
            await viewModel.loadCharacters()
        }
        .applyNavigation(coordinator: viewModel.charactersCoordinator)
    }

    func loadMoreCharactersIfNeeded(
        currentCharacter: CharacterListPresentableItem
    ) {

    }
}

#Preview {
    let mockRepo = MockCharactersRepository()
    let viewModel = CharacterListViewModel(
        charactersCoordinator: CharactersCoordinator(),
        getCharacterList: GetAllCharactersList(repository: mockRepo),
        errorMapper: RickAndMortyPresentableErrorMapper()
    )
    CharactersListView(viewModel: viewModel)
}
