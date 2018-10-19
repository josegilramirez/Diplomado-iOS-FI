//
//  CommonCryptoDigestTests.swift
//  CommonCryptoDigestTests
//
//  Created by José Gil Ramírez S on 06/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import XCTest
@testable import CommonCryptoDigest

class CommonCryptoDigestTests: XCTestCase {
    
    let lipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    func testSha1() {
        let result = Digests.sha1(string: lipsum)
        XCTAssertEqual("cd36b370758a259b34845084a6cc38473cb95e27", result)
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
