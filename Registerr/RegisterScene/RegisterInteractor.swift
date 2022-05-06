//
//  RegisterInteractor.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

final class RegisterInteractor: RegisterBusinessLogic, RegisterDataStore {
    private let presenter: RegisterPresentationLogic

    init(
        presenter: RegisterPresentationLogic
    ) {
        self.presenter = presenter
    }

    func analyzeLogin(_ request: Register.InitForm.Request) {
        var response = Register.InitForm.Response(loginStatus: .notEntered, passwordStatus: .notEntered)
        if request.loginStatus == .correct {
            response.loginStatus = .correct
        } else {
            switch request.login.count {
            case 0:
                response.loginStatus = .isEmpty
            case 0..<6:
                response.loginStatus = .isShort
            case 20...:
                response.loginStatus = .isLong
            default:
                response.loginStatus = .incorrect
            }
        }
        presenter.presentLoginSolution(response)
    }

    func analyzePassword(_ request: Register.InitForm.Request) {
        var response = Register.InitForm.Response(loginStatus: .notEntered, passwordStatus: .notEntered)
        if request.passwordStatus == .correct {
            response.passwordStatus = .correct
        } else {
            switch request.password.count {
            case 0:
                response.passwordStatus = .isEmpty
            case 0..<6:
                response.passwordStatus = .isShort
            case 12...:
                response.passwordStatus = .isLong
            default:
                response.passwordStatus = .incorrect
            }
            presenter.presentPasswordSolution(response)
        }
    }

    func analyzeLoggedIn(_ request: Register.InitForm.Request) {
        var response = Register.InitForm.Response(loginStatus: .notEntered, passwordStatus: .notEntered)
        switch (request.loginStatus, request.passwordStatus) {
        case (.correct, .correct):
            response.loginStatus = .correct
            response.passwordStatus = .correct
            presenter.presentLoggedIn(response)
        case (.entered, .entered):
            analyzeLogin(request)
            analyzePassword(request)
        default:
            response.loginStatus = .incorrect
            response.passwordStatus = .incorrect
            presenter.presentLoggedIn(response)
        }
    }
}
