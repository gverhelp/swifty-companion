//
//  ProfileView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 23/05/2023.
//

import SwiftUI

struct ProfileView: View {
    var user: User

    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    AsyncImage(url: URL(string: user.image.link)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                    
                    Text(user.first_name + " " + user.last_name + "\n(" + user.login + ")")
                        .padding()
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .background(.white)
                        .shadow(radius: 10)
                    
                    Spacer()
                }
            }
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
