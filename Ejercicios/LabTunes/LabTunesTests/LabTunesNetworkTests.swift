//
//  LabTunesNetworkTests.swift
//  LabTunesTests
//
//  Created by José Gil Ramírez S on 11/9/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import XCTest
@testable import LabTunes

class LabTunesNetworksTests: XCTestCase {
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: .default)
    }
    
    //Asi va a tronar la prueba porque los Asserts de las pruebas se ejecuta antes de la respuesta del server
//    func testValidCallToiTunes() {
//        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Queen")
//        var statusCode: Int?
//        var responseError: Error?
//
//        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
//            statusCode = (response as? HTTPURLResponse)?.statusCode
//            responseError = error
//        }
//        dataTask.resume()
//        XCTAssertNil(responseError)
//        XCTAssertEqual(statusCode, 200)
//    }
    
    //Insertamos una promesa con expectation, fulfill y waitForExpectations
    func testValidCallToiTunes() {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Queen")
        var statusCode: Int?
        var responseError: Error?
        let promise = expectation(description: "Handler Invoked")
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testSlowValidaCallToiTunes() {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Queen")
        let promise = expectation(description: "Status code: 200")
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
            else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                }
                else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
}

