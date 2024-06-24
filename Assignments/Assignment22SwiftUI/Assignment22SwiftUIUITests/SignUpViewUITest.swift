//
//  SignUpViewUITest.swift
//  Assignment22SwiftUIUITests
//
//  Created by Ebillson Grand Jean on 6/23/24.
//

import XCTest

final class SignUpViewUITest: XCTestCase {

    var app: XCUIApplication!
    var signUpButton: XCUIElement!
    var usernameTextField: XCUIElement!
    var emailTextField: XCUIElement!
    var passwordTextField: XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launch()
        
        signUpButton = app.buttons["SIGN UP"]
        usernameTextField = app.textFields["Username"]
        emailTextField = app.textFields["Email"]
        passwordTextField = app.secureTextFields["Password"]
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }
    
    func testLoginInteractionAndValidation()throws {
        
        XCTAssertTrue(signUpButton.exists)
        signUpButton.tap()
        
        let hiLabel = app.staticTexts["Hi!"]
        XCTAssertTrue(hiLabel.exists)
        
        let createAccountLabel = app.staticTexts["Create a new account"]
        XCTAssertTrue(createAccountLabel.exists)
        
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        usernameTextField.typeText("aUsername")
        
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText("a@mail.com")
        
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        
        let forgotPasswordButton = app.buttons["Forgot Password?"]
        XCTAssertTrue(forgotPasswordButton.exists)
        
        let orLabel = app.staticTexts["or"]
        XCTAssertTrue(orLabel.exists)
        
        let socialMediaLoginLabel = app.staticTexts["Social Media Login"]
        XCTAssertTrue(socialMediaLoginLabel.exists)
        
        let googleLogo = app.images["GoogleLogo"]
        XCTAssertTrue(googleLogo.exists)

        let facebookLogo = app.images["FacebookLogo"]
        XCTAssertTrue(facebookLogo.exists)

        let appleLogo = app.images["AppleLogo"]
        XCTAssertTrue(appleLogo.exists)

        let dontHaveAnAccountLabel = app.staticTexts["Already have an account?"]
        XCTAssertTrue(dontHaveAnAccountLabel.exists)
        
        let signInNavLink = app.buttons["Sign in"]
        XCTAssertTrue(signInNavLink.exists)
        
        XCTAssertTrue(signUpButton.exists)
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
