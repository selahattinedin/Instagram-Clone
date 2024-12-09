//
//  UserModel.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 9.12.2024.
//

import Foundation
struct Post: Identifiable {
    let id = UUID()
    let username: String
    let userImage: String
    let postImage: String
    let likes: Int
    let caption: String
    let timestamp: String
}
