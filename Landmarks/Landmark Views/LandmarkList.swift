//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 8/3/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
            List {
                Toggle(isOn: $userData.showOnlyFavotiresOnly) {
                    Text("Show Favorites")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showOnlyFavotiresOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .navigationBarTitle("Landmarks")
            }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone 11 Pro Max"], id: \.self) { device in
            NavigationView {
                LandmarkList()
                    .previewDevice(PreviewDevice(rawValue: device))
                    .previewDisplayName(device)
                    .environmentObject(UserData())
            }
        }
    }
}
