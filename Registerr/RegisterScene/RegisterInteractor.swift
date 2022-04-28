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

    func requestInitForm(_ request: Register.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Register.InitForm.Response())
        }
    }
}
