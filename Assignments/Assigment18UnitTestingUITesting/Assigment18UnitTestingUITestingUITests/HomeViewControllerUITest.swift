//
//  LoginControllerUITest.swift
//  Assigment18UnitTestingUITestingUITests
//
//  Created by Ebillson Grand Jean on 6/18/24.
//

import XCTest
@testable import Assigment18UnitTestingUITesting

final class HomeiewControllerUITest: XCTestCase {

    
//    var loginViewController: LoginViewController!
    var app:  XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // Given
        app = XCUIApplication()
        app.launch()
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginControllerID") as! LoginViewController
//        setup the view hierarchy
//        _ = loginViewController.view
//        loginViewController = LoginViewController()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
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
        let secondLabel = app.textViews["Best Place to write life stories and share your journey experiences"]
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
    
//    func testLoginInteraction()throws {
//        let loginButton = app.buttons["LOGIN"]
//        loginButton.tap()
//    }
    
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
