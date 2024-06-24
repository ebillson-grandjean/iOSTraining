//
//  LoginViewControllerUITest.swift
//  Assigment18UnitTestingUITestingUITests
//
//  Created by Ebillson Grand Jean on 6/18/24.
//

import XCTest
//@testable import Assigment18UnitTestingUITesting

final class LoginViewControllerUITest: XCTestCase {

//    var listViewModel: ListViewModel!
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launch()

//        listViewModel = ListViewModel()
        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        listViewModel = nil
        app = nil
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
       
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLoginInteractionAndValidation()throws {
        let loginButton = app.buttons["LOGIN"]
        loginButton.tap()
        
        let welcomeLabel = app.staticTexts["Welcome!"]
        XCTAssertTrue(welcomeLabel.exists)
        
        let signInToContinueTextViews = app.textViews["Sign In to continue"]
        XCTAssertTrue(signInToContinueTextViews.exists)
        
        let emailTextField = app.textFields["Email"]
        XCTAssertTrue(emailTextField.exists)
        
        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        emailTextField.tap()
        emailTextField.typeText("a@mail.com")
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        
        XCTAssertTrue(loginButton.exists)
        
        let forgotPasswordLabel = app.staticTexts["Forgot Password?"]
        XCTAssertTrue(forgotPasswordLabel.exists)
        
        loginButton.tap()
        
    }
    
   
    
    
//    func testReadDataFromJSONFile_WhenWeAreExpecting_CorrectData() throws {
//        
//        // When
////        let expectation = expectation(description: "We call readDataFromJSONFile, we should get JSON file")
//        
////        let data: () = self.listViewModel.readDataFromJSONFile()
//           
//        
//    
////        XCTAssertTrue(data.count > 0)
////            expectation.fulfill()
//        
//        
////        wait(for: [expectation], timeout: 1.5)
//    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
