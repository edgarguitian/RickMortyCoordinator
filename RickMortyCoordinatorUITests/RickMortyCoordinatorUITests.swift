//
//  RickMortyCoordinatorUITests.swift
//  RickMortyCoordinatorUITests
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import XCTest

final class RickMortyCoordinatorUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testCharactersListLoad() throws {
        
        // App Launch
        let app = XCUIApplication()
        app.launch()
        
        
        // Navigation Bar
        let navBarCharacters = app.navigationBars["Characters"]
        XCTAssertTrue(navBarCharacters.waitForExistence(timeout: 5))

        // Scroll View
        let scrollViewCharacters = app.scrollViews["listCharacters"]
        XCTAssertTrue(scrollViewCharacters.waitForExistence(timeout: 5))

        // Btns Character
        let lastBtnCharacter = app.buttons["btnCharacterContainer-20"]
        XCTAssertTrue(lastBtnCharacter.waitForExistence(timeout: 5))
        
        // Check Num Characters
        XCTAssertEqual(scrollViewCharacters.buttons.count, 20)
        

    }
    
    func testCharacterDetailLoad() throws {
        // App Launch
        let app = XCUIApplication()
        app.launch()
        
        // First Character
        let firstBtnCharacter = app.buttons["btnCharacterContainer-1"]
        XCTAssertTrue(firstBtnCharacter.waitForExistence(timeout: 5))
        
        firstBtnCharacter.tap()
        
        // Image Detail Character
        let imageCharacter = app.images["imageCharacter"]
        XCTAssertTrue(imageCharacter.waitForExistence(timeout: 5))

        // Section INFO
        let sectionInfo = app.staticTexts["INFO"]
        XCTAssertTrue(sectionInfo.exists)

        // Section LOCATION
        let sectionLocation = app.staticTexts["LOCATION"]
        XCTAssertTrue(sectionLocation.exists)
    }
    
    func testNavigateCharacterAndBack() throws {
        // App Launch
        let app = XCUIApplication()
        app.launch()
        
        // First Character
        let firstBtnCharacter = app.buttons["btnCharacterContainer-1"]
        XCTAssertTrue(firstBtnCharacter.waitForExistence(timeout: 5))
        
        firstBtnCharacter.tap()
        
        // Image Detail Character
        let imageCharacter = app.images["imageCharacter"]
        XCTAssertTrue(imageCharacter.waitForExistence(timeout: 5))
        
        // Btn Back
        let btnBack = app.buttons["btnBack"]
        XCTAssertTrue(btnBack.exists)
        
        btnBack.tap()
        
        // Scroll View
        let scrollViewCharacters = app.scrollViews["listCharacters"]
        XCTAssertTrue(scrollViewCharacters.waitForExistence(timeout: 5))
    }
}
