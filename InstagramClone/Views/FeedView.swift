//
//  FeedView.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 9.12.2024.
//

import SwiftUI

struct FeedView: View {
    let posts = [
        Post(username: "john_doe",
             userImage: "user1",
             postImage: "post1",
             likes: 128,
             caption: "Harika bir gün!",
             timestamp: "2s"),
        Post(username: "jane_doe",
             userImage: "user2",
             postImage: "post2",
             likes: 256,
             caption: "Muhteşem manzara!",
             timestamp: "5s")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(posts) { post in
                        VStack(spacing: 8) {
                            // Post Header
                            HStack {
                                Image(post.userImage)
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .clipShape(Circle())
                                Text(post.username)
                                    .font(.system(size: 14, weight: .semibold))
                                Spacer()
                                Image(systemName: "ellipsis")
                            }
                            .padding(.horizontal)
                            
                            // Post Image
                            Image(post.postImage)
                                .resizable()
                                .scaledToFit()
                            
                            // Action Buttons
                            HStack {
                                HStack(spacing: 16) {
                                    Button(action: {}) {
                                        Image(systemName: "heart")
                                            .font(.system(size: 20))
                                    }
                                    Button(action: {}) {
                                        Image(systemName: "message")
                                            .font(.system(size: 20))
                                    }
                                    Button(action: {}) {
                                        Image(systemName: "paperplane")
                                            .font(.system(size: 20))
                                    }
                                }
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName: "bookmark")
                                        .font(.system(size: 20))
                                }
                            }
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            
                            // Likes
                            Text("\(post.likes) beğeni")
                                .font(.system(size: 14, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            // Caption
                            HStack {
                                Text(post.username).font(.system(size: 14, weight: .semibold)) +
                                Text(" ") +
                                Text(post.caption).font(.system(size: 14))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            
                            // Timestamp
                            Text(post.timestamp)
                                .font(.system(size: 12))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Instagram")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "camera")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "paperplane")
                    }
                }
            }
        }
    }
}



#Preview {
    FeedView()
}
