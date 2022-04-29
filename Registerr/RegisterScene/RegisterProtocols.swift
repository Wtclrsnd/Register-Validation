//
//  RegisterProtocols.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol RegisterDataPassing {
    var dataStore: RegisterDataStore { get }
}

protocol RegisterDataStore {}

protocol RegisterBusinessLogic {
    func analyzeCredential(_ request: Register.InitForm.Request)
}

protocol RegisterWorkerLogic {}

protocol RegisterPresentationLogic {
    func presentSolution(_ response: Register.InitForm.Response)
}

protocol RegisterDisplayLogic: AnyObject {
    func displaySolution(_ viewModel: Register.InitForm.ViewModel)
}

protocol RegisterRoutingLogic {
    func moveToLogged(viewModel: Register.InitForm.ViewModel)
}
