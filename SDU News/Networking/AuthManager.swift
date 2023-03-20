//
//  AuthenticationManager.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 17.03.2023.
//

import Foundation
import Firebase
import Combine
import FirebaseAuthCombineSwift


class AuthenticationManager {
    
    
    
    static let shared = AuthenticationManager()
    
    func registerUser(with email: String, password: String) -> AnyPublisher<User, Error > {
        
        return Auth.auth().createUser(withEmail: email, password: password).map(\.user).eraseToAnyPublisher()
    }
    
    func loginUser(with email: String, password: String) -> AnyPublisher<User, Error>  {
        return Auth.auth().signIn(withEmail: email, password: password).map(\.user).eraseToAnyPublisher()
        
    }
    
    
}
