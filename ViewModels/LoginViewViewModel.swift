//
//  LoginViewViewModel.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 30.11.2024.
//

import Foundation
import Combine

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Lütfen email ve şifre giriniz"
            showError = true
            return
        }
        
        guard isValidEmail(email) else {
            errorMessage = "Geçerli bir email adresi giriniz"
            showError = true
            return
        }
        
        isLoading = true
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self = self else { return }
            
             
            if self.email == "test@test.com" && self.password == "123456" {
                self.isLoggedIn = true
            } else {
                self.errorMessage = "Email veya şifre hatalı"
                self.showError = true
                
            }
            
            self.isLoading = false
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
