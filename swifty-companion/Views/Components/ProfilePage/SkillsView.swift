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
        if let skills = user.cursus_users.indices.contains(1) ? user.cursus_users[1].skills : user.cursus_users.first?.skills {
            SkillsUsersTableView(skillsUsers: skills)
        }
    }
}
