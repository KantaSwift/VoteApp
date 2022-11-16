//
//   OnboardingViewController.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/11/16.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "あなたの一票で\n最強の選手を決めよう"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "~decide the best player~"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var titleLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("アカウントを作る", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(createAccountButtonDidTap), for: .touchUpInside)
        button.backgroundColor = UIColor(displayP3Red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        return button
    }()
    
    private let promptLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .gray
        label.text = "既にアカウントを持っている方はこちら"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ログイン", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.tintColor = UIColor(displayP3Red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [promptLabel, loginButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 3
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraint()
    }
    
    private func setupViews() {
        view.addSubview(titleLabelStackView)
        view.addSubview(createAccountButton)
        view.addSubview(loginStackView)
    }
    
    private func setupConstraint() {
        titleLabelStackView.anchor(left: view.leftAnchor, right: view.rightAnchor, centerY: view.centerYAnchor, leftPadding: 10, rightPadding: 10)
        createAccountButton.anchor(top: titleLabelStackView.bottomAnchor, centerX: view.centerXAnchor, topPadding: 50)
        createAccountButton.anchor(width: 300, height: 50)
        loginStackView.anchor(bottom: view.bottomAnchor, left: view.leftAnchor, bottomPadding: 60, leftPadding: 20)
    }
    
    @objc private func createAccountButtonDidTap() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc private func loginButtonDidTap() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
