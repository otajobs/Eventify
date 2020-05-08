//  Created by Отажон on 3/6/20.
//  Copyright © 2020 Otajon Ruzimov. All rights reserved.

import SwiftUI
import CoreLocation

struct Event: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var description: String
    var timeEvent: String
    var organizer: String
    var dateEvent: String
    var venueEvent: String
    var priceEvent: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
//        case featured = "Featured"
        case lectures = "Lectures"
        case conferences = "Conferences"
        case revisions = "Revisions"
        case fun = "Fun"
        
    }
}

extension Event {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
