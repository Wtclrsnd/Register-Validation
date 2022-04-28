//
//  RegisterPresenter.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class RegisterPresenter: RegisterPresentationLogic {
    weak var view: RegisterDisplayLogic?

    func presentInitForm(_ response: Register.InitForm.Response) {
        view?.displayInitForm(Register.InitForm.ViewModel())
    }
}
