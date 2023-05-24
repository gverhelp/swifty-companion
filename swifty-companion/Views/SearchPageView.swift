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
                ZStack {
                    backgroundColor
                        .edgesIgnoringSafeArea(.all)

                    VStack {

                        SearchBar(selectedLogin: $selectedLogin, onCommit: search)
                            .padding()
                        
                        if showUserDoesntExist {
                            (Text(Image(systemName: "wrongwaysign"))
                                .font(.system(size: 50))
                                .foregroundColor(backgroundColor)
                             
                             + Text("\n\nThis user doesn't exist!\nTry to type another one.")
                            )
                            .padding(25)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .multilineTextAlignment(.center)
                            .padding()
                        }

                        if showQuestionMarkText {
                            (Text(Image(systemName: "questionmark.circle.fill"))
                                .foregroundColor(backgroundColor)
                                .font(.system(size: 50))
                             
                             + Text("\n\nTo look at someone's profile and get all the datas you want to see, just type the login of this person in the search bar!")
                            )
                            .padding(25)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .multilineTextAlignment(.center)
                            .padding()
                        }

                        if showSearchResults {
                            NavigationLink(destination: ProfileView(user: apiCall.getUser())) {
                                VStack {
                                    let user = apiCall.getUser()
                                    Label(selectedLogin.lowercased(), systemImage: "")
                                        .icon(url: URL(string: user.image.link))
                                    
                                    Text(user.login)
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                            }
                            .padding(10)
                            .background(.white)
                            .foregroundColor(backgroundColor)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding()
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

extension View {
    func icon(url: URL?) -> some View {
        if let url = url {
            return AnyView(AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 80)
                    .cornerRadius(15)
            } placeholder: {
                ProgressView()
            })
        } else {
            return AnyView(Image(systemName: "person"))
        }
    }
}


struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
