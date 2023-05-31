//
//  SkillsView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 25/05/2023.
//

import SwiftUI

struct SkillsView: View {
    let user: User
    
    var body: some View {
        SkillsUsersTableView(skillsUsers: user.cursus_users[1].skills)
    }
}

//struct SkillsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkillsView()
//    }
//}
