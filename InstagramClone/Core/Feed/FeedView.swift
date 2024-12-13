//
//  FeedView.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 12.12.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack{
                    ForEach(0...10, id: \.self){index in
                        FeedCell()
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Text("InstagramClone")
                }
                ToolbarItem(placement: .topBarTrailing){
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                    
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
