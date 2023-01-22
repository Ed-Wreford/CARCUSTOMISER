//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Ed Wreford on 15/01/2023.
//

import XCTest

final class CarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtTiresAndExhaustPackageOtherTwoUpgradesAreDisabled() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        //action
        
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery/*@START_MENU_TOKEN@*/.switches["Exhaust package (Cost: 500)"]/*[[".cells.switches[\"Exhaust package (Cost: 500)\"]",".switches[\"Exhaust package (Cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.switches["Tires package (Cost: 500)"]/*[[".cells.switches[\"Tires package (Cost: 500)\"]",".switches[\"Tires package (Cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //assert
        
        XCTAssertEqual(collectionViewsQuery/*@START_MENU_TOKEN@*/.switches["Nitro boost package (Cost: 500)"]/*[[".cells.switches[\"Nitro boost package (Cost: 500)\"]",".switches[\"Nitro boost package (Cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
        XCTAssertEqual(collectionViewsQuery/*@START_MENU_TOKEN@*/.switches["God package (Cost: 1000)"]/*[[".cells.switches[\"God package (Cost: 1000)\"]",".switches[\"God package (Cost: 1000)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
        
        
        

        
        
        
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
