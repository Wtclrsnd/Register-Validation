//
//  LoggedAssembly.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum LoggedAssembly {
    static func build() -> UIViewController {
        let presenter = LoggedPresenter()
        let worker = LoggedWorker()
        let interactor = LoggedInteractor(presenter: presenter, worker: worker)
        let router = LoggedRouter(dataStore: interactor)
        let viewController = LoggedViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
