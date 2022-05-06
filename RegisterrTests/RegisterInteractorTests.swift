//
//  RegisterrTests.swift
//  RegisterrTests
//
//  Created by Emil Shpeklord on 28.04.2022.
//

import XCTest
@testable import Registerr

class RegisterInteractorTests: XCTestCase {

    var sut: RegisterInteractor!
    var presenter: RegisterPresenterMock!

    override func setUpWithError() throws {
        presenter = RegisterPresenterMock()
        sut = RegisterInteractor(presenter: presenter)
    }

    override func tearDownWithError() throws {
        presenter = nil
        sut = nil
    }

    func testLongLoginSucsess() throws {
        // given
        let request = Register.InitForm.Request(login: "AAAAAAAAAAAAAAAAAAAAAAAA", password: "00000", loginStatus: .notEntered, passwordStatus: .notEntered)
        // when
        sut.analyzeLogin(request)
        let loginSt = presenter.responseDisplay.loginStatus
        // then
        XCTAssertEqual(loginSt, .isLong)
    }

    func testShortLoginSucsess() throws {
        let request = Register.InitForm.Request(login: "AA", password: "000000", loginStatus: .notEntered, passwordStatus: .notEntered)
        // when
        sut.analyzeLogin(request)
        let loginSt = presenter.responseDisplay.loginStatus
        // then
        XCTAssertEqual(loginSt, .isShort)
    }

    func testLongPasswordSucsess() throws {
        let request = Register.InitForm.Request(login: "AAAAAA", password: "00000000000000000000", loginStatus: .notEntered, passwordStatus: .notEntered)
        sut.analyzePassword(request)
        let passSt = presenter.responseDisplay.passwordStatus
        XCTAssertEqual(passSt, .isLong)
    }

    func testShortPasswordSucsess() {
        let request = Register.InitForm.Request(login: "AAAAAA", password: "00", loginStatus: .notEntered, passwordStatus: .notEntered)
        sut.analyzePassword(request)
        let passSt = presenter.responseDisplay.passwordStatus
        XCTAssertEqual(passSt, .isShort)
    }

    func testAllFieldsEmptySucsess() {
        let request = Register.InitForm.Request(login: "", password: "", loginStatus: .notEntered, passwordStatus: .notEntered)
        sut.analyzeLogin(request)
        sut.analyzePassword(request)
        let status = presenter.responseDisplay
        XCTAssertEqual(status.loginStatus, .isEmpty)
        XCTAssertEqual(status.passwordStatus, .isEmpty)
    }
}
