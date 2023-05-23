//
//  LoadingView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 23/05/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .scaleEffect(3)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
