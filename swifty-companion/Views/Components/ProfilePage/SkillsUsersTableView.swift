//
//  SkillsUsersTableView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 31/05/2023.
//

import SwiftUI

struct SkillsUsersTableView: View {
    var skillsUsers: [Skills]
    
    var body: some View {
        List {
            ForEach(skillsUsers) { skillUser in
                
                VStack(alignment: .leading) {
                    
                    (Text("Skill name: ")
                        .font(.headline)
                     + Text(skillUser.name))

                    ProgressView(value: getLevelBar(userLevel: skillUser.level)) {
                        Text("Level " + String(skillUser.level))
                    }
                    .tint(backgroundColor)
                }
            }
        }
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.horizontal)
    }
    
    private func getLevelBar(userLevel: Float) -> Float {
        return userLevel - Float(Int(userLevel))
    }
}
