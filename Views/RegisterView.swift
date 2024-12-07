//
//  RegisterView.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 7.12.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image("instagram-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.top, 80)
                
                Text("Arkadaşlarınla fotoğraf paylaşmak için kaydol.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                TextField("Kullanıcı Adı", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(.horizontal)
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal)
                
                SecureField("Şifre", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Şifreyi Onayla", text: $viewModel.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    viewModel.register()
                }) {
                    Text("Kayıt Ol")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            viewModel.email.isEmpty || viewModel.password.isEmpty ||
                            viewModel.username.isEmpty || viewModel.confirmPassword.isEmpty ?
                            Color.blue.opacity(0.5) : Color.blue
                        )
                        .cornerRadius(5)
                }
                .disabled(
                    viewModel.email.isEmpty || viewModel.password.isEmpty ||
                    viewModel.username.isEmpty || viewModel.confirmPassword.isEmpty
                )
                .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    Text("Hesabın var mı?")
                    Button("Giriş Yap") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
                .padding(.bottom, 20)
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.2))
            }
        }
        .alert(isPresented: $viewModel.showError) {
            Alert(
                title: Text("Hata"),
                message: Text(viewModel.errorMessage),
                dismissButton: .default(Text("Tamam"))
            )
        }
    }
}


#Preview {
    RegisterView()
}
