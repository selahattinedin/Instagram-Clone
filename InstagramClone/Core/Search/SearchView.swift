//
//  SearchView.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 13.12.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack{
                    ForEach(0...20, id:\.self){ user in
                        HStack {
                            Image("Ben")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40,height: 40)
                                .clipShape(Circle())
                            VStack(alignment: .leading){
                                Text("Selahattin Edin")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("buttonTextColor"))
                                Text("Selahattin edin")
                                    .foregroundStyle(Color("buttonTextColor"))

                            }
                            .font(.footnote)
                            Spacer()
                            
                        }
                        .padding(.horizontal)
                    }
                }
                .searchable(text: $searchText, prompt: "Search...")

            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
