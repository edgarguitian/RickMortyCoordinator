//
//  CharacterDetailViewModel.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import Foundation
import Observation

@MainActor
@Observable
class CharacterDetailViewModel {
    var isLoading: Bool = true
    var errorMessage: String? = nil

    let charactersCoordinator: CharactersCoordinator
    let characterId: String
    var characterDetailInfo: SingleCharacterPresentableItem
    
    private let getSingleCharacter: any GetSingleCharacterType
    private let errorMapper: RickAndMortyPresentableErrorMapper

    init(
        charactersCoordinator: CharactersCoordinator,
        characterId: String,
        getSingleCharacter: any GetSingleCharacterType,
        errorMapper: RickAndMortyPresentableErrorMapper
    ) {
        self.charactersCoordinator = charactersCoordinator
        self.characterId = characterId
        self.getSingleCharacter = getSingleCharacter
        self.errorMapper = errorMapper
        self.characterDetailInfo = SingleCharacterPresentableItem()
    }
    
    func loadCharacter() async {
        isLoading = true
        errorMessage = nil
        do {
            async let result = getSingleCharacter.execute(characterId: characterId)
            
            let characterResult = try await result
            characterDetailInfo = SingleCharacterPresentableItem(character: characterResult)

            isLoading = false
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
        }
    }
}
