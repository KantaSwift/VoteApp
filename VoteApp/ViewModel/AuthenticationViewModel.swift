//
//  AuthenticationViewModel.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/11/16.
//

import Foundation
import Firebase
import Combine

final class AuthenticationViewModel: ObservableObject {
    
    @Published var email: String?
    @Published var password: String?
    @Published var isAuthenticationFromValid: Bool = false
    
    private var subscription = Set<AnyCancellable>()
    
    func validateAuthenticationForm() {
       guard let email = email,
             let password = password else {
           isAuthenticationFromValid = false
           return
       }
        isAuthenticationFromValid = isValidEmail(email) && password.count >= 8
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func createUser() {
        guard let email = email,
              let password = password else { return }
        AuthManager.shared.registerUser(with: email, password: password)
            .sink { [weak self] _ in
                // コールバック
            } receiveValue: { [weak self] user in
                self?.createUser()
            }
            .store(in: &subscription)
    }
}
