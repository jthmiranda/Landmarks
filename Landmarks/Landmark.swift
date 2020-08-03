//
//  Landmark.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 8/3/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    enum Category: String, CaseIterable, Hashable, Codable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}


struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
