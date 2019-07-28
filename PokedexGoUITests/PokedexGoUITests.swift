//
//  PokedexGoUITests.swift
//  PokedexGoUITests
//
//  Created by Herbert Pereira Soares on 25/04/19.
//  Copyright © 2019 yigu. All rights reserved.
//

import XCTest
import UIBot

class PokedexGoUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        XCUIApplication().navigationBars["Bulbasaur"].buttons["Pokedex Go"].tap()
        XCUIApplication().navigationBars["Bulbasaur"].buttons["Pokedex Go"].tap()
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        let searchField = tablesQuery.children(matching: .searchField).element
        searchField.tap()
        searchField.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["#003"]/*[[".cells.staticTexts[\"#003\"]",".staticTexts[\"#003\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["Venusaur #003"].tap()
        app.navigationBars["Venusaur"].buttons["Pokedex Go"].tap()
     
        XCUIApplication().navigationBars["Bulbasaur"].buttons["Pokedex Go"].tap()
        XCUIApplication().navigationBars["绿毛虫"].buttons["Pokedex Go"].tap()
        XCUIApplication().tables.children(matching: .searchField).element.tap()
        
//        let app = XCUIApplication()
//        app.tables.children(matching: .searchField).element.tap()
//        app.tables["Empty list"].children(matching: .searchField).element.tap()
//
        
        
        let emptyListTable = XCUIApplication().tables["Empty list"]
        emptyListTable.children(matching: .searchField).element.tap()
        emptyListTable.buttons["Clear text"].tap()
        
        
    }

}
