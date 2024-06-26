//
//  PlanetViewModelTests.swift
//  Assignment24SwiftUIMVVMSwapiPlanetsTests
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import XCTest
@testable import Assignment24SwiftUIMVVMSwapiPlanets


final class PlanetViewModelTests: XCTestCase {

    var planetViewModel: PlanetViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        planetViewModel = PlanetViewModel(webServiceManager: FakeWebServiceManager())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        planetViewModel = nil
    }

    func testGetPlanet_WhenExpecting_CorrectData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        
        // When
        planetViewModel.getPlanetList(urlString: "PlanetTestData")
        let expectation = XCTestExpectation(description: "When Expecting Correct Data")
        let waitDuration = 2.0
        
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            XCTAssertNotNil(self.planetViewModel)
            let planetList = self.planetViewModel.planetArray
            XCTAssertEqual(planetList.count, 10)
            
            let planet = planetList.first
            XCTAssertEqual(planet?.name, "Alderaan")
            XCTAssertEqual(planet?.climate, "temperate")
            XCTAssertEqual(planet?.population, "2000000000")
            
            XCTAssertNil(self.planetViewModel.customError)
            XCTAssertFalse(self.planetViewModel.hasErrorOccured)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: waitDuration)
    }
    
    func testGetPlanet_WhenEndpointIsEmpty_Expecting_NoData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // When
        planetViewModel.getPlanetList(urlString: "")
        let expectation = XCTestExpectation(description: "When Endpoint is wrong, expecting no data")
        
        let waitDuration = 2.0
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            
            XCTAssertNotNil(self.planetViewModel)
            let planetList = self.planetViewModel.planetArray
            XCTAssertEqual(planetList.count, 0)
            
            let error = self.planetViewModel.customError
            
            XCTAssertEqual(error, WebServiceError.invalidURL)
            XCTAssertTrue(self.planetViewModel.hasErrorOccured)
            expectation.fulfill()
        }
        
        wait(for: [expectation])
    }
    
    func testGetPlanet_WhenEndpointHasWrongData_Expecting_ParsingError() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // When
        planetViewModel.getPlanetList(urlString: "PlanetTestWrongData")
        
        let expectation = XCTestExpectation(description: "When Endpoint is worng, Expecting parsing error")
        
        let waitDuration = 2.0
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            // Then
            XCTAssertNotNil(self.planetViewModel)
            let planetList = self.planetViewModel.planetArray
            XCTAssertEqual(planetList.count, 0)
            
            let error = self.planetViewModel.customError
            
            XCTAssertEqual(error, WebServiceError.parsingError)
            XCTAssertTrue(self.planetViewModel.hasErrorOccured)
            expectation.fulfill()
        }
        
        wait(for: [expectation])
    }

    
    func testGetPlanetList_WhenEndpointIsWrong_Expecting_NoData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // When
        planetViewModel.getPlanetList(urlString: "PlanetTestNoDataooo")
        let expectation = XCTestExpectation(description: "When endpoint is incorrect, expecting no data")
        
        let waitDuration = 2.0
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration) {
            XCTAssertNotNil(self.planetViewModel)
            let planetList = self.planetViewModel.planetArray
            XCTAssertEqual(planetList.count, 0)
            
            let error = self.planetViewModel.customError
            
            XCTAssertEqual(error, WebServiceError.noData)
            XCTAssertTrue(self.planetViewModel.hasErrorOccured)
            expectation.fulfill()
        }
        
        wait(for: [expectation])
    }
    
    
    func testFilterPlanet_WhenEndpointIsWrong_Expecting_SpecificData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // When
        planetViewModel.filterPlanetList(searchText: "Alderaan")
        let expectation = XCTestExpectation(description: "When endpoint is correct, expecting specific data")
        
        let waitDuration = 2.0
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration) {
            XCTAssertNotNil(self.planetViewModel)
            let planetList = self.planetViewModel.planetArray
            XCTAssertEqual(planetList.count, 1)
            
            let planet = planetList.first
            XCTAssertEqual(planet?.name, "Alderaan")
            XCTAssertEqual(planet?.climate, "temperate")
            XCTAssertEqual(planet?.population, "2000000000")
            
            XCTAssertNil(self.planetViewModel.customError)
            XCTAssertFalse(self.planetViewModel.hasErrorOccured)
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
