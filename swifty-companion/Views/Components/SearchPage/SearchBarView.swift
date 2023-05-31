//
//  SearchBarView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 24/05/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var selectedLogin: String
    var onCommit: () -> Void

    var body: some View {
        HStack {
            TextField("Enter a login", text: $selectedLogin)

            Button(action: onCommit) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(backgroundColor)
            }
        }
        .padding(10)
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}
