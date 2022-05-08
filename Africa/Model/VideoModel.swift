//
//  VideoModel.swift
//  Africa
//
//  Created by Алмаз Кусаинов on 28.04.2022.
//

import SwiftUI
import MapKit

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed property
    
    var thumbnail: String {
        "video-\(id)"
    }
}
