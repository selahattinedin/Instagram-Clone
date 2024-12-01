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
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    // Logo
                    Image("instagram-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(.top, 100)
                    
                    // Email field
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                    
                    // Password field
                    SecureField("Şifre", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    // Login button
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
                    
                    // Şifremi Unuttum & Kayıt Ol
                    VStack(spacing: 15) {
                        Button("Şifreni mi unuttun?") {
                            // Şifre sıfırlama işlemi
                        }
                        .foregroundColor(.blue)
                        
                        HStack {
                            Text("Hesabın yok mu?")
                            Button("Kayıt Ol") {
                                // Kayıt sayfasına yönlendirme
                            }
                            .foregroundColor(.blue)
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
            .navigationBarHidden(true)
        }
        .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
            // Ana sayfaya yönlendirme
            MainView()
        }
    }
}

// MainView.swift (Örnek ana sayfa)
struct MainView: View {
    var body: some View {
        Text("Ana Sayfa")
    }
}

// Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

#Preview {
    LoginView()
}
