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

    var rawData: Register.InitForm.ViewModel?

    init(
        presenter: LoggedPresentationLogic
    ) {
        self.presenter = presenter
    }

    func requestInitForm(_ request: Logged.InitForm.Request) {
        let response = Logged.InitForm.Response(loginStatus: rawData?.loginStatus ?? .incorrect, passwordStatus: rawData?.passwordStatus ?? .incorrect)
        self.presenter.presentInitForm(response)
    }
}
