//
//  TokenAPI.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 19/05/2023.
//

import Foundation
import SwiftUI

class APICall: ObservableObject {
    @Published private var token: Token?
    @Published private var user: User?
    @Published public var tokenGenerated: Bool = false
    
    public func generateToken() async throws -> Void {
        
        let urlString = "https://api.intra.42.fr/oauth/token"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        guard let uid = ProcessInfo.processInfo.environment["API42_UID"] else {
            return
        }
        
        guard let secret = ProcessInfo.processInfo.environment["API42_SECRET"] else {
            return
        }
        
        let postBody = "grant_type=client_credentials&client_id=\(uid)&client_secret=\(secret)"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postBody.data(using: .utf8)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let tokenInfos = try JSONDecoder().decode(Token.self, from: data)

        self.token = tokenInfos
        self.tokenGenerated = true
    }
    
    public func getUserCall(login: String) async throws -> Void {

        let urlString = "https://api.intra.42.fr/v2/users/\(login)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["AUthorization":"Bearer \(token!.access_token)"]

        let (data, _) = try await URLSession.shared.data(for: request)
        
        print("===================================================================================================================================================================================================================================================================================================================================================================")
        let userInfos = try JSONDecoder().decode(User.self, from: data)
        print(userInfos)
    }

//    public func fetchData() async {
//        if token == nil {
//            do {
//                try await generateToken()
//                print(token as Any)
//            } catch let error {
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//    }
}
