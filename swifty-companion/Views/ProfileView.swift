//
//  ProfileView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 23/05/2023.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    
    @State var projectsButtonSelected: Bool = true
    @State var skillsButtonSelected: Bool = false
    @State var achievementsButtonSelected: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HeaderProfileView(user: user)
                    
                    ButtonSelectionView(projectsButtonSelected: $projectsButtonSelected, skillsButtonSelected: $skillsButtonSelected, achievementsButtonSelected: $achievementsButtonSelected)
                    
                    if projectsButtonSelected {
                        ProjectsView(user: user)
                    }
                    
                    else if skillsButtonSelected {
                        SkillsView(user: user)
                    }
                    
                    else if achievementsButtonSelected {
                        AchievementsView(user: user)
                    }
                }
            }
        }
    }
}
