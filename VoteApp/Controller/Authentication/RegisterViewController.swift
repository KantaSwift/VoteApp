//
//  RegisterViewController.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/31.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    private let registerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "自分のアカウントを作ろう"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("アカウントを作成", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 30
        button.backgroundColor = UIColor(displayP3Red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.isEnabled = false
        button.addTarget(self, action: #selector(registerButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var totalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [registerTitleLabel, emailTextField, passwordTextField, registerButton])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraint()
    }
    
    private func setupViews() {
        view.addSubview(totalStackView)
    }
    
    private func setupConstraint() {
        totalStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, topPadding: 15, leftPadding: 15)
        registerButton.anchor(height: 60)
    }
    
    @objc private func registerButtonDidTap() {
        print(#function)
    }
}
