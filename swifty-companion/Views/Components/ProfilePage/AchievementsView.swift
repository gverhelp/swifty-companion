//
//  AchievementsView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 25/05/2023.
//

import SwiftUI

struct AchievementsView: View {
    let user: User
    
    var body: some View {
        AchievementsUsersTableView(achievementsUsers: user.achievements)
    }
}

//struct AchievementsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AchievementsView()
//    }
//}
