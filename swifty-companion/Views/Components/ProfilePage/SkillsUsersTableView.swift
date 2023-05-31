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
                    
                    Text("Skill name: \(skillUser.name)")
                    
                    Text("Level: \(String(skillUser.level))")
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


struct SkillsUsersTableView_Previews: PreviewProvider {
    static var previews: some View {
        let skillsUsers: [Skills] = SkillsExample
        SkillsUsersTableView(skillsUsers: skillsUsers)
    }
}
