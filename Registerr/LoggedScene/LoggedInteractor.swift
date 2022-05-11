//
//  LoggedInteractor.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

final class LoggedInteractor: LoggedBusinessLogic, LoggedDataStore {
    var rawCredentialStore: Credential?

    private let presenter: LoggedPresentationLogic

    init(
        presenter: LoggedPresentationLogic
    ) {
        self.presenter = presenter

    }

    func requestInitForm(_ request: Logged.InitForm.Request) {
        let response = Logged.InitForm.Response(loginStatus: rawCredentialStore?.loginStatus ?? .incorrect, passwordStatus: rawCredentialStore?.passwordStatus ?? .incorrect)
        self.presenter.presentInitForm(response)
    }
}
