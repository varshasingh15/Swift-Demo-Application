//
//  DemoAppTests.swift
//  DemoAppTests
//
//  Created by Varsha Singh on 5/26/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import XCTest
@testable import DemoApp2

class DemoApp2AppTests: XCTestCase {
    
    var requestExpectation: XCTestExpectation?
    var contentArray: [ContentModel] = [] // contentArray : to store all data

    override func setUp() {
        super.setUp()
        //  This method is called before the invocation of each test method in the class.
        requestExpectation = expectation(description: "bookContentRetrieved")

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // This method is used to test API response
    func testJSONResponse() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            
            APIClient.getContentAPI { (json) in
                if let results = json?["results"] as? [ContentJSON] {
                    for dict in results {
                        let contentDict = ContentModel(dictionary: dict)
                        self.contentArray.append(contentDict)
                        if self.contentArray.count > 0 {
                            XCTAssert(true)
                        } else {
                            XCTAssert(false)
                        }
                    }
                    self.requestExpectation?.fulfill()
                }
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }   
    
}
