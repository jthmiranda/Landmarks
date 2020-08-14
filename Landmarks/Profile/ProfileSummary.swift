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
            
            VStack(alignment: .leading) {
                Text("Complete Badges")
                    .font(.headline)
                
                ScrollView {
                    HStack {
                        HikeBadge(name: "First Hike")
                        
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.50)
                            .hueRotation(Angle(degrees: 45))
                    }
                    
                }
                .frame(height: 140)
            }
            
            VStack(alignment: .leading) {
                Text("Recents Hike")
                    .font(.headline)
                
                HikeView(hike: hikeData[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
