//
//  RegisterAssembly.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum RegisterAssembly {
    static func build() -> UIViewController {
        let presenter = RegisterPresenter()
        let worker = RegisterWorker()
        let interactor = RegisterInteractor(presenter: presenter, worker: worker)
        let router = RegisterRouter(dataStore: interactor)
        let viewController = RegisterViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
