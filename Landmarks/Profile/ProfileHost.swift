//
//  ProfileHos.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 8/11/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State var drafProfile = Profile.default
    
    var body: some View {
        Text("Profile for: \(drafProfile.username)")
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
