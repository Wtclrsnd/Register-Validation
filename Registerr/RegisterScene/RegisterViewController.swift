//
//  RegisterViewController.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController, RegisterDisplayLogic {

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()

    private lazy var loginTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 25)
        textField.placeholder = "login"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 25)
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("LogIn", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        return button
    }()

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
        setUpUI()
        loginButton.addTarget(self, action: #selector(loggingIn), for: .touchUpInside)
    }

    private func setUpUI() {
        stack.addArrangedSubview(loginTextField)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(loginButton)
        view.addSubview(stack)

        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
    }

    @objc private func loggingIn() {
        let request = Register.InitForm.Request(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
        interactor.analyzeCredential(request)
    }
    // MARK: - RegisterDisplayLogic

    func displaySolution(_ viewModel: Register.InitForm.ViewModel) {}

    func displayReject() {
        let alertController = UIAlertController(title: "Incorrect credential", message: "login password are not correct", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default) { (action) -> Void in
            print("The user is okay.")
        }
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: {
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        })
    }
}
