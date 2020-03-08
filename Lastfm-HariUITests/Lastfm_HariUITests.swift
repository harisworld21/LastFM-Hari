//
//  Lastfm_HariUITests.swift
//  Lastfm-HariUITests
//
//  Created by HariRamya on 08/03/20.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//

import XCTest

class Lastfm_HariUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunch() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSearchAlbum() {
        let app = XCUIApplication()
        app.launch()
        app.searchFields["Search Album, Artist or Track"].tap()
        app.searchFields["Search Album, Artist or Track"].typeText("H")
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Humbug"]/*[[".cells.staticTexts[\"Humbug\"]",".staticTexts[\"Humbug\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Back"].tap()
    }
    
    func testSearchArtist(){
        let app = XCUIApplication()
        app.launch()
        app.searchFields["Search Album, Artist or Track"].tap()
        app.searchFields["Search Album, Artist or Track"].typeText("T")
        app/*@START_MENU_TOKEN@*/.buttons["Artist"]/*[[".segmentedControls[\"scopeBar\"].buttons[\"Artist\"]",".buttons[\"Artist\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["The Cure"]/*[[".cells.staticTexts[\"The Cure\"]",".staticTexts[\"The Cure\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Back"].tap()
    }
    
    func testSearchTrack(){
        let app = XCUIApplication()
        app.launch()
        app.searchFields["Search Album, Artist or Track"].tap()
        app.searchFields["Search Album, Artist or Track"].typeText("V")
        app.buttons["Track"].tap()
        app.tables.staticTexts["VCR"].tap()
        app.buttons["Back"].tap()
    }
    
    func testSwitchAcross(){
        let app = XCUIApplication()
        app.launch()
        app.searchFields["Search Album, Artist or Track"].tap()
        app.searchFields["Search Album, Artist or Track"].typeText("K")
        app.buttons["Track"].tap()
        XCTAssert(app.tables.cells.count > 0)
        app.buttons["Artist"].tap()
        XCTAssert(app.tables.cells.count > 0)
        app.buttons["Album"].tap()
        XCTAssert(app.tables.cells.count > 0)
    }
    
    func testSwitchAcrossComplex(){
        let app = XCUIApplication()
        app.launch()
        app.searchFields["Search Album, Artist or Track"].tap()
        app.searchFields["Search Album, Artist or Track"].typeText("N")
        //Be in tracks
        app.buttons["Track"].tap()
        app.tables.staticTexts["National Anthem"].tap()
        app.buttons["Back"].tap()
        //Be in Artist
        app.buttons["Artist"].tap()
        app.tables.staticTexts["New Order"].tap()
        app.buttons["Back"].tap()
        //Be in Album
        app.buttons["Album"].tap()
        app.tables.staticTexts["Nevermind"].tap()
        app.buttons["Back"].tap()
        XCTAssert(app.tables.count > 0)
    }
    
    func testNegative(){
        let app = XCUIApplication()
        app.launch()
        app.searchFields["Search Album, Artist or Track"].tap()
        app.searchFields["Search Album, Artist or Track"].typeText("fidjnfd")
        XCTAssert(app.tables.cells.count == 0)
        //Be in tracks
        app.buttons["Track"].tap()
        XCTAssert(app.tables.cells.count == 0)
        //Be in Artist
        app.buttons["Artist"].tap()
        XCTAssert(app.tables.cells.count == 0)
        //Be in Album
        app.buttons["Album"].tap()
        XCTAssert(app.tables.cells.count == 0)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
