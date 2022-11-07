//
//  PlayerHeaderView.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/27.
//

import UIKit

final class PlayerHeaderView: UIView {
    
    private enum TeamName: String {
        case team1 = "イナズマイレブン"
        case team2 = "エイリア学園"
        case team3 = "五里霧中"
        case team4 = "我孫子イレブン"
        
        var index: Int {
            switch self {
            case .team1:
                return 0
            case .team2:
                return 1
            case .team3:
                return 2
            case .team4:
                return 3
            }
        }
    }
    
    private var selectedTab = 0 {
        didSet {
            for i in 0..<tabs.count {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) { [weak self] in
                    self?.teamSectionStackView.arrangedSubviews[i].tintColor = i == self?.selectedTab ? .label : .secondaryLabel
                    self?.leftAnchors[i].isActive = i == self?.selectedTab ? true : false
                    self?.rightAnchors[i].isActive = i == self?.selectedTab ? true : false
                    self?.layoutIfNeeded()
                }
            }
        }
    }
    
    private let indicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    private var leftAnchors = [NSLayoutConstraint]()
    private var rightAnchors = [NSLayoutConstraint]()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "出場チーム＆選手"
        label.font = .systemFont(ofSize: 35, weight: .heavy)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private let teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testImage")
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let teamLabel: UILabel = {
        let label = UILabel()
        label.text = "No.1 イナズマイレブン"
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .label
        return label
    }()
    
    private var playerDataModel = PlayerDataModel.mockup()
    
    private lazy var teamCountLabel: UILabel = {
        let label = UILabel()
        label.text = "メンバー\(playerDataModel.count)人"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let team1: UILabel = {
        let label = UILabel()
        label.text = "イナズマイレブン"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let team2: UILabel = {
        let label = UILabel()
        label.text = "エイリア学園"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let team3: UILabel = {
        let label = UILabel()
        label.text = "五里霧中"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let team4: UILabel = {
        let label = UILabel()
        label.text = "我孫子イレブン"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var tabs: [UIButton] = ["イナズマイレブン", "エイリア学園", "五里霧中", "我孫子イレブン"].map { buttonTitle  in
        let button = UIButton(type: .system)
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.tintColor = .label
        button.addTarget(self, action: #selector(teamSectionDidTap(_:)), for: .touchUpInside)
        return button
    }
    
    private lazy var teamSectionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraint()
        configureTeamSection()
        configureUnBasicConstraint()
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(teamImageView)
        addSubview(teamLabel)
        addSubview(teamCountLabel)
        addSubview(teamSectionStackView)
        addSubview(indicator)
    }
    
    private func configureTeamSection() {
        for (index, button) in teamSectionStackView.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else { return }
            button.tag = index
            if index == selectedTab {
                button.tintColor = .label
            } else {
                button.tintColor = .secondaryLabel
            }
        }
    }
    
    @objc private func teamSectionDidTap(_ sender: UIButton) {
        guard let teamName = sender.titleLabel?.text else { return }
        switch teamName {
        case TeamName.team1.rawValue:
            selectedTab = sender.tag
        case TeamName.team2.rawValue:
            selectedTab = sender.tag
        case TeamName.team3.rawValue:
            selectedTab = sender.tag
        case TeamName.team4.rawValue:
            selectedTab = sender.tag
        default:
            print("index out of range")
        }
    }
    
    private func configureUnBasicConstraint() {
        for i in 0..<tabs.count  {
            let leftAnchor = indicator.leftAnchor.constraint(equalTo: teamSectionStackView.arrangedSubviews[i].leftAnchor)
            leftAnchors.append(leftAnchor)
            let rightAnchor = indicator.rightAnchor.constraint(equalTo: teamSectionStackView.arrangedSubviews[i].rightAnchor)
            rightAnchors.append(rightAnchor)
        }
        
        let indicatorConstraint = [
            leftAnchors[0],
            rightAnchors[0],
            indicator.topAnchor.constraint(equalTo: teamSectionStackView.arrangedSubviews[0].bottomAnchor, constant: 5),
            indicator.heightAnchor.constraint(equalToConstant: 4)
        ]
        
        NSLayoutConstraint.activate(indicatorConstraint)
    }
    
    private func setupConstraint() {
        titleLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        teamImageView.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, topPadding: 10)
        teamImageView.anchor(height: 165)
        teamLabel.anchor(top: teamImageView.bottomAnchor, left: leftAnchor, topPadding: 10, leftPadding: 10)
        teamCountLabel.anchor(top: teamLabel.bottomAnchor, left: teamLabel.leftAnchor, topPadding: 10)
        teamSectionStackView.anchor(top: teamCountLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, topPadding: 10, leftPadding: 10, rightPadding: 10)
        teamSectionStackView.anchor(height: 35)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
