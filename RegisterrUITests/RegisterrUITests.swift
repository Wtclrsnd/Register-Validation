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

    func testValidationWorksSucsess() {
        let buttonID = "LoginButton"
        let validationLoginLabelID = "LoginValidationLabel"
        let validationPasswordLabelID = "PasswordValidationLabel"

        let buttonPredicate = NSPredicate(format: "identifier == '\(buttonID)'")
        let validationLoginLabelPredicate = NSPredicate(format: "identifier == '\(validationLoginLabelID)'")
        let validationPasswordLabelPredicate = NSPredicate(format: "identifier == '\(validationPasswordLabelID)'")

        let button = app
            .descendants(matching: .button)
            .matching(buttonPredicate)
            .element
        let loginLbl = app
            .descendants(matching: .staticText)
            .matching(validationLoginLabelPredicate)
            .element
        let passwordLbl = app
            .descendants(matching: .staticText)
            .matching(validationPasswordLabelPredicate)
            .element

        button.tap()
        XCTAssertEqual(loginLbl.label, "login is empty")
        XCTAssertEqual(passwordLbl.label, "password is empty")
    }

    func testLoginStopEditingValidation() {
        let loginTFID = "LoginTF"
        let passwordTFID = "PasswordTF"
        let validationLoginLabelID = "LoginValidationLabel"

        let loginPredicate = NSPredicate(format: "identifier == '\(loginTFID)'")
        let passwordPredicate = NSPredicate(format: "identifier == '\(passwordTFID)'")
        let validationLoginLabelPredicate = NSPredicate(format: "identifier == '\(validationLoginLabelID)'")

        let loginTF = app
            .descendants(matching: .textField)
            .matching(loginPredicate)
            .element
        let passwordTF = app
            .descendants(matching: .textField)
            .matching(passwordPredicate)
            .element
        let loginLbl = app
            .descendants(matching: .staticText)
            .matching(validationLoginLabelPredicate)
            .element

        loginTF.tap()
        passwordTF.tap()
        XCTAssertEqual(loginLbl.label, "login is empty")
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
