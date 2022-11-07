//
//  LoginViewController.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/31.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
    }
    
    private func setupConstraint() {
        
    }
}
