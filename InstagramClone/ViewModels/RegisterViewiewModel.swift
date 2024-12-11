//
//  RegisterViewiewModel.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 7.12.2024.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var username = ""
    @Published var isLoading = false
    @Published var isRegistered = false
    @Published var showError = false
    @Published var errorMessage = ""
    
    func register() {
        if password != confirmPassword {
            errorMessage = "Şifreler eşleşmiyor"
            showError = true
            return
        }
        
        isLoading = true
        
        // Burada Firebase veya başka bir backend servisi ile kayıt işlemi yapılabilir
        // Örnek simülasyon:
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.isLoading = false
            self?.isRegistered = true
            // Hata durumu için:
            // self?.errorMessage = "Kayıt işlemi başarısız"
            // self?.showError = true
        }
    }
}

