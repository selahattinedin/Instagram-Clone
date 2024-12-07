//
//  LoginView.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 30.11.2024.
//

import SwiftUI


struct LoginView: View {
    @StateObject private var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 20) {
                    Image("instagram-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(.top, 100)
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                    
                    SecureField("Şifre", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: {
                        viewModel.login()
                    }) {
                        Text("Giriş Yap")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                viewModel.email.isEmpty || viewModel.password.isEmpty ?
                                Color.blue.opacity(0.5) : Color.blue
                            )
                            .cornerRadius(5)
                    }
                    .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    VStack(spacing: 15) {
                        Button("Şifreni mi unuttun?") {
                            
                        }
                        .foregroundColor(.blue)
                        
                        HStack {
                            Text("Hesabın yok mu?")
                            NavigationLink(destination: RegisterView()) {
                                Text("Kayıt Ol")
                                    .foregroundColor(.blue)
                            }
                        }
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
}




#Preview {
    LoginView()
}
