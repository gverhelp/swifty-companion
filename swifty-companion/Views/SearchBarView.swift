//
//  SearchBarView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 20/05/2023.
//

import SwiftUI

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
