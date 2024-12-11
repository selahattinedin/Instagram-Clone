//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 11.12.2024.
//

import SwiftUI

struct ProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)

    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    VStack(spacing: 10){
                        HStack(){
                            Image("Ben")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            Spacer()
                            HStack{
                                UserStatView(value: 15, title: "Posts")
                                UserStatView(value: 15, title: "Followers")
                                UserStatView(value: 15, title: "Following")
                            }
                            
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment:.leading, spacing: 4){
                            Text("Selahattin Edin")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Merhaba ben bir öğrenciyim.")
                                .font(.footnote)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        Button{}label: {
                            Text("Edit Profil")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .frame(width: 360, height: 32)
                                .foregroundStyle(Color("buttonTextColor"))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 60)
                                        .stroke(.gray,lineWidth: 1)
                                }
                        }
                        
                        Divider()
                        
                    }
                    LazyVGrid(columns: gridItems,spacing: 1){
                        ForEach(0...20, id:\.self){index in
                            Image("yemek")
                                .resizable()
                                .scaledToFill()
                        }
                    }
                }
            }
            .navigationTitle("profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{}label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color("buttonTextColor"))
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
