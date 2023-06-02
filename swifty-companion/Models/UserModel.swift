//
//  User.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 22/05/2023.
//

import Foundation

struct User: Codable {
    var login: String
    var first_name: String
    var last_name: String
    var email: String
    var image: UserImage
    var correction_point: Int
    var wallet: Int
    var cursus_users: [CursusUsers]
    var projects_users: [ProjectsUsers]
    var achievements: [AchievementsUser]
}
    
struct UserImage: Codable {
    var link: String
}

struct CursusUsers: Codable {
    var grade: String?
    var level: Float
    var skills: [Skills]
    var blackholed_at: String?
}

struct Skills: Codable, Identifiable {
    var id: Int
    var name: String
    var level: Float
}

struct ProjectsUsers: Codable, Identifiable {
    var id: Int
    var final_mark: Int?
    var status: String
    var project: ProjectName
}

struct ProjectName: Codable {
    var name: String
}

struct AchievementsUser: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
}

//var AchievementsUserExample = [AchievementsUser(id: 1, name: "You're a doggo", description: "Bark bark"),
//                               AchievementsUser(id: 2, name: "You're a cat", description: "Miouw miouw")]
//
//var ProjectNameExample = ProjectName(name: "ft_containers")
//
//var ProjectsUsersExample = [ProjectsUsers(id: 1, final_mark: 100, status: "Finished", project: ProjectNameExample),
//                            ProjectsUsers(id: 2, final_mark: 0, status: "In progress", project: ProjectNameExample)]
//    
//var SkillsExample = [Skills(id: 1, name: "Les cramptés", level: 5.4),
//                     Skills(id: 2, name: "apagnan", level: 8.9)]
//
//var CursusUsersExample = [CursusUsers(grade: "Member", level: 10.58, skills: SkillsExample, blackholed_at: nil),
//                                 CursusUsers(grade: "Member", level: 10.58, skills: SkillsExample, blackholed_at: nil)]
//
//var UserExample = User(login: "gverhelp", first_name: "Garreth", last_name: "Verhelpen", email: "gverhelp@student.s19.be", image: UserImage(link: "https://cdn.intra.42.fr/users/911f944874d852518d556f302db972f1/gverhelp.JPG"), correction_point: 8, wallet: 259, cursus_users: CursusUsersExample, projects_users: ProjectsUsersExample, achievements: AchievementsUserExample)
