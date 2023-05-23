//
//  HomePageView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 11/05/2023.
//

import SwiftUI

let backgroundColor = Color.green

struct HomePageView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                    
                VStack {
                    Text("Swifty-Companion")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding(10)
                    
                    Divider()
                    
                    Text("Want to stalk someone of the 42 network?\nHere's your app!")
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(10)
                    NavigationLink(destination: SearchPageView()) {
                        Label("Start", systemImage: "arrowtriangle.right.circle.fill")
                            .fontWeight(.bold)
                            .foregroundColor(backgroundColor)
                            .font(.title3)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(backgroundColor, lineWidth: 3)
                            )
                            .padding(10)
                    }
                }
                .padding(10)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding()
            }
            .navigationTitle("Home")
            .toolbar(.hidden, for:.navigationBar)
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
