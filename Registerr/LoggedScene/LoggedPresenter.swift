//
//  LoggedPresenter.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class LoggedPresenter: LoggedPresentationLogic {
    weak var view: LoggedDisplayLogic?

    func presentInitForm(_ response: Logged.InitForm.Response) {
        view?.displayInitForm(Logged.InitForm.ViewModel())
    }
}
