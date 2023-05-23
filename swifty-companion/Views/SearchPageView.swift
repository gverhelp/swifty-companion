//
//  SearchPageView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 16/05/2023.
//

import SwiftUI

struct SearchPageView: View {
    
    @State private var searchText = ""
    @State private var showSearchResults = false
    @State private var showText = true
    @State private var searchResults: [String] = []
    
    @StateObject private var apiCall = APICall()
    
    var body : some View {
        NavigationView {
            if (apiCall.tokenGenerated) {
                ZStack {
                    backgroundColor
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        SearchBar(text: $searchText, onCommit: search)
                            .padding()
                        
                        if showText {
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
                            List(searchResults, id: \.self) { result in
                                Text(result)
                            }
                        }
                    }
                }
            } else {
                LoadingView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Research")
                    .accessibilityAddTraits(.isHeader)
            }
        }
        .onAppear {
            Task {
                do {
                    try await apiCall.generateToken()
                    try await apiCall.getUserCall(login: "gverhelp")
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }

    private func search() {
        searchResults = (1...10).map { "Result \($0)" }
        showSearchResults = true
        showText = false
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
