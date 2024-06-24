//
//  LoginViewUITest.swift
//  Assignment22SwiftUIUITests
//
//  Created by Ebillson Grand Jean on 6/23/24.
//

import XCTest

final class LoginViewUITest: XCTestCase {
    
    var app: XCUIApplication!
    var loginButton: XCUIElement!
    var emailTextField: XCUIElement!
    var passwordTextField: XCUIElement!
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launch()
        
        loginButton = app.buttons["LOGIN"]
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
        
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
        let welcomeLabel = app.staticTexts["Welcome!"]
        XCTAssertTrue(welcomeLabel.exists)
        
        let signInToContinueLabel = app.staticTexts["Sign In to continue"]
        XCTAssertTrue(signInToContinueLabel.exists)
        
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

        let dontHaveAnAccountLabel = app.staticTexts["Don't have an account?"]
        XCTAssertTrue(dontHaveAnAccountLabel.exists)
        
        
        let signUpNavLink = app.buttons["Sign up"]
        XCTAssertTrue(signUpNavLink.exists)
        
        
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
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
