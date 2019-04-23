//
//  Starship.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import UIKit

class Starship: SearchableObject, Codable {
    
    let name: String
    let hyperdriveRating: String
    let starShipClass: String
    let cost: String
    
    init(name: String, hyperdriveRating: String, starShipClass: String, cost: String) {
        self.name = name
        self.hyperdriveRating = hyperdriveRating
        self.starShipClass = starShipClass
        self.cost = cost
    }
    
    enum StarshipCodingKeys: String, CodingKey {
        case name = "name"
        case hyperdriveRating = "hyperdrive_rating"
        case starShipClass = "starship_class"
        case cost = "cost_in_credits"
    }
}

//struct StarShipTopLevelDict: Codable {
//    let results: [Starship]
//}
