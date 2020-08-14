//
//  UserData.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 8/3/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import Combine

final class UserData: ObservableObject {
    
    @Published var showOnlyFavotiresOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
    
    
}
