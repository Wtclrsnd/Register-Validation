//
//  LoggedViewController.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class LoggedViewController: UIViewController, LoggedDisplayLogic {
    private let interactor: LoggedBusinessLogic
    private let router: LoggedRoutingLogic

    init(interactor: LoggedBusinessLogic, router: LoggedRoutingLogic) {
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
        initForm()
        view.backgroundColor = .cyan
    }

    // MARK: - LoggedDisplayLogic

    func displayInitForm(_ viewModel: Logged.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Logged.InitForm.Request())
    }
}
