//
//  RegisterrUITests.swift
//  RegisterrUITests
//
//  Created by Emil Shpeklord on 28.04.2022.
//

import XCTest

final class RegisterrUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testButtonExistsSucsess() throws {
        let buttonID = "LoginButton"
        let predicate = NSPredicate(format: "identifier == '\(buttonID)'")
        let button = app
            .descendants(matching: .button)
            .matching(predicate)
            .element
        XCTAssert(button.exists)
        button.tap()
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
