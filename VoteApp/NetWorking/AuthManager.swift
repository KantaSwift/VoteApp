//
//  AuthManager.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/11/16.
//

import Foundation
import Firebase
import FirebaseAuthCombineSwift
import Combine

final class AuthManager {
    
    static let shared = AuthManager()
    
    func registerUser(with email: String, password: String) -> AnyPublisher<User, Error> {
        return Auth.auth().createUser(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }
}
