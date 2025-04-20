//
//  CharacterListViewModel.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import Foundation
import Observation

@MainActor
@Observable
class CharacterListViewModel {
    private var currentPage: Int = 1
    private var lastPage: Int = -1
    
    var isLoading: Bool = true
    var errorMessage: String? = nil
    var characters: [CharacterListPresentableItem] = []
    
    let charactersCoordinator: CharactersCoordinator
    private let getCharacterList: any GetAllCharactersListType
    private let errorMapper: RickAndMortyPresentableErrorMapper

    init(charactersCoordinator: CharactersCoordinator,
         getCharacterList: any GetAllCharactersListType,
         errorMapper: RickAndMortyPresentableErrorMapper) {
        self.charactersCoordinator = charactersCoordinator
        self.getCharacterList = getCharacterList
        self.errorMapper = errorMapper
    }
    
    func loadCharacters() async {
        isLoading = true
        errorMessage = nil
        do {
            async let result = getCharacterList.execute(currentPage: currentPage)
            
            let charactersResult = try await result
            characters = charactersResult.result.map {
                CharacterListPresentableItem(id: String($0.id), name: $0.name,
                                             status: $0.status, species: $0.species,
                                             type: $0.type, gender: $0.gender, image: $0.image)
            }
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
        }
    }
}
