//
//  LoggedInteractor.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

final class LoggedInteractor: LoggedBusinessLogic, LoggedDataStore {
    private let presenter: LoggedPresentationLogic
    private let worker: LoggedWorkerLogic

    init(
        presenter: LoggedPresentationLogic,
        worker: LoggedWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: Logged.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Logged.InitForm.Response())
        }
    }
}
