//
//  UserDoesntExistView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 31/05/2023.
//

import SwiftUI

struct UserDoesntExistView: View {
    
    var body: some View {
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
}
