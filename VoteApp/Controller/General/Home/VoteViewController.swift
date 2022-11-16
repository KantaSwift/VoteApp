//
//  VoteViewController.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/28.
//

import UIKit

final class VoteViewController: UIViewController {
    
    private let voteTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlayerCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        voteTableView.frame = view.frame
    }
    
    private func setupViews() {
        voteTableView.dataSource = self
        voteTableView.delegate = self
        view.addSubview(voteTableView)
    }
}

extension VoteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
