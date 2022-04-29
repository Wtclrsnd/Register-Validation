//
//  LoggedRouter.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class LoggedRouter: LoggedRoutingLogic, LoggedDataPassing {
    weak var viewController: UIViewController?
    let dataStore: LoggedDataStore

    init(dataStore: LoggedDataStore) {
        self.dataStore = dataStore
    }
}

private extension LoggedRouter {
//    func passDataTo_() {
//        source: LoggedDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
