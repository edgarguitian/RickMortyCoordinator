//
//  CharacterListFactory.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Foundation

@MainActor
struct CharacterListFactory {
    func create() -> CharactersListView {
        return CharactersListView(viewModel: createCharacterListViewModel())
    }

    private func createCharacterListViewModel() -> CharacterListViewModel {
        return CharacterListViewModel(
            charactersCoordinator: CharactersCoordinator(),
            getCharacterList: createGetAllCharactersListUseCase(),
            errorMapper: RickAndMortyPresentableErrorMapper())
    }

    private func createGetAllCharactersListUseCase()
        -> any GetAllCharactersListType
    {
        return GetAllCharactersList(repository: createRepository())
    }

    private func createRepository() -> any AllCharactersListRepositoryType {
        return AllCharactersListRepository(
            apiDataSource: createAPIDataSource(),
            errorMapper: RickMortyDomainErrorMapper(),
            charactersResultMapper: CharactersResultMapper())
    }

    private func createAPIDataSource() -> any APICharactersDataSourceType {
        return APICharactersDataSource(httpClient: createHTTPClient())
    }

    private func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(
            requestMaker: URLSessionRequestMaker(),
            errorResolver: URLSessionErrorResolver())
    }
}
