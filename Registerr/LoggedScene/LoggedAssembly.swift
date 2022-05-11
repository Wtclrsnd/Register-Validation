//
//  LoggedAssembly.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum LoggedAssembly {
    static func build(_ model: Credential) -> UIViewController {
        let presenter = LoggedPresenter()
        let interactor = LoggedInteractor(presenter: presenter)
        let viewController = LoggedViewController(interactor: interactor)

        interactor.rawCredentialStore = model
        presenter.view = viewController
        
        return viewController
    }
}
