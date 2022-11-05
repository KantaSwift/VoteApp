//
//  HomeViewController.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let playerDataModel = PlayerDataModel.mockup()
    
    private let playerTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlayerCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private lazy var voteButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 30
        button.setTitle("投票", for: .normal)
        button.backgroundColor = .systemPurple
        button.tintColor = .white
        button.layer.shadowOffset = .init(width: 1.5, height: 2.0)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 15
        button.addTarget(self, action: #selector(voteButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerTableView.dataSource = self
        playerTableView.delegate = self
        
        let headerView = PlayerHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 330))
        playerTableView.tableHeaderView = headerView
        setupViews()
        setupConstraint()
        configureNavigationBar()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        playerTableView.frame = view.frame
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "12/18 あけぼのやまサッカー大会"
    }
    
    private func setupViews() {
        view.addSubview(playerTableView)
        view.addSubview(voteButton)
    }
    
    @objc private func voteButtonDidTap() {
       let homeVC = VoteViewController()
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    private func setupConstraint() {
        voteButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, bottomPadding: 20, rightPadding: 30)
        voteButton.anchor(width: 60, height: 60)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerCell
        cell.configure(playerData: playerDataModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
