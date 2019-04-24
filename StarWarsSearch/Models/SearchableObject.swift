//
//  SearchableObject.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

protocol SearchableObject: Codable {
    var name: String { get }
}

import Foundation

enum SearchCategory: String {
    case person = "people"
    case starship = "starships"
    case vehicle = "vehicles"
    case planet = "planets"
    
    var objectType: SearchableObject.Type {
        switch self {
        case .person:
            return Person.self
        case .planet:
            return Planet.self
        case .starship:
            return Starship.self
        case .vehicle:
            return Vehicle.self
            
        }
    }
}
