//
//  LoggedViewController.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class LoggedViewController: UIViewController, LoggedDisplayLogic {

    private lazy var displayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 55)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

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
        setUpUI()
    }

    private func setUpUI() {
        view.addSubview(displayLabel)

        displayLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        displayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    // MARK: - LoggedDisplayLogic

    func displayInitForm(_ viewModel: Logged.InitForm.ViewModel) {
        switch (viewModel.loginStatus, viewModel.passwordStatus) {
        case (.correct, .correct):
            displayLabel.text = "Welcome Emil!"
            view.backgroundColor = .green
        default:
            displayLabel.text = "Who R U???"
            view.backgroundColor = .red
        }
    }

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Logged.InitForm.Request())
    }
}
