//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 8/13/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    static let goalFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notification: \(profile.prefersNotifications ? "On" : "Off")")
            
            Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")
            
            Text("Goal Date: \(profile.goalDate, formatter: Self.goalFormatter)")
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
