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
        
        HStack(spacing: 10) {
            Button("Projects") {
                projectsButtonSelected = true
                skillsButtonSelected = false
                achievementsButtonSelected = false
            }
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .font(.system(size: 15))
            .background(.white)
            .foregroundColor(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            
            Button("Skills") {
                projectsButtonSelected = false
                skillsButtonSelected = true
                achievementsButtonSelected = false
            }
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .font(.system(size: 15))
            .background(.white)
            .foregroundColor(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            
            Button("Achievements") {
                projectsButtonSelected = false
                skillsButtonSelected = false
                achievementsButtonSelected = true
            }
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .font(.system(size: 15))
            .background(.white)
            .foregroundColor(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
        .padding(.horizontal)

    }
}

//struct ButtonSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonSelectionView()
//    }
//}
