//
//  Token.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 20/05/2023.
//

import Foundation

struct Token: Codable {
    var access_token: String
    var token_type: String
    var expires_in: Double
    var scope: String
    var created_at: Double
}
