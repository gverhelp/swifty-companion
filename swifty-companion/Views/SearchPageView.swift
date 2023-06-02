//
//  SearchPageView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 16/05/2023.
//

import SwiftUI

struct SearchPageView: View {
    
    @State private var showLoadingView: Bool = true
    @State private var showSearchResults = false
    @State private var showQuestionMarkText = true
    @State private var showUserDoesntExist = false
    
    @State private var selectedLogin = ""
    
//    @State private var searchResults: [String] = []
    
    @StateObject private var apiCall = APICall()
    
    var body : some View {

            if (!showLoadingView) {
                ZStack() {
                    backgroundColor
                        .edgesIgnoringSafeArea(.all)

                    VStack() {

                        SearchBar(selectedLogin: $selectedLogin, onCommit: search)
                        
                        if showUserDoesntExist {
                            UserDoesntExistView()
                        }

                        if showQuestionMarkText {
                            QuestionMarkTextView()
                        }

                        if showSearchResults {
                            let user = apiCall.getUser()
                            
                            SearchResultView(user: user)
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Research")
                    .onDisappear {
                        selectedLogin = ""
                        showSearchResults = false
                        showQuestionMarkText = true
                    }
                }
            } else {
                LoadingView()
                    .onAppear {
                        Task {
                            await apiCall.fetchTokenData()
                            if apiCall.tokenGenerated {
                                showLoadingView = false
                            }
                        }
                    }
            }
    }

    private func search() {
        Task {
            await apiCall.fetchUserData(login: selectedLogin.lowercased())

            if apiCall.doUserExist {
                showSearchResults = true
                showQuestionMarkText = false
                showUserDoesntExist = false
            } else {
                showSearchResults = false
                showQuestionMarkText = false
                showUserDoesntExist = true
            }
            
        }
    }
}
