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
    case person = "People"
    case starship = "Starships"
    case vehicle = "Vehicles"
    case planet = "Planets"
}
