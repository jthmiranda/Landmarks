//
//  ProfileHos.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 8/11/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var drafProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.drafProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $drafProfile)
                    .onAppear {
                        self.drafProfile = self.userData.profile
                    }
                    .onDisappear {
                        self.userData.profile = self.drafProfile
                    }
            }
            ProfileSummary(profile: drafProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
