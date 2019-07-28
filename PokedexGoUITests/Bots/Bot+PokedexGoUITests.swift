//
//  Bot+LiveloUITests.swift
//  LiveloUITests
//
//  Created by Tulio Bazan da Silva on 28/09/2018.
//  Copyright © 2018 Livelo. All rights reserved.
//
import Foundation
import XCTest
import UIBot

extension Bot {
    
    static let searchItem = "Search Item"
    
    ///Wait a Loading with a text Diaspeare
    func waitLoadingDisapeare(with text: String) -> Self {
        let loading = app.staticTexts[text]
        return waitToNotExist(element: loading)
    }
    
    ///Convert a String To Date
    func convert(text: String, with dateFormat: String) -> Date? {
        let formatter = DateFormatter()
        
        formatter.dateFormat = dateFormat
        return formatter.date(from: text)
    }
    
    func assert(text: String) -> Self {
        let predicate = NSPredicate(format: "label LIKE %@", text)
        let label = app.staticTexts.element(matching: predicate)
        XCTAssert(label.exists)
        return self
    }
    
    func assertTextField(text: String) -> Self {
        XCTContext.runActivity(named: "Check if Exists a TextField with text: \(text)") { _ in
            let labelText = app.textFields[text]
            XCTAssert(labelText.exists, "Not Exist TextField Text: '\(text)'")
        }
        return self
    }
    
    func assertConstains(text: String) -> Self {
        let predicate = NSPredicate(format: "label CONTAINS %@", text)
        let label = app.staticTexts.element(matching: predicate)
        XCTAssert(label.exists)
        return self
    }
    
    func tapSwitch(id: String) -> Self {
        XCTContext.runActivity(named: "Tap switch with id: \(id)") { _ in
            app.switches[id].tap()
        }
        return self
    }

    
}
