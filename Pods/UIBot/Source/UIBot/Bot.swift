//
//  Bot.swift
//  UIBot
//
//  Created by Túlio Bazan da Silva on 25/09/18.
//

import XCTest

open class Bot {
    
    ///Application to check
    public let app: XCUIApplication
    
    ///The test running
    private let test: XCTestCase
    
    ///Test Timeout in Seconds
    var testTimeout: TimeInterval
    
    public init(test: Bottable, timeout: TimeInterval = 30.0) {
        self.app = test.app
        self.test = test.caseTest
        self.testTimeout = timeout
        
        guard let trait = trait() else { XCTFail(); return }
        self.test.wait(element: trait, by: testTimeout) { (error) in
            XCTAssertNil(error)
            sleep(1)
        }
    }
    
    ///Element that defines this Screen
    open func trait() -> XCUIElement? {
        return nil
    }
    
    //MARK: Asserts
    
    ///Assert a Label with text exists
    open func assert(label text: String) -> Self {
        XCTContext.runActivity(named: "Check if Exists a label: \(text)") { _ in
            let predicate = NSPredicate(format: "label LIKE %@", text)
            let labelText = app.staticTexts.element(matching: predicate)
            let buttonLabelText = app.buttons.element(matching: predicate)
            XCTAssert(labelText.exists || buttonLabelText.exists, "Not Exist label: '\(text)'")
        }
        return self
    }
    
    ///Assert a Label with text not exists
    open func assertNotExits(label text: String) -> Self {
        XCTContext.runActivity(named: "Check if Exists a label: \(text)") { _ in
            let predicate = NSPredicate(format: "label LIKE %@", text)
            let labelText = app.staticTexts.element(matching: predicate)
            let buttonLabelText = app.buttons.element(matching: predicate)
            XCTAssertFalse(labelText.exists || buttonLabelText.exists, "Exist label: '\(text)'")
        }
        return self
    }
    
    ///Assert a Label that contains a substring
    open func assertContains(text: String) -> Self {
        XCTContext.runActivity(named: "Check if Exists a label that contains substring: \(text)") { _ in
            let predicate = NSPredicate(format: "label CONTAINS %@", text)
            let labelText = app.staticTexts.element(matching: predicate)
            let buttonLabelText = app.buttons.element(matching: predicate)
            XCTAssert(labelText.exists || buttonLabelText.exists, "Not Exist substring: '\(text)'")
        }
        return self
    }
   
    ///Verifies if this Screen is presented
    public func screenExists() -> Self {
        XCTContext.runActivity(named: "Check if this Screen Exists") { _ in
            guard let trait = trait() else { XCTFail(); return }
            self.test.wait(element: trait, by: testTimeout) { (error) in
                XCTAssertNil(error, "Timeout!")
            }
            XCTAssert(trait.exists, "Not Exist trait: '\(trait)'")
        }
        return self
    }
    
    
    ///Verifies that a Button with an ID has a specific Label
    public func assertButton(id: String, with label: String) -> Self {
        XCTContext.runActivity(named: "Exists Button with id: \(id) and label: \(label)") { _ in
            XCTAssert(app.buttons[id].label == label, "Not Exist Button with id: '\(id)' and '\(label)'")
        }
        return self
    }
    
    ///Verifies if a text exists in Screen, including Label and Buttons Label
    public func assertIsVisible(text: String) -> Self  {
        XCTContext.runActivity(named: "Exists Text: \(text)") { _ in
            let predicate = NSPredicate(format: "label LIKE %@", text)
            let labelText = app.staticTexts.element(matching: predicate)
            let buttonLabelText = app.buttons.element(matching: predicate)
            XCTAssert(labelText.isVisible || buttonLabelText.isVisible, "Not Visible Label: '\(text)'")
        }
        return self
    }
    
    ///Verifies that a Button with an ID has a specific Label
    public func assertLabel(id: String, with text: String) -> Self  {
        XCTContext.runActivity(named: "Exists Label with id: \(id) and text: \(text) ") { _ in
            let staticText = app.staticTexts[id]
            XCTAssert(staticText.label == text, "Not Exist Label with id: '\(id)' and '\(text)'")
        }
        return self
    }
    
