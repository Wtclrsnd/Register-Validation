//
//  RegisterInteractorMock.swift
//  RegisterrTests
//
//  Created by Emil Shpeklord on 03.05.2022.
//

import Foundation
@testable import Registerr

final class RegisterInteractorMock: RegisterBusinessLogic {
    var response = Register.InitForm.Response(loginStatus: .notEntered, passwordStatus: .notEntered)
    func analyzeLogin(_ request: Register.InitForm.Request) {
        switch request.login.count {
        case 0:
            response.loginStatus = .isEmpty
        case 0..<6:
            response.loginStatus = .isShort
        case 12...:
            response.loginStatus = .isLong
        default:
            response.loginStatus = .sucsess
        }
    }

    func analyzePassword(_ request: Register.InitForm.Request) {
        switch request.password.count {
        case 0:
            response.passwordStatus = .isEmpty
        case 0..<6:
            response.passwordStatus = .isShort
        case 12...:
            response.passwordStatus = .isLong
        default:
            response.passwordStatus = .sucsess
        }
    }
}
