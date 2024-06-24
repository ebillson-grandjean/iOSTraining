//
//  LoginViewModelTests.swift
//  Assigment18UnitTestingUITestingTests
//
//  Created by Ebillson Grand Jean on 6/18/24.
//



/*
 Test Case writing - XCTest Framework
 
 1- Unit Test Cases - Test the business logic
 2- UI Test Cases - Test the UI Elements (whether they are clickable, interactable, or we test the flows if they happen or not)
 
 Testing Methodologies:
 1- Test Driven Development (TDD)
    
    Write Test Cases First, make them fail -> Then write your logic, make it work, repeat the same for different edge
 
    Red -> Green -> Refactor Approach: Retro TDD
 
 2- Behavioral Driven Development (BDD)
    
 
 
 */


import XCTest
@testable import Assigment18UnitTestingUITesting

final class LoginViewModelTests: XCTestCase {
    
    var loginViewModel: LoginViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("Inside setUpWithError")

        loginViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("Inside tearDownWithError")
        loginViewModel = nil
    }

    func testAreCredentialsValid_WhenWeAreExpecting_CorrectOutput() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        print("Inside testCase")
        // When
        let expectation = expectation(description: "When inputs are correct, I expect the function test to pass")
        let result = loginViewModel.areCredentialsValid(email: "test@mail.com", password: "123456")
        // Then
        XCTAssertTrue(result)
        expectation.fulfill()
        wait(for: [expectation])
    }
    
    
    
    func testAreCredentialsValid_WhenEmailIDIsEmpty_IncorrectOutput() throws {
        
        print("Inside testCase")
        // When
        let expectation = expectation(description: "When my email is empty, I expect the function test to fail")
        let result = loginViewModel.areCredentialsValid(email: "", password: "123456")
        // Then
        XCTAssertFalse(result)
        expectation.fulfill()
        wait(for: [expectation])
    }
    
    
    func testAreCredentialsValid_WhenPasswordIsEmpty_IncorrectOutput() throws {
        
        print("Inside testCase")
        // When
        let expectation = expectation(description: "When my password is empty, I expect the function test to fail")
        let result = loginViewModel.areCredentialsValid(email: "a@email.com", password: "")
        // Then
        XCTAssertFalse(result)
        expectation.fulfill()
        wait(for: [expectation])
    }
    
    
    func testAreCredentialsValid_WhenEmailIDIsWrong_IncorrectOutput() throws {
        
        print("Inside testCase")
        // When
        let expectation = expectation(description: "When my email is wrong, I expect the function test to fail")
        let result = loginViewModel.areCredentialsValid(email: "a.email.com", password: "123456")
        // Then
        XCTAssertFalse(result)
        expectation.fulfill()
        wait(for: [expectation])
    }
    
    
    func testAreCredentialsValid_WhenPasswordIsWrong_IncorrectOutput() throws {
       
        print("Inside testCase")
        // When
        let expectation = expectation(description: "When my password is wrong, I expect the function test to fail")
        let result = loginViewModel.areCredentialsValid(email: "a@email.com", password: "12345")
        // Then
        XCTAssertFalse(result)
        expectation.fulfill()
        wait(for: [expectation])
    }
    
    
    
    func testAreCredentialsValid_WhenBothFieldsAreEmpty_IncorrectOutput() throws {
       
        print("Inside testCase")
        // When
        let expectation = expectation(description: "When both fields are empty, I expect the function test to fail")
        let result = loginViewModel.areCredentialsValid(email: "", password: "")
        // Then
        XCTAssertFalse(result)
        expectation.fulfill()
        wait(for: [expectation])
    }
    
    
    func testAreCredentialsValid_WhenBothFieldsInvalidInputs_IncorrectOutput() throws {
       
        print("Inside testCase")
        // When
        let expectation = expectation(description: "When both fields are invalid inputs, I expect the function test to fail")
        let result = loginViewModel.areCredentialsValid(email: "a.mail.com", password: "12")
        // Then
        XCTAssertFalse(result)
        expectation.fulfill()
        wait(for: [expectation])
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
