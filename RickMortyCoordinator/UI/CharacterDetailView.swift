//
//  CharacterDetailView.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Observation
import SwiftUI

struct CharacterDetailView: View {
    @State private var viewModel: CharacterDetailViewModel

    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                if viewModel.errorMessage == nil {
                    List {

                        AsyncImage(
                            url: URL(
                                string: viewModel.characterDetailInfo.image)
                        ) { image in

                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 35))
                                .padding(.vertical)
                                .accessibilityIdentifier("imageCharacter")
                        } placeholder: {
                            ProgressView()
                        }

                        Section(
                            header: Text("INFO")
                                .font(.title2)
                        ) {
                            CharacterDetailItemView(
                                title: "🟢 Status",
                                value: viewModel.characterDetailInfo.status)
                            CharacterDetailItemView(
                                title: "🧬 Species",
                                value: viewModel.characterDetailInfo.species)
                            if !viewModel.characterDetailInfo.type.isEmpty {
                                CharacterDetailItemView(
                                    title: "🌱 Type",
                                    value: viewModel.characterDetailInfo.type)
                            }
                            CharacterDetailItemView(
                                title: "👤 Gender",
                                value: viewModel.characterDetailInfo.gender)
                        }

                        Section(
                            header: Text("LOCATION")
                                .font(.title2)
                        ) {
                            CharacterDetailItemView(
                                title: "📍 Origin",
                                value: viewModel.characterDetailInfo.origin.name
                            )
                            CharacterDetailItemView(
                                title: "🗺 Location",
                                value: viewModel.characterDetailInfo.location
                                    .name)
                            // CharacterDetailItemView(title: "Created", value: viewModel.characterDetailInfo.created)
                        }
                    }
                } else {
                    Text(viewModel.errorMessage!)
                }
            }
        }
        .navigationTitle(viewModel.characterDetailInfo.name)
        .task {
            await viewModel.loadCharacter()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("<Back") {
                    viewModel.charactersCoordinator.goBack()
                }
                .accessibilityIdentifier("btnBack")
            }
            
        }
    }
}

#Preview {
    let mockRepo = MockSingleCharacterRepository()
    let viewModel = CharacterDetailViewModel(
        charactersCoordinator: CharactersCoordinator(),
        characterId: "1",
        getSingleCharacter: GetSingleCharacter(repository: mockRepo),
        errorMapper: RickAndMortyPresentableErrorMapper())
    CharacterDetailView(viewModel: viewModel)
}
