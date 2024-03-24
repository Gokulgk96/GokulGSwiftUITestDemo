//
//  GokulGSwiftUITestDemoTests.swift
//  GokulGSwiftUITestDemoTests
//
//  Created by Gokul Gopalakrishnan on 24/02/24.
//

import XCTest
@testable import GokulGSwiftUITestDemo

final class GokulGSwiftUITestDemoTests: XCTestCase {
    
    var model: contentViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        model = contentViewModel()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        model = nil
    }

    func testSuccessScenarioExample() throws {
        
       var (bool1,bool2) = model.loginAuthenticationCheck(nameField: "123", passField: "abc")
        
        XCTAssertEqual(bool1, false)
        XCTAssertEqual(bool2, true)
        
    }
    
    func testFailureScenarioExample() throws {
       
       var (bool1,bool2) = model.loginAuthenticationCheck(nameField: "1234", passField: "1223")
        
        XCTAssertEqual(bool1, true)
        XCTAssertEqual(bool2, false)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
