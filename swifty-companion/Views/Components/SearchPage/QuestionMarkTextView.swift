//
//  QuestionMarkTextView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 31/05/2023.
//

import SwiftUI

struct QuestionMarkTextView: View {
    var body: some View {
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
}

//struct QuestionMarkTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionMarkTextView()
//    }
//}
