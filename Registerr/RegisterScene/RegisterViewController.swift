//
//  RegisterViewController.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController, RegisterDisplayLogic {
    private let interactor: RegisterBusinessLogic
    private let router: RegisterRoutingLogic

    init(interactor: RegisterBusinessLogic, router: RegisterRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        initForm()
    }

    // MARK: - RegisterDisplayLogic

    func displayInitForm(_ viewModel: Register.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Register.InitForm.Request())
    }
}
