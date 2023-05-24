//
//  LoadingView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 24/05/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .scaleEffect(2)
        }
    }
}
