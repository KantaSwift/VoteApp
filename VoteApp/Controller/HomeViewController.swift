//
//  HomeViewController.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/22.
//

import UIKit
import Parchment

class HomeViewController: UIViewController {
    
    private let teamName = ["チーム1", "チーム2", "チーム3", "チーム４"]
    
    private lazy var viewControllers: [UIViewController] = {
        let team1VC = TeamViewController()
        let team2VC = TeamViewController()
        let team3VC = TeamViewController()
        let team4VC = TeamViewController()
        return [team1VC, team2VC, team3VC, team4VC]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        let pagingVC = PagingViewController(viewControllers: viewControllers)
        addChild(pagingVC)
        view.addSubview(pagingVC.view)
        pagingVC.dataSource = self
        pagingVC.view.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
}

extension HomeViewController: PagingViewControllerDataSource, PagingViewControllerDelegate {
    
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return teamName.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers[index]
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: teamName[index])
    }
}

