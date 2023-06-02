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
        List {

            ForEach(projectsUsers) { projectUser in
                
                VStack(alignment: .leading) {
                    
                    (Text("Project name: ")
                        .font(.headline)
                     + Text(projectUser.project.name)
                     + Text("\nStatus: ")
                        .font(.headline)
                     + Text(projectUser.status))
                    
                    if let finalMark = projectUser.final_mark {
                        (Text("Final Mark: ")
                            .font(.headline)
                        + Text("\(finalMark)"))
                    } else {
                        (Text("Final Mark: ")
                            .font(.headline)
                         + Text("N/A"))
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
