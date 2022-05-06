//
//  LoggedProtocols.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol LoggedDataPassing {
    var dataStore: LoggedDataStore { get }
}

protocol LoggedDataStore {}

protocol LoggedBusinessLogic {
    func requestInitForm(_ request: Logged.InitForm.Request)
}

protocol LoggedPresentationLogic {
    func presentInitForm(_ response: Logged.InitForm.Response)
}

protocol LoggedDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Logged.InitForm.ViewModel)
}

protocol LoggedRoutingLogic {}
