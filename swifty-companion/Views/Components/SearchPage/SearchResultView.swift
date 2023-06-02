//
//  SearchResultView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 31/05/2023.
//

import SwiftUI

struct SearchResultView: View {
    let user: User
    
    var body: some View {
        NavigationLink(destination: ProfileView(user: user)) {
            VStack {
                AsyncImage(url: URL(string: user.image.link)) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 80)
                        .cornerRadius(15)
                } placeholder: {
                    ProgressView()
                }
                
                Text(user.login)
                    .foregroundColor(.black)
                    .font(.headline)
            }
        }
        .padding(10)
        .background(.white)
        .foregroundColor(backgroundColor)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}
