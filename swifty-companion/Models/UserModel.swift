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
