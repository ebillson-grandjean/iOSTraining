//
//  SignUpViewControllerUITest.swift
//  Assigment18UnitTestingUITestingUITests
//
//  Created by Ebillson Grand Jean on 6/18/24.
//

import XCTest

final class SignUpViewControllerUITest: XCTestCase {

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
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testSignUpInteractionAndValidation()throws {
        let signupButton = app.buttons["SIGN UP"]
        signupButton.tap()
        
        let hiLabel = app.staticTexts["Hi!"]
        XCTAssertTrue(hiLabel.exists)
        
        let newAccountLabel = app.textViews["Create a new account"]
        XCTAssertTrue(newAccountLabel.exists)
        
        let usernameTextField = app.textFields["Username"]
        XCTAssertTrue(usernameTextField.exists)
        
        let emailTextField = app.textFields["Email"]
        XCTAssertTrue(emailTextField.exists)
        
        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        
        
        XCTAssertTrue(signupButton.exists)
        
        
//        signupButton.tap()
        
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
