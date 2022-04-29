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

    func analyzeCredential(_ request: Register.InitForm.Request) {
        if request.login.isEmpty || request.password.isEmpty || request.password.count < 6 {
            presenter.presentReject()
        } else {
            let response = Register.InitForm.Response(login: request.login, password: request.password, status: .sucsess)
            presenter.presentSolution(response)
        }
    }
}
