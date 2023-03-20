//
//  RegisterViewViewModel.swift
//  SDU News
//
//  Created by  Mukhammed Ali Khamzayev on 17.03.2023.
//
import Foundation
import Firebase
import FirebaseAuth
import Combine

final class RegisterViewViewModel: ObservableObject {
    
    private var subscriptions: Set<AnyCancellable> = []
    
    @Published var repetitionOfPassword: String?
    @Published var fullName: String?
    @Published var email: String?
    @Published var password: String?
    @Published var isRegistrationFormValid: Bool = false
    @Published var user: User?
    @Published var error: String?
    
    func validateRegistrationForm() {
        
        isRegistrationFormValid = verifyPattern()
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
    }
    
    func verifyPattern() -> Bool{
        guard let fullName = fullName,
              let email = email,
              let password = password,
              let repetitionOfPassword = repetitionOfPassword
        else {return false}
        isRegistrationFormValid = isValidEmail(email) && password.count >= 6 && (password == repetitionOfPassword) && fullName.count >= 3
        
        return isRegistrationFormValid
    }
    
    func createUser() {
        guard let email = email,
                let password = password
        else {return}
        AuthenticationManager.shared.registerUser(with: email, password: password).sink {[weak self] completion in
            
            if case .failure(let error) = completion {
                self?.error = error.localizedDescription
            }
            
        } receiveValue: { [weak self] user in
            self?.user = user
        }
        .store(in: &subscriptions)

    }
    
    func loginUser() {
        guard let email = email,
                let password = password
        else {return}
        AuthenticationManager.shared.loginUser(with: email, password: password).sink {[weak self] completion in
            
            if case .failure(let error) = completion {
                self?.error = error.localizedDescription
            }
            
        } receiveValue: { [weak self] user in
            self?.user = user
        }
        .store(in: &subscriptions)

    }
    
}
