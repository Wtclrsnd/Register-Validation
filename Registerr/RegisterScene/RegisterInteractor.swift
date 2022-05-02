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
    private let worker: RegisterWorkerLogic

    init(
        presenter: RegisterPresentationLogic,
        worker: RegisterWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func analyzeLogin(_ request: Register.InitForm.Request) {
        var response = Register.InitForm.Response(loginStatus: .notEntered, passwordStatus: .notEntered)
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
        presenter.presentLoginSolution(response)
    }

    func analyzePassword(_ request: Register.InitForm.Request) {
        var response = Register.InitForm.Response(loginStatus: .notEntered, passwordStatus: .notEntered)
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
        presenter.presentPasswordSolution(response)
    }
}
