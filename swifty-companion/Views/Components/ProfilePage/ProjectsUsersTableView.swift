//
//  ProjectsUsersTableView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 31/05/2023.
//

import SwiftUI

struct ProjectsUsersTableView: View {
    var projectsUsers: [ProjectsUsers]
    
    var body: some View {
        
        VStack {
            
            List {
                ForEach(projectsUsers) { projectUser in
                    VStack(alignment: .leading) {
                        Text(projectUser.project.name)
                            .font(.headline)
                        
                        if let finalMark = projectUser.final_mark {
                            Text(String(finalMark))
                        } else {
                            Text("N/A")
                        }
                    }
                }
            }
            //.scrollContentBackground(.hidden)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.horizontal)
        }
    }
}
