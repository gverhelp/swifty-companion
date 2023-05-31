//
//  HeaderProfileView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 27/05/2023.
//

import SwiftUI

struct HeaderProfileView: View {
    var user: User
    
    var body: some View {
        
        HStack {
            VStack {
                AsyncImage(url: URL(string: user.image.link)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 125, height: 125)
                .clipShape(Circle())
                .shadow(radius: 10)
                        
                //Divider()
                
                Text(user.first_name + " " + user.last_name + "\n(" + user.login + ")")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            
            VStack {
                Text(user.email
                     + "\nCorrection points: \(user.correction_point)"
                     + "\nWallet:\(user.wallet)")
                    //.scaledToFill()
                    .font(.headline)
                    .multilineTextAlignment(.center)

                if let grade = user.cursus_users[1].grade {
                    Text("\(grade)")
                        .font(.headline)
                } else {
                    Text("N/A")
                        .font(.headline)
                }
                
                Divider()
                
                if let userLevel = user.cursus_users.indices.contains(1) ? user.cursus_users[1].level : user.cursus_users.first?.level {
                    
                    Gauge(value: CGFloat(userLevel), in: 1...100) {
                        Text("Level \(String(userLevel))")
                    }
                    .font(.headline)
                }
            }
        }
        .padding()
        .background()
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

struct HeaderProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let user: User = UserExample
        
        HeaderProfileView(user: user)
    }
}
