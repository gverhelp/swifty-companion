//
//  AchievementsUsersTableView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 31/05/2023.
//

import SwiftUI

struct AchievementsUsersTableView: View {
    let achievementsUsers: [AchievementsUser]
    
    var body: some View {
        List {
            ForEach(achievementsUsers) { achievementUser in
                
                VStack(alignment: .leading) {
                    
                    (Text("Achievement name: ")
                        .font(.headline)
                     + Text(achievementUser.name)
                     + Text("\nDescription: ")
                        .font(.headline)
                     + Text(String(achievementUser.description)))
                }
            }
        }
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.horizontal)
    }
}
