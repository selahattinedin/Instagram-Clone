//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 12.12.2024.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack{
            //profil fotoğrafı ve kullanıcı adı sol tarafta
            HStack{
                Image("Ben")
                    .resizable()
                    .scaledToFill()
                    .frame(width:40, height: 40)
                    .clipShape(.circle)
                Text("Selahattin Edin")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.leading, 8)
            //post görseli
            Image("yemek")
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipShape(Rectangle())
            //action butonları burada gösterilecek
            HStack{
                Button{}label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button{}label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button{}label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(Color("buttonTextColor"))
            //beğeni sayısı ve like gösterimi burada olacak
            Text("300 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top,1)
            //açıklama kısmı burada olacak 
            HStack{
                Text("Selahattin Edin")
                    .fontWeight(.semibold) +
                Text("Çok lezzetli bir yemek")
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .font(.footnote)
            .padding(.leading, 8)
            .padding(.top, 1)
            
            Text("10h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.top, 1)
                .foregroundStyle(.gray)
            
        }
    }
    }


#Preview {
    FeedCell()
}
