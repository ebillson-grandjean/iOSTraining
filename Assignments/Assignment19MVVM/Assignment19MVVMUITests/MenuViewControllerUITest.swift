//
//  MenuViewControllerUITest.swift
//  Assignment19MVVMUITests
//
//  Created by Ebillson Grand Jean on 6/19/24.
//

import XCTest

final class MenuViewControllerUITest: XCTestCase {

    var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
    

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLabelAssignmentExists() throws {
        let labelAssignment = app.staticTexts["Assignment 19"]
        XCTAssertTrue(labelAssignment.exists)
    }
    
    func testButtonViewProductsExists() throws {
        let buttonViewProducts = app.buttons["View Products"]
        XCTAssertTrue(buttonViewProducts.exists)
    }
    
    func testFlowToProductsList() throws {
        let buttonViewProducts = app.buttons["View Products"]
        XCTAssertTrue(buttonViewProducts.exists)
        buttonViewProducts.tap()
        let labelProductsList = app.staticTexts["Products List"]
        XCTAssertTrue(labelProductsList.exists)
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
