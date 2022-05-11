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
        // given
        let request = Register.InitForm.Request(login: "AA", password: "000000", loginStatus: .notEntered, passwordStatus: .notEntered)
        // when
        sut.analyzeLogin(request)
        let loginSt = presenter.responseDisplay.loginStatus
        // then
        XCTAssertEqual(loginSt, .isShort)
    }

    func testLongPasswordSucsess() throws {
        // given
        let request = Register.InitForm.Request(login: "AAAAAA", password: "00000000000000000000", loginStatus: .notEntered, passwordStatus: .notEntered)
        // when
        sut.analyzePassword(request)
        let passSt = presenter.responseDisplay.passwordStatus
        // then
        XCTAssertEqual(passSt, .isLong)
    }

    func testShortPasswordSucsess() throws {
        // given
        let request = Register.InitForm.Request(login: "AAAAAA", password: "00", loginStatus: .notEntered, passwordStatus: .notEntered)
        // when
        sut.analyzePassword(request)
        let passSt = presenter.responseDisplay.passwordStatus
        // then
        XCTAssertEqual(passSt, .isShort)
    }

    func testAllFieldsEmptySucsess() throws {
        // given
        let request = Register.InitForm.Request(login: "", password: "", loginStatus: .notEntered, passwordStatus: .notEntered)
        // when
        sut.analyzeLogin(request)
        sut.analyzePassword(request)
        let status = presenter.responseDisplay
        // then
        XCTAssertEqual(status.loginStatus, .isEmpty)
        XCTAssertEqual(status.passwordStatus, .isEmpty)
    }

    func testCorrectDataSucsess() throws {
        // given
        let request = Register.InitForm.Request(login: "EmilShpeklord", password: "123456", loginStatus: .correct, passwordStatus: .correct)
        // when
        sut.analyzeLoggedIn(request)
        let status = presenter.responseDisplay
        // then
        XCTAssertEqual(status.loginStatus, .correct)
        XCTAssertEqual(status.passwordStatus, .correct)
    }

    func testIncorrectDataFailure() throws {
        let request = Register.InitForm.Request(login: "AAAAAAAA", password: "PPPPPPP", loginStatus: .notEntered, passwordStatus: .notEntered)
        sut.analyzeLoggedIn(request)
        let status = presenter.responseDisplay
        XCTAssertNotEqual(status.loginStatus, .correct)
        XCTAssertNotEqual(status.passwordStatus, .correct)
    }

    func testStringAppendingMeasure() throws {
        var str = "A"
        measure {
            for _ in 0...100000 {
                str.append("B")
            }
        }
    }

    func testStringAddingMeasure() throws {
        var str = "A"
        measure {
            for _ in 0...100000 {
                str = str + "B"
            }
        }
    }

    func testStringWritingMeasure() throws {
        var str = "A"
        measure {
            for _ in 0...100000 {
                str.write("B")
            }
        }
    }
}
