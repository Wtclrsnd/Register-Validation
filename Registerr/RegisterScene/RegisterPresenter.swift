//
//  RegisterPresenter.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class RegisterPresenter: RegisterPresentationLogic {
    weak var view: RegisterDisplayLogic?
    
    func presentSolution(_ response: Register.InitForm.Response) {
        let model = Register.InitForm.ViewModel(loginStatus: response.loginStatus, passwordStatus: response.passwordStatus)
        view?.displaySolution(model)
    }
}
