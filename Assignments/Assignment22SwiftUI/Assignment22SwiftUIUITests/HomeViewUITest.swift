//
//  HomeViewUITest.swift
//  Assignment22SwiftUIUITests
//
//  Created by Ebillson Grand Jean on 6/23/24.
//

import XCTest

final class HomeViewUITest: XCTestCase {

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

    func testSmallLogoExists() throws {
        // UI tests must launch the application that they test.
        let smallLogo = app.images["smallLogo"]
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(smallLogo.exists)
    }
    
    func testMainLogoExists() throws {
        // UI tests must launch the application that they test.
        let mainLogo = app.images["MainLogoApp"]
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(mainLogo.exists)
    }
    
    func testWelcomeLabelExists() throws {
        // UI tests must launch the application that they test.
        // When
        let helloLabel = app.staticTexts["Hello!"]
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Then
        XCTAssertTrue(helloLabel.exists)
    }
    
    func testSecondLabelExists() throws {
        // When
        let secondLabel = app.staticTexts["Best place to write your stories and share your journey experiences"]
        // Then
        XCTAssertTrue(secondLabel.exists)
    }
   
    func testLoginButtonExists() throws {
        // When
        let loginButton = app.buttons["LOGIN"]
        // Then
        XCTAssertTrue(loginButton.exists)
    }
    
    func testSignUpButtonExists() throws {
        // When
        let signUpButton = app.buttons["SIGN UP"]
        // Then
        XCTAssertTrue(signUpButton.exists)
    }
    
    func testLoginInteraction()throws {
        let loginButton = app.buttons["LOGIN"]
        loginButton.tap()
    }
        
    func testSignupInteraction()throws {
        let signUpButton = app.buttons["SIGN UP"]
        signUpButton.tap()
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