    ///Verifies if a text exists in NavigationBar
    public func assertNavigationBar(title: String) -> Self {
        XCTContext.runActivity(named: "Exists Text: \(title) in the NavigationBar") { _ in
            XCTAssert(app.navigationBars[title].exists, "Not exist a NAvigationBar with Title: '\(title)'")
        }
        return self
    }
    
    ///Verifies that a Image with an ID exists
    public func assertImage(id: String) -> Self {
        XCTContext.runActivity(named: "Exists Image with id: \(id)") { _ in
            XCTAssert(app.images[id].exists, "Not exist a ImageView with id: '\(id)'")
        }
        return self
    }
    
    ///Verifies that a Button with an ID exists or not
    public func assertButton(id: String, exists: Bool = true) -> Self {
        XCTContext.runActivity(named: "\(exists ? "Exists" : "Not Exists") Button with id: \(id)") { _ in
            if exists {
                XCTAssertTrue(app.buttons[id].exists, "Not exist a Button with id: '\(id)'")
            } else {
                XCTAssertFalse(app.buttons[id].exists, "Exist a Button with id: '\(id)'")
            }
        }
        return self
    }
    
    //MARK: Taps
    
    ///Tap a Button with an ID
    public func tapButton(id: String) -> Self  {
        XCTContext.runActivity(named: "Tap at Button with id: \(id)") { _ in
            app.buttons[id].tap()
        }
        return self
    }
    
    
    ///Tap a Visible Label with a Text
    public func tapLabel(text: String) -> Self  {
        XCTContext.runActivity(named: "Tap at Label with text: \(text)") { _ in
            let predicate = NSPredicate(format: "label LIKE %@", text)
            let labelText = app.staticTexts.element(matching: predicate)
            let buttonLabelText = app.buttons.element(matching: predicate)
            if labelText.exists {
                labelText.tap()
            } else if buttonLabelText.exists {
                buttonLabelText.tap()
            } else {
                XCTFail("No label '\(text)' found to Tap")
            }
        }
        return self
    }
    
    
    ///Taps at Back Button (if it is the first element at NavigationBar)
    public func tapBackButton() -> Self {
        XCTContext.runActivity(named: "Tap at Back Button") { _ in
            app.navigationBars.buttons.element(boundBy: 0).tap()
        }
        return self
    }
    
    ///Tap a view with Id
    public func tapView(id: String) -> Self {
        XCTContext.runActivity(named: "Tap View with Id: \(id)") { _ in
            app.otherElements[id].tap()
        }
        return self
    }
    
    //Tap at coordinate
    public func tapCoordinate(x xCoordinate: Double, y yCoordinate: Double)  -> Self {
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
        coordinate.tap()
        return self
    }
    
    //Given safari is in Foreground, tap at back to App
    public func backFromSafari() -> Self {
        XCTContext.runActivity(named: "Given safari is in Foreground, tap at back to App") { _ in
            let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
            XCTAssert(safari.wait(for: .runningForeground, timeout: testTimeout))
            let normalized = safari.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
            let coordinate = normalized.withOffset(CGVector(dx: 5, dy: 10))
            coordinate.tap()
        }
        return self
    }
 
    //MARK: Waitings
    
    ///Wait for a label Exists, including StaticTexts and Button Labels
    public func wait(text: String) -> Self  {
        XCTContext.runActivity(named: "Waiting for Text: \(text)") { _ in
            if app.staticTexts[text].waitForExistence(timeout: testTimeout) || app.buttons[text].waitForExistence(timeout: testTimeout) {
                sleep(1)
            } else {
                XCTFail("Test Timeout, text '\(text)' did not appear")
            }
        }
        return self
    }
    
    ///Waits for a View with an id to exists
    public func waitView(id: String) -> Self {
        XCTContext.runActivity(named: "Waiting for View with Id: \(id)") { _ in
            if app.otherElements[id].waitForExistence(timeout: testTimeout) {
                sleep(1)
            } else {
                XCTFail("Test Timeout, view with id '\(id)' did not appear")
            }
        }
        return self
    }
    
