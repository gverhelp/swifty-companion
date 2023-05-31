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
                    
                    Text("Achievement name: \(achievementUser.name)")
                    
                    Text("Description: \(String(achievementUser.description))")
                }
            }
        }
        .padding(10)
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

struct AchievementsUsersTableView_Previews: PreviewProvider {
    static var previews: some View {
        let achievementsUsers = AchievementsUserExample
        
        AchievementsUsersTableView(achievementsUsers: achievementsUsers)
    }
}
