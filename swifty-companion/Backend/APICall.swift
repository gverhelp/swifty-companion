//
//  TokenAPI.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 19/05/2023.
//

import Foundation

enum ThrowException: Error {
    case InvalidURL
    case API42_UIDFailed
    case API42_SECRETFailed
}

class APICall: ObservableObject {
    @Published private var token: Token?
    @Published private var user: User?
    @Published public var tokenGenerated: Bool = false
    @Published public var doUserExist: Bool = true
    
    public func generateToken() async throws -> Token {
        
        let urlString = "https://api.intra.42.fr/oauth/token"
        
        guard let url = URL(string: urlString) else {
            throw ThrowException.InvalidURL
        }

        guard let uid = ProcessInfo.processInfo.environment["API42_UID"] else {
            throw ThrowException.API42_UIDFailed
        }
        
        guard let secret = ProcessInfo.processInfo.environment["API42_SECRET"] else {
            throw ThrowException.API42_SECRETFailed
        }

        let postBody = "grant_type=client_credentials&client_id=\(uid)&client_secret=\(secret)"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postBody.data(using: .utf8)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let tokenInfos = try JSONDecoder().decode(Token.self, from: data)
        
        return tokenInfos
    }

    public func callGetUser(login: String) async throws -> User {
        
        let urlString = "https://api.intra.42.fr/v2/users/\(login)"
        
        guard let url = URL(string: urlString) else {
            throw ThrowException.InvalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Authorization":"Bearer \(token!.access_token)"]
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let userInfos = try JSONDecoder().decode(User.self, from: data)
        
        return userInfos
    }

    public func getUser() -> User {
        return user!
    }

    @MainActor
    public func fetchTokenData() async {
        if token == nil {
            do {
                token = try await generateToken()
                tokenGenerated = true
                print(token as Any)
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    @MainActor
    public func fetchUserData(login: String) async {
        do {
            user = try await callGetUser(login: login)
            doUserExist = true
            print(user as Any)
        } catch let error {
            doUserExist = false
            print("Error: \(error.localizedDescription)")
        }
    }
}
