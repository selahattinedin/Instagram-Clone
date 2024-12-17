//
//  LoginView.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 17.12.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationStack{
            VStack{
                TextField("Email Giriniz", text: $email)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                SecureField("Şifre Giriniz", text: $password)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                   
            }
            Button{}label: {
                Text("Giriş Yap")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color("buttonTextColor"))
                    
                    .padding()
                    
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .overlay (
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("buttonTextColor"), lineWidth: 1)
            )
            .padding(.horizontal,24)
            Button{}label: {
                Text("Şifremi Unuttum")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.trailing, 24)
                    
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

#Preview {
    LoginView()
}
