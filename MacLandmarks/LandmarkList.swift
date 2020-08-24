//
//  LandmarkList.swift
//  MacLandmarks
//
//  Created by Jonathan Miranda on 8/23/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData
    @Binding var selecteLandmark: Landmark?
    @Binding var filter: FilterType
    
    var body: some View {
        List(selection: $selecteLandmark) {
            ForEach(userData.landmarks) { landmark in
                if (!self.userData.showOnlyFavotiresOnly || landmark.isFavorite)
                    && (self.filter == .all
                        || self.filter.category == landmark.category
                        || (self.filter.category == .featured && landmark.isFeatured)) {
                    LandmarkRow(landmark: landmark).tag(landmark)
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList(selecteLandmark: .constant(landmarkData[0]), filter: .constant(.all))
        .environmentObject(UserData())
    }
}
