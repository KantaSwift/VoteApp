//
//  ProfileView.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/24.
//

import UIKit

final class ProfileView {
    
    struct Constants {
        static let backgroundAlphaTo: CGFloat = 0.6
    }
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private let alertView: UIView = {
        let alert = UIView()
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 12
        return alert
    }()
    
    func showAlert(with title: String, message: String, on viewController: UIViewController) {
        
        guard let targetView = viewController.view else {
            return
        }
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.backgroundView.alpha = Constants.backgroundAlphaTo
        }
    }
    
    func dismissAlert() {
        
    }
}
