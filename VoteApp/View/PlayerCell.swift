//
//  TeamCell.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/24.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "swiftimage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let playerNameLabel: UILabel = {
        let label = UILabel()
//        label.text = "上條栞汰"
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .label
        return label
    }()
    
    private let backNumberLabel: UILabel = {
        let label = UILabel()
//        label.text = "7"
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .label
        return label
    }()
    
    private let positionLabel: UILabel = {
        let label = UILabel()
//        label.text = "MF"
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .label
        return label
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
//        label.text = "よろしくお願いします。"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraint()
    }
    
    private func setupViews() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(playerNameLabel)
        contentView.addSubview(backNumberLabel)
        contentView.addSubview(positionLabel)
        contentView.addSubview(commentLabel)
    }
    
    private func setupConstraint() {
        profileImageView.anchor(left: leftAnchor, centerY: centerYAnchor, leftPadding: 10)
        profileImageView.anchor(width:40, height: 40)
        playerNameLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, topPadding: 18, leftPadding: 15)
        backNumberLabel.anchor(left: playerNameLabel.rightAnchor, centerY: playerNameLabel.centerYAnchor, leftPadding: 10)
        positionLabel.anchor(left: backNumberLabel.rightAnchor, centerY: backNumberLabel.centerYAnchor, leftPadding: 10)
        commentLabel.anchor(top: playerNameLabel.bottomAnchor, left: playerNameLabel.leftAnchor, topPadding: 10)
    }
    
    func configure(playerData: PlayerDataModel) {
        playerNameLabel.text = playerData.playerName
        backNumberLabel.text = playerData.backNumber
        positionLabel.text = playerData.position
        commentLabel.text = playerData.comment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
