//
//  XCUIElementExtensions.swift
//  PokedexGoUITests
//
//  Created by Hebert Soares on 06/07/19.
//  Copyright © 2019 yigu. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    
    func tap(wait: Int, test: XCTestCase) {
        if !isHittable {
            test.expectation(for: NSPredicate(format: "hittable == true"), evaluatedWith: self, handler: nil);
            test.waitForExpectations(timeout: TimeInterval(wait), handler: nil)
        }
        tap()
    }
    
    func fillText(text: String, testCase: XCTestCase) {
        tap(wait: 20, test: testCase)
        typeText(text)
    }
}
