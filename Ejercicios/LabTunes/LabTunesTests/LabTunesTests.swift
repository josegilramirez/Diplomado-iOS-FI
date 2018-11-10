//
//  LabTunesTests.swift
//  LabTunesTests
//
//  Created by José Gil Ramírez S on 11/9/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import XCTest
@testable import LabTunes

class LabTunesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let session = Session.sharedInstance
        session.token = nil
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //Las funciones de prueba deben empezar como "test"

    func testSuccessLogin() {
        XCTAssertTrue(User.login(userName: "iOSLab", password: "secreta"))
    }

    func testWrongLogin() {
        XCTAssertFalse(User.login(userName: "androidLab", password: "secreta"))
    }
    
    func testSaveSession() {
        let session = Session.sharedInstance
        let _ = User.login(userName: "iOSLab", password: "algo")
        XCTAssertNotNil(session.token)
    }
    
    func testFailLogin() {
        let session = Session.sharedInstance
        let _ = User.login(userName: "androidLab", password: "algo")
        XCTAssertNil(session.token)
    }
    
    func testExpectedToken() {
        let _ = User.login(userName: "iOSLab", password: "algo")
        let session = Session.sharedInstance
        XCTAssertEqual(session.token, "1234567890", "Token Should Match")
    }
    
    func testNotExpectedToken() {
        let _ = User.login(userName: "iOSLab", password: "algo")
        let session = Session.sharedInstance
        XCTAssertNotEqual(session.token, "01234567890", "Token Should Not Match")
    }
    
    func testNotSessionAvailable() {
        //No hay sesión inicializada
        XCTAssertThrowsError(try User.fetchSongs())
    }
    
    func testSongResults() {
        var resultSongs: [Song] = []
        let promise = expectation(description: "Songs downloaded")
        Music.fetchSongs { (songs) in
            resultSongs = songs
            promise.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotEqual(resultSongs.count, 0)
    }
}
