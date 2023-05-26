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
    
    struct UserImage: Codable {
        var link: String
    }
    
    struct CursusUsers: Codable {
        var grade: String?
        var level: Float
        var skills: [Skills]
        var blackholed_at: String?
    }
    
    struct Skills: Codable {
        var name: String
        var level: Float
    }
    
    struct ProjectsUsers: Codable {
        var final_mark: Int?
        var status: String
        var project: ProjectName
    }
    
    struct ProjectName: Codable {
        var name: String
    }
    
    struct AchievementsUser: Codable {
        var name: String
        var description: String
    }
    
    static var SkillsExample = [Skills(name: "Les cramptés", level: 5)]
    
    static var CursusUsersExample = [CursusUsers(grade: "Member", level: 10.58, skills: SkillsExample, blackholed_at: nil),
                                     CursusUsers(grade: "Member", level: 10.58, skills: SkillsExample, blackholed_at: nil)]
    
    static var UserExample = User(login: "gverhelp", first_name: "Garreth", last_name: "Verhelpen", email: "gverhelp@student.s19.be", image: UserImage(link: "https://cdn.intra.42.fr/users/911f944874d852518d556f302db972f1/gverhelp.JPG"), correction_point: 8, wallet: 259, cursus_users: CursusUsersExample, projects_users: [], achievements: [])
}
