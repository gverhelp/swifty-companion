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
                    
                    Text("Project name: \(projectUser.project.name)")
                    
                    Text("Status: \(projectUser.status)")
                    
                    if let finalMark = projectUser.final_mark {
                        Text("Final Mark: \(finalMark)")
                    } else {
                        Text("Final Mark: N/A")
                    }
                }
            }
        }
        .padding(10)
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

struct ProjectsUsersTableView_Previews: PreviewProvider {

    static var previews: some View {
        let projectsUsers: [ProjectsUsers] = ProjectsUsersExample
        
        ProjectsUsersTableView(projectsUsers: projectsUsers)
    }
}
