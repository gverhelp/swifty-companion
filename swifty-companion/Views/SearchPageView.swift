//
//  SearchPageView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 16/05/2023.
//

import Foundation
import SwiftUI

struct SearchPageView: View {
    @State private var searchText = ""
    @State private var showSearchResults = false
    @State private var showText = true
    @State private var searchResults: [String] = []
    
    var body : some View {
        NavigationView {
            ZStack {
                
                Color.green
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    SearchBar(text: $searchText, onCommit: search)
                        .padding()
                    
                    if showText {
                        (Text(Image(systemName: "questionmark.circle.fill"))
                            .foregroundColor(Color.green)
                            .font(.system(size: 50))
                         
                         + Text("\n\nTo look at someone profile and get all the datas you want to see, just type the login of this person in the search bar!"))
                        .padding()
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
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Research")
                    .accessibilityAddTraits(.isHeader)
            }
        }
    }
    private func search() {
        searchResults = (1...10).map { "Result \($0)" }
        showSearchResults = true
        showText = false
    }
}

struct SearchBar: View {
    @Binding var text: String
    var onCommit: () -> Void
    
    var body: some View {
        HStack {
            TextField("Enter a login", text: $text)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: onCommit) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.green)
            }
        }
        .padding(10)
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}
