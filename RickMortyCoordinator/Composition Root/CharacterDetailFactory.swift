//
//  CharacterDetailFactory.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Foundation

@MainActor
struct CharacterDetailFactory {
    func create(
        characterId: String, charactersCoordinator: CharactersCoordinator
    ) -> CharacterDetailView {
        return CharacterDetailView(
            viewModel: createViewModel(
                characterId: characterId,
                charactersCoordinator: charactersCoordinator))
    }

    private func createViewModel(
        characterId: String, charactersCoordinator: CharactersCoordinator
    )
        -> CharacterDetailViewModel
    {
        CharacterDetailViewModel(
            charactersCoordinator: charactersCoordinator,
            characterId: characterId,
            getSingleCharacter: createSingleCharacterUseCase(),
            errorMapper: RickAndMortyPresentableErrorMapper())
    }

    private func createSingleCharacterUseCase()
        -> any GetSingleCharacterType
    {
        GetSingleCharacter(repository: createSingleCharacterRepository())
    }

    private func createSingleCharacterRepository()
        -> any SingleCharacterRepositoryType
    {
        SingleCharacterRepository(
            apiDataSource: createApiDataSource(),
            errorMapper: RickMortyDomainErrorMapper(),
            singleCharacterResultMapper: SingleCharacterResultMapper())
    }

    private func createApiDataSource() -> any APISingleCharacterDataSourceType {
        APISingleCharacterDataSource(httpClient: createHTTPClient())
    }

    private func createHTTPClient() -> HTTPClient {
        URLSessionHTTPCLient(
            requestMaker: URLSessionRequestMaker(),
            errorResolver: URLSessionErrorResolver())
    }
}
