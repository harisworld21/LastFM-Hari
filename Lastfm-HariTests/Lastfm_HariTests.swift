//
//  Lastfm_HariTests.swift
//  Lastfm-HariTests
//
//  Created by Hari Prasath on 08/03/2020.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//

import XCTest
@testable import Lastfm_Hari




class Lastfm_HariTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCheckArtist() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "Test wait")
        let searchVM = SearchViewModel()
        searchVM.updateScopeId(scope: "Artist")
        let url = searchVM.parseUrl(searchKey: "B")
        searchVM.computeCurrentScope(parseUrl: url, completionHandler: { playItems in
            XCTAssert(playItems.count>0)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }
    
    func testCheckAlbum() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "Test wait")
        let searchVM = SearchViewModel()
        searchVM.updateScopeId(scope: "Album")
        let url = searchVM.parseUrl(searchKey: "C")
        searchVM.computeCurrentScope(parseUrl: url, completionHandler: { playItems in
            XCTAssert(playItems.count>0)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }
    
    func testCheckTrack() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "Test wait")
        let searchVM = SearchViewModel()
        searchVM.updateScopeId(scope: "Track")
        let url = searchVM.parseUrl(searchKey: "D")
        searchVM.computeCurrentScope(parseUrl: url, completionHandler: { playItems in
            XCTAssert(playItems.count>0)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
