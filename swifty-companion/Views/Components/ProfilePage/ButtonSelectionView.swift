//
//  ButtonSelectionView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 25/05/2023.
//

import SwiftUI

struct ButtonSelectionView: View {
    
    @Binding var projectsButtonSelected: Bool
    @Binding var skillsButtonSelected: Bool
    @Binding var achievementsButtonSelected: Bool
    
    var body: some View {
        
        HStack {
            Button{
                projectsButtonSelected = true
                skillsButtonSelected = false
                achievementsButtonSelected = false
            } label: {
                Image(systemName: "tray.full.fill")
                    .foregroundColor(backgroundColor)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .frame(maxWidth: .infinity)
            .tint(.white)
            .shadow(radius: 10)
            
            Button {
                projectsButtonSelected = false
                skillsButtonSelected = true
                achievementsButtonSelected = false
            } label: {
                Image(systemName: "brain")
                    .foregroundColor(backgroundColor)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .frame(maxWidth: .infinity)
            .tint(.white)
            .shadow(radius: 10)
            
            Button {
                projectsButtonSelected = false
                skillsButtonSelected = false
                achievementsButtonSelected = true
            } label: {
                Image(systemName: "trophy")
                    .foregroundColor(backgroundColor)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .frame(maxWidth: .infinity)
            .tint(.white)
            .shadow(radius: 10)
        }
        .padding(.horizontal)
    }
}
