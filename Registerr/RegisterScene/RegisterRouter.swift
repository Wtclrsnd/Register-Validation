//
//  RegisterRouter.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterRouter: RegisterRoutingLogic, RegisterDataPassing {
    weak var viewController: UIViewController?
    let dataStore: RegisterDataStore

    init(dataStore: RegisterDataStore) {
        self.dataStore = dataStore
    }

    func moveToLogged(viewModel: Register.InitForm.ViewModel) {
        let loggedVC = LoggedAssembly.build()
        viewController?.navigationController?.pushViewController(loggedVC, animated: true)
    }
}
