//
//  RegisterViewController.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController, RegisterDisplayLogic {

    // MARK: - UI Elements
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

    private lazy var validationLoginLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .red
        label.isHidden = true
        label.font = .systemFont(ofSize: 15)
        label.text = "Login is empty"
        return label
    }()

    private lazy var validationPasswordLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .red
        label.isHidden = true
        label.font = .systemFont(ofSize: 15)
        label.text = "Password is incorrect"
        return label
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

    // MARK: - Refs and Inits
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

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpUI()
        loginButton.addTarget(self, action: #selector(loggingIn), for: .touchUpInside)

        loginTextField.addTarget(self, action: #selector(loginValidation), for: [.editingDidEnd, .editingChanged])
        passwordTextField.addTarget(self, action: #selector(passwordValidation), for: [.editingDidEnd, .editingChanged])

    }

    // MARK: - SetUpUI
    private func setUpUI() {
        stack.addArrangedSubview(loginTextField)
        stack.addArrangedSubview(validationLoginLabel)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(validationPasswordLabel)
        stack.addArrangedSubview(loginButton)
        view.addSubview(stack)

        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
    }

    // MARK: - Handlers
    @objc private func loggingIn() {
        let request = Register.InitForm.Request(login: loginTextField.text ?? "", password: passwordTextField.text ?? "", loginStatus: .entered, passwordStatus: .entered)

        interactor.analyzeCredential(request)
    }

    @objc private func loginValidation() {
        let request = Register.InitForm.Request(login: loginTextField.text ?? "", password: passwordTextField.text ?? "", loginStatus: .entered, passwordStatus: .notEntered)
        interactor.analyzeLogin(request)
    }

    @objc private func passwordValidation() {
        let request = Register.InitForm.Request(login: loginTextField.text ?? "", password: passwordTextField.text ?? "", loginStatus: .notEntered, passwordStatus: .entered)
        interactor.analyzePassword(request)
    }

    // MARK: - RegisterDisplayLogic

    func displaySolution(_ viewModel: Register.InitForm.ViewModel) {
        switch viewModel.loginStatus {
        case .isLong:
            validationLoginLabel.text = "login is long"
            validationLoginLabel.isHidden = false
        case .isShort:
            validationLoginLabel.text = "login is short"
            validationLoginLabel.isHidden = false
        case .isEmpty:
            validationLoginLabel.text = "login is empty"
            validationLoginLabel.isHidden = false
        default:
            validationLoginLabel.isHidden = true
        }

        switch viewModel.passwordStatus {
        case .isLong:
            validationPasswordLabel.text = "password is long"
            validationPasswordLabel.isHidden = false
        case .isShort:
            validationPasswordLabel.text = "password is short"
            validationPasswordLabel.isHidden = false
        case .isEmpty:
            validationPasswordLabel.text = "password is empty"
            validationPasswordLabel.isHidden = false
        default:
            validationPasswordLabel.isHidden = true
        }

        if viewModel.loginStatus == .sucsess && viewModel.passwordStatus == .sucsess {
            router.moveToLogged(viewModel: viewModel)
        }
    }

    func displayLoginSolution(_ viewModel: Register.InitForm.ViewModel) {
        switch viewModel.loginStatus {
        case .isLong:
            validationLoginLabel.text = "login is long"
            validationLoginLabel.isHidden = false
        case .isShort:
            validationLoginLabel.text = "login is short"
            validationLoginLabel.isHidden = false
        case .isEmpty:
            validationLoginLabel.text = "login is empty"
            validationLoginLabel.isHidden = false
        default:
            validationLoginLabel.isHidden = true
        }
    }

    func displayPasswordSolution(_ viewModel: Register.InitForm.ViewModel) {
        switch viewModel.passwordStatus {
        case .isLong:
            validationPasswordLabel.text = "password is long"
            validationPasswordLabel.isHidden = false
        case .isShort:
            validationPasswordLabel.text = "password is short"
            validationPasswordLabel.isHidden = false
        case .isEmpty:
            validationPasswordLabel.text = "password is empty"
            validationPasswordLabel.isHidden = false
        default:
            validationPasswordLabel.isHidden = true
        }

    }
}
