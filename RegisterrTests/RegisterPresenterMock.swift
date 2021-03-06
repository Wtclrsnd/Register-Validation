//
//  RegisterPresenterMock.swift
//  RegisterrTests
//
//  Created by Emil Shpeklord on 03.05.2022.
//

import Foundation
@testable import Registerr

final class RegisterPresenterMock: RegisterPresentationLogic {
    var responseDisplay: Register.InitForm.Response = Register.InitForm.Response(loginStatus: .notEntered, passwordStatus: .notEntered)

    func presentLoginSolution(_ response: Register.InitForm.Response) {
        responseDisplay.loginStatus = response.loginStatus
    }

    func presentPasswordSolution(_ response: Register.InitForm.Response) {
        responseDisplay.passwordStatus = response.passwordStatus
    }

    func presentLoggedIn(_ response: Register.InitForm.Response) {
        if response.loginStatus == .correct && response.passwordStatus == .correct {
            responseDisplay.loginStatus = .correct
            responseDisplay.passwordStatus = .correct
        } else {
            responseDisplay.loginStatus = .incorrect
            responseDisplay.passwordStatus = .incorrect
        }
    }

}
