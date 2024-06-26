//
//  SchoolViewModelTests.swift
//  Day24CombineProjectTests
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import XCTest
@testable import Day24CombineProject

final class SchoolViewModelTest: XCTestCase {

    var schoolViewModel: SchoolViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        schoolViewModel = SchoolViewModel(webServiceManager: MockServiceManager())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        schoolViewModel = nil
    }

    func testGetSchoolList_WhenExpecting_CorrectData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        
        // When
        schoolViewModel.getSchoolList(urlString: "SchoolTestData")
        let expectation = XCTestExpectation(description: "When Expecting Correct Data")
        let waitDuration = 2.0
        
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            XCTAssertNotNil(self.schoolViewModel)
            let schoolList = self.schoolViewModel.schoolArray
            XCTAssertEqual(schoolList.count, 440)
            
            let school = schoolList.first
            XCTAssertEqual(school?.school_name, "A. Philip Randolph Campus High School")
            XCTAssertEqual(school?.school_email, "dfannin@schools.nyc.gov")
            XCTAssertEqual(school?.phone_number, "212-690-6800")
            
            XCTAssertNil(self.schoolViewModel.customError)
            XCTAssertFalse(self.schoolViewModel.hasErrorOccured)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: waitDuration)
    }
    
    func testGetSchoolList_WhenEndpointIsEmpty_Expecting_NoData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // When
        schoolViewModel.getSchoolList(urlString: "")
        let expectation = XCTestExpectation(description: "When Endpoint is wrong, expecting no data")
        
        let waitDuration = 2.0
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            
            XCTAssertNotNil(self.schoolViewModel)
            let schoolList = self.schoolViewModel.schoolArray
            XCTAssertEqual(schoolList.count, 0)
            
            let error = self.schoolViewModel.customError
            
            XCTAssertEqual(error, WebServiceError.invalidURL)
            XCTAssertTrue(self.schoolViewModel.hasErrorOccured)
            expectation.fulfill()
        }
        
        wait(for: [expectation])
    }
    
    func testGetSchoolList_WhenEndpointHasWrongData_Expecting_ParsingError() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // When
        schoolViewModel.getSchoolList(urlString: "SchoolTestWrongData")
        
        let expectation = XCTestExpectation(description: "When Endpoint is worng, Expecting parsing error")
        
        let waitDuration = 2.0
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            // Then
            XCTAssertNotNil(self.schoolViewModel)
            let schoolList = self.schoolViewModel.schoolArray
            XCTAssertEqual(schoolList.count, 0)
            
            let error = self.schoolViewModel.customError
            
            XCTAssertEqual(error, WebServiceError.parsingError)
            XCTAssertTrue(self.schoolViewModel.hasErrorOccured)
            expectation.fulfill()
        }
        
        wait(for: [expectation])
    }

    
    func testGetSchoolList_WhenEndpointIsWrong_Expecting_NoData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // When
        schoolViewModel.getSchoolList(urlString: "SchoolTestNoDataooo")
        let expectation = XCTestExpectation(description: "When endpoint is incorrect, expecting no data")
        
        let waitDuration = 2.0
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration) {
            XCTAssertNotNil(self.schoolViewModel)
            let schoolList = self.schoolViewModel.schoolArray
            XCTAssertEqual(schoolList.count, 0)
            
            let error = self.schoolViewModel.customError
            
            XCTAssertEqual(error, WebServiceError.noData)
            XCTAssertTrue(self.schoolViewModel.hasErrorOccured)
            expectation.fulfill()
        }
        
        wait(for: [expectation])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
