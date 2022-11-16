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
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .label
        return label
    }()
    
    private let backNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    private let backNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.text = "背番号"
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var playerInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [backNumberLabel, playerNameLabel, positionLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [playerInfoStackView, commentLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var totalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, stackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraint()
    }
    
    private func setupViews() {
        contentView.addSubview(totalStackView)
    }
    
    private func setupConstraint() {
        profileImageView.anchor(width:40, height: 40)
        totalStackView.anchor(left: leftAnchor,right: rightAnchor, centerY: centerYAnchor, leftPadding: 10, rightPadding: 150)
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
