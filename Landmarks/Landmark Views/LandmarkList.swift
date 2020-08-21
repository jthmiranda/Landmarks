//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 8/3/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct LandmarkList<DetailView: View>: View {
    @EnvironmentObject var userData: UserData
    
    let detailViewProducer: (Landmark) -> DetailView
    
    var body: some View {
        
            List {
                Toggle(isOn: $userData.showOnlyFavotiresOnly) {
                    Text("Show Favorites")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showOnlyFavotiresOnly || landmark.isFavorite {
                        NavigationLink(destination: self.detailViewProducer(landmark).environmentObject(self.userData)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .navigationBarTitle("Landmarks")
            }
        
    }
}

#if os(watchOS)
typealias PreviewDetailView = WatchLandmarkDetail
#else
typealias PreviewDetailView = LandmarkDetail
#endif


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList { PreviewDetailView(landmark: $0) }
            .environmentObject(UserData())
        
        
//        ForEach(["iPhone SE", "iPhone 11 Pro Max"], id: \.self) { device in
//            NavigationView {
//                LandmarkList { PreviewDetailView(landmark: $0) }
//                    .previewDevice(PreviewDevice(rawValue: device))
//                    .previewDisplayName(device)
//                    .environmentObject(UserData())
//            }
//        }
        
    }
}
