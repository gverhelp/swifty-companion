//
//  HeaderProfileView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 27/05/2023.
//

import SwiftUI

struct HeaderProfileView: View {
    var user: User
    
    let gradient = Gradient(colors: [.green, .yellow, .red])
    
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
                
                Text(user.first_name + " " + user.last_name + "\n(" + user.login + ")")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            
            VStack {
                (Text("\(user.email)")
                 + Text("\nCorrection points: ")
                    .font(.headline)
                 + Text("\(user.correction_point)")
                 + Text("\nWallet: ")
                    .font(.headline)
                 + Text("\(user.wallet)"))
                    .multilineTextAlignment(.center)

                if let grade = user.cursus_users.indices.contains(1) ? user.cursus_users[1].grade : user.cursus_users.first?.grade {
                    
                    (Text("Grade: ")
                        .font(.headline)
                     + Text("\(grade)"))
                } else {
                    (Text("Grade: ")
                        .font(.headline)
                     + Text("N/A"))
                }
                
                Divider()
                
                if let userLevel = user.cursus_users.indices.contains(1) ? user.cursus_users[1].level : user.cursus_users.first?.level {
                
                    let percentage = getLevelBar(userLevel: userLevel)
                    
                    Gauge(value: percentage, in: 0...1) {
                        Text("Level \(Int(userLevel)) - \(String(Int(percentage * 100)))%")
                            .font(.headline)
                    }
                    .tint(gradient)
                }
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(.horizontal)
    }
    
    private func getLevelBar(userLevel: Float) -> Float {
        return userLevel - Float(Int(userLevel))
    }
}
