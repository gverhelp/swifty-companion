//
//  HomePageView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 11/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showSearchPageView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Swifty-Companion")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding()
                    Text("Want to stalk someone of the 42 network?\nHere's your app!")
                        .bold()
                        .multilineTextAlignment(.center)


                    Button(action: {
                        showSearchPageView = true
                    }) {
                        Label("Start", systemImage: "arrowtriangle.right.circle.fill")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .font(.title3)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 3)
                            )
                    }
                    .padding()

                    NavigationLink(destination: SearchPageView(), isActive: $showSearchPageView) {
                        EmptyView()
                    }

                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 10)
            }
            .navigationTitle("Home")
            .toolbar(.hidden, for:.navigationBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
