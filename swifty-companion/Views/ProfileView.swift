//
//  ProfileView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 23/05/2023.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    
    @State var projectsButtonSelected: Bool = false
    @State var skillsButtonSelected: Bool = false
    @State var achievementsButtonSelected: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    HStack {
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
                        
                        VStack(spacing: 20) {
                            Text(user.first_name + " " + user.last_name + "\n(" + user.login + ")")
                                .padding()
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .background(.white)
                                .cornerRadius(10)
                                .shadow(radius: 10)

                            Gauge(value: CGFloat(user.cursus_users[1].level), in: 1...100) {
                                Text("Level \(String(format: "%.2f", user.cursus_users[1].level))")
                            }
                            .padding()
                            .font(.headline)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)

                        }
                        .padding()
                    }
                    .padding()
                    
                    ButtonSelectionView(projectsButtonSelected: $projectsButtonSelected, skillsButtonSelected: $skillsButtonSelected, achievementsButtonSelected: $achievementsButtonSelected)
                    
                    if projectsButtonSelected {
                        ProjectsView()
                    }
                    
                    else if skillsButtonSelected {
                        SkillsView()
                    }
                    
                    else if achievementsButtonSelected {
                        AchievementsView()
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        let user: User = User.UserExample
//
//        ProfileView(user: user)
//    }
//}