    ///Waits for a Elements to not exists
    public func waitToNotExist(element: XCUIElement) -> Self {
        XCTContext.runActivity(named: "Wait Until Element: \(element) not Exist") { _ in
            self.test.waitToNotExist(element: element, by: testTimeout) { (error) in
                XCTAssertNil(error, "Test Timeout, element '\(element)' exists")
                sleep(1)
            }
        }
        return self
    }
    
    ///Wait a time in seconds
    public func wait(time: UInt32) -> Self {
        XCTContext.runActivity(named: "Wait a time: \(time) seconds") { _ in
            sleep(time)
            XCTAssert(true)
        }
        return self
    }

    //MARK: Scrolls
    
    ///Try to scroll TableView, ScrollView or CollectionView at index, until element shows
    public func scroll(at index: Int, untilElementExists element: XCUIElement, direction: SwipeDirection) -> Self {
        XCTContext.runActivity(named: "Scrolls TableView, ScrollView or CollectionView at index: \(index) until element exist at direction \(direction.description)") { _ in
            
            let expecation1 = test.expectation(description: "wait for element to show")
            
            while !element.isVisible {
                let tableView: XCUIElement = app.tables.element(boundBy: index)
                let scrollView: XCUIElement = app.scrollViews.element(boundBy: index)
                let collectionView: XCUIElement = app.collectionViews.element(boundBy: index)
                
                if tableView.exists {
                    direction.swipe(at: tableView)
                } else if scrollView.exists {
                    direction.swipe(at: scrollView)
                } else if collectionView.exists {
                    direction.swipe(at: collectionView)
                } else {
                    XCTFail("Not exists a scrollView to scroll at index: \(index)")
                }
            }
            
            expecation1.fulfill()
            
            test.waitForExpectations(timeout: testTimeout, handler: { (error) in
                XCTAssertNil(error, "test Timeout, element '\(element)' did not appear")
            })
        }
        return self
    }

    
    ///Try to scroll TableView, ScrollView and CollectionView at index, until Text shows
    public func scroll(at index: Int, untilTextExists text: String, direction: SwipeDirection) -> Self {
        return scroll(at: index, untilElementExists: app.staticTexts[text], direction: direction)
    }
    
    //MARK: TextFields
    
    ///Write a Text into a TextField by Element ID
    public func write(text: String, atTextFieldWithID id: String) -> Self {
        XCTContext.runActivity(named: "Write '\(text)' at textField with id: \(id)") { _ in
            var textField: XCUIElement?
            if app.textFields[id].exists {
                textField = app.textFields[id]
            } else if app.secureTextFields[id].exists {
                textField = app.secureTextFields[id]
            } else {
                XCTFail("Do not exists a textField with id: \(id)")
            }
            
            textField?.tap()
            textField?.typeText(text)
        }
        return self
    }
    
    //MARK: Cells
    
    ///Tap a Cell at index
    public func tapCell(at index: Int) -> Self {
        XCTContext.runActivity(named: "Tap a Cell at index: \(index)") { _ in
            app.cells.element(boundBy: index).tap()
        }
        return self
    }
    
    //MARK: Alerts
    
    ///Asserts Alert Title
    public func assertAlert(title: String) -> Self {
        XCTContext.runActivity(named: "Assert if Alert Title is: \(title)") { _ in
            XCTAssert(app.alerts.staticTexts[title].exists, "Alert title '\(title)', do not exists")
        }
        return self
    }
    
    ///Asserts Alert Message
    public func assertAlert(message: String) -> Self {
        XCTContext.runActivity(named: "Assert if Alert message is: \(message)") { _ in
            XCTAssert(app.alerts.staticTexts[message].exists, "Alert message '\(message)', do not exists")
        }
        return self
    }
    
    ///Asserts Alert Button title and tap it
    public func tapAlertButton(title: String) -> Self {
        XCTContext.runActivity(named: "Assert Alert Button Title is: \(title) and tap it") { _ in
            let button = app.alerts.element(boundBy: 0).buttons[title]
            XCTAssert(button.exists, "Alert button with title '\(title)', do not exists")
            button.tap()
        }
        return self
    }
    
    //MARK: Utils
    
    ///Text from Label with Id
    public func stringFromLabel(with id: String) -> String? {
        return app.staticTexts[id].label
    }
    
    ///Text from Button with Id
    public func stringFromButton(with id: String) -> String? {
        return app.buttons[id].label
    }

}
