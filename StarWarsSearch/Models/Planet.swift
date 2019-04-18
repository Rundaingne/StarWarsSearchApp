//
//  Planet.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation

class Planet: Codable {
    
    let name: String
    let diameter: String
    let population: String
    let climate: String
    
    init(name: String, diameter: String, population: String, climate: String) {
        self.name = name
        self.diameter = diameter
        self.population = population
        self.climate = climate
    }
    
    enum PlanetCodingKeys: String, CodingKey {
        case name = "name"
        case diameter = "diameter"
        case population = "population"
        case climate = "climate"
    }
}

struct PlanetTopLevelDict: Codable {
    let results: [Planet]
}
