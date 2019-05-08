//
//  BaseUITest.swift
//  Livelo
//
//  Created by Guilherme on 02/08/17.
//  Copyright © 2017 Livelo. All rights reserved.
//

import XCTest
import UIBot

class BaseUITest: XCTestCase, Bottable {
    
    var caseTest: XCTestCase { return self }
    var app: XCUIApplication { return application }
    
      var application: PokemonUIApplication = PokemonUIApplication()
 
    
    override func setUp() {
        super.setUp()
        
        
        continueAfterFailure = false
    }
    
    override func tearDown() {
        if let failureCount = testRun?.failureCount, failureCount > 0 {
            takeScreenshot()
        }
        super.tearDown()
    }
    
    func getTestID() -> String {
        preconditionFailure("Return the test id here")
    }
    
    
    func getText(_ text: String?) -> String {
        guard let text = text else {
            XCTFail("Property not found in mock")
            return ""
        }
        return text
    }
    
    func takeScreenshot() {
        let screenshot = XCUIScreen.main.screenshot()
        let attach = XCTAttachment(screenshot: screenshot)
        add(attach)
    }
}
