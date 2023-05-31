//
//  ProjectsView.swift
//  swifty-companion
//
//  Created by Garreth Verhelpen on 25/05/2023.
//

import SwiftUI

struct ProjectsView: View {
    var user: User
    
    var body: some View {
        VStack {
            ProjectsUsersTableView(projectsUsers: user.projects_users)
        }
    }
}

//struct ProjectsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectsView()
//    }
//}
