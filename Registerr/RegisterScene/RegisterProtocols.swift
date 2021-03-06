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

protocol RegisterDataStore {
    var credentialDataStore: Credential { get set }
}

protocol RegisterBusinessLogic {
    var credentialDataStore: Credential { get set }
    func analyzeLogin(_ request: Register.InitForm.Request)
    func analyzePassword(_ request: Register.InitForm.Request)
    func analyzeLoggedIn(_ request: Register.InitForm.Request)
}

protocol RegisterWorkerLogic {}

protocol RegisterPresentationLogic {
    func presentLoginSolution(_ response: Register.InitForm.Response)
    func presentPasswordSolution(_ response: Register.InitForm.Response)
    func presentLoggedIn(_ response: Register.InitForm.Response)
}

protocol RegisterDisplayLogic: AnyObject {
    func displayLoginSolution(_ viewModel: Register.InitForm.ViewModel)
    func displayPasswordSolution(_ viewModel: Register.InitForm.ViewModel)
    func displayLoggedIn(_ viewModel: Register.InitForm.ViewModel)
}

protocol RegisterRoutingLogic {
    func moveToLogged(credential: Credential)
}
