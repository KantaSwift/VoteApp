//
//  CustomAlertProfileView.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/31.
//

import UIKit

final class CustomAlertProfileView: UIView {
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "userName"
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "自己紹介"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("閉じる", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(nameLabel)
        addSubview(profileLabel)
        addSubview(closeButton)
    }
    
    private func setupConstraint() {
        nameLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, topPadding: 15)
        
    }
    
}
