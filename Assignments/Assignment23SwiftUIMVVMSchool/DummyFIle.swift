//////
//////  DummyFIle.swift
//////  Assignment23SwiftUIMVVMSchool
//////
//////  Created by Ebillson Grand Jean on 6/25/24.
//////
//
//
//
////
////  SchoolViewModelTests.swift
////  Assignment23SwiftUIMVVMSchoolTests
////
////  Created by Ebillson Grand Jean on 6/25/24.
////
//
//import XCTest
//@testable import Assignment23SwiftUIMVVMSchool
//
//final class SchoolViewModelTests: XCTestCase {
//
//    var schoolViewModel: SchoolViewModel!
//    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//        // Given
//        schoolViewModel = SchoolViewModel(webServiceManager: FakeWebServiceManager())
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        schoolViewModel = nil
//    }
//
//    func testGetSchoolList_WhenExpecting_CorrectData() async throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//        
//        
//        // When
//        await schoolViewModel.getSchoolList(urlString: "SchoolTestData")
//        
//        // Then
//        XCTAssertNotNil(schoolViewModel)
//        let schoolList = schoolViewModel.schoolArray
//        XCTAssertEqual(schoolList.count, 440)
//        
//        let school = schoolList.first
//        XCTAssertEqual(school?.school_name, "Clinton School Writers & Artists, M.S. 260")
//        XCTAssertEqual(school?.school_email, "admissions@theclintonschool.net")
//        XCTAssertEqual(school?.phone_number, "212-524-4360")
//        
//        XCTAssertNil(schoolViewModel.customError)
//        XCTAssertFalse(schoolViewModel.hasErrorOccured)
//    }
//    
//    func testGetSchoolList_WhenEndpointIsWrong_Expecting_NoData() async throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//        
//        // When
//        await schoolViewModel.getSchoolList(urlString: "")
//        
//        // Then
//        XCTAssertNotNil(schoolViewModel)
//        let schoolList = schoolViewModel.schoolArray
//        XCTAssertEqual(schoolList.count, 0)
//        
//        let error = schoolViewModel.customError
//        
//        XCTAssertEqual(error, WebServiceError.invalidURL)
//        XCTAssertTrue(schoolViewModel.hasErrorOccured)
//    }
//    
//    func testGetSchoolList_WhenEndpointIsWrong_Expecting_ParsingError() async throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//        
//        // When
//        await schoolViewModel.getSchoolList(urlString: "SchoolTestWrongData")
//        
//        // Then
//        XCTAssertNotNil(schoolViewModel)
//        let schoolList = schoolViewModel.schoolArray
//        XCTAssertEqual(schoolList.count, 0)
//        
//        let error = schoolViewModel.customError
//        
//        XCTAssertEqual(error, WebServiceError.parsingError)
//        XCTAssertTrue(schoolViewModel.hasErrorOccured)
//    }
//
//    
//    func testGetSchoolList_WhenEndpointIsCorrect_Expecting_NoData() async throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//        
//        // When
//        await schoolViewModel.getSchoolList(urlString: "SchoolTestNoData")
//        
//        // Then
//        XCTAssertNotNil(schoolViewModel)
//        let schoolList = schoolViewModel.schoolArray
//        XCTAssertEqual(schoolList.count, 0)
//        
//        let error = schoolViewModel.customError
//        
//        XCTAssertEqual(error, WebServiceError.noData)
//        XCTAssertTrue(schoolViewModel.hasErrorOccured)
//    }
//   
//    
//    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
//
//
//
//
//
////
////  SchoolViewModel.swift
////  Assignment23SwiftUIMVVMSchool
////
////  Created by Ebillson Grand Jean on 6/25/24.
////
//
//import Foundation
//import Combine
//
//
//protocol SchoolViewModelActions {
//    func filterSchoolList(searchText: String)
//}
//
//class SchoolViewModel: ObservableObject {
//
//
//    @Published var schoolArray = [School]()
//    @Published var originalArray = [School]()
//    @Published var customError: WebServiceError?
//    @Published var hasErrorOccured = false
//    
//    var webServiceManager: WebServiceActions
//
//    init(webServiceManager: WebServiceActions){
//        self.webServiceManager = webServiceManager
//        simpleCombineDemo()
//    }
//
//    func simpleCombineDemo(){
//        // publisher
//        let numbers = [1, 2, 3, 4, 7].publisher
//
//        // operator
//        let squares = numbers.map{ $0 * $0}
//
//        //
//        let subscriber = squares.sink { value in
//            print(value)
//        }
//
//    }
//
//    @MainActor
//    func getSchoolList(urlString: String) {
//        guard let url = URL(string: urlString) else {
//            customError = WebServiceError.invalidURL
//            hasErrorOccured = true
//            return
//        }
//
//        guard let url = URL(string: urlString) else {
//                    customError = WebServiceError.invalidURL
//                    hasErrorOccured = true
//                    return
//                }
//                
//                do {
//                    schoolArray = try await self.webServiceManager.getDataFromWebService(url: url, modelType: [School].self)
//                    print(schoolArray)
//                }catch {
//                    hasErrorOccured = true
//                    print(error.localizedDescription)
//                    switch error {
//                    case is DecodingError:
//                        customError = WebServiceError.parsingError
//                    case is URLError:
//                        customError = WebServiceError.invalidURL
//                    case WebServiceError.parsingError:
//                        customError = WebServiceError.parsingError
//                    case WebServiceError.invalidResponse(let code):
//                        customError = WebServiceError.invalidResponse(code)
//                    default:
//                        customError = WebServiceError.noData
//                    }
//                    
//                }
//    }
//}
//
//
//extension SchoolViewModel: SchoolViewModelActions { // Open-close principle
//    func filterSchoolList(searchText: String) {
//        
//        if searchText.isEmpty {
//            schoolArray = self.originalArray
//        } else {
//            schoolArray = self.schoolArray.filter { school in
//                return school.school_name.localizedCaseInsensitiveContains(searchText)
//            }
//        }
//    }
//    
//    
//}
//


/*import Foundation
import Combine

 protocol WebServiceActions {
     func getDataFromWebService <T: Decodable> (url: URL, modelType: T.Type) -> AnyPublisher<T, Error>
 }


 class WebServiceManager {

     var urlSession: URLSession

     init(urlSession: URLSession = URLSession.shared) {
         self.urlSession = urlSession
     }

 }



 extension WebServiceManager: WebServiceActions {

     func getDataFromWebService<T: Decodable>(url: URL, modelType: T.Type) -> AnyPublisher<T, Error> {


         return self.urlSession.dataTaskPublisher(for: url)
             .map{$0.data} // {data, response}
             .decode(type: modelType, decoder: JSONDecoder()) // parsing
             .eraseToAnyPublisher()

     }
 }
*/
