//
//  WatchMapView.swift
//  WatchLandmarks Extension
//
//  Created by Jonathan Miranda on 8/20/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct WatchMapView: WKInterfaceObjectRepresentable {
    var landmark: Landmark
    
    func makeWKInterfaceObject(context: Context) -> WKInterfaceMap {
        return WKInterfaceMap()
    }
    
    func updateWKInterfaceObject(_ map: WKInterfaceMap, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        let region = MKCoordinateRegion(center: landmark.locationCoordinates, span: span)
        
        map.setRegion(region)
    }
}

struct WatchMapView_Previews: PreviewProvider {
    static var previews: some View {
        WatchMapView(landmark: UserData().landmarks[0])
    }
}
