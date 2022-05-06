//
//  LoggedAssembly.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum LoggedAssembly {
    static func build(_ model: Register.InitForm.ViewModel) -> UIViewController {
        let presenter = LoggedPresenter()
        let interactor = LoggedInteractor(presenter: presenter)
        let router = LoggedRouter(dataStore: interactor)
        let viewController = LoggedViewController(interactor: interactor, router: router)

        interactor.rawData = model
        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
