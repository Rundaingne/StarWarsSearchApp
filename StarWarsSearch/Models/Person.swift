//
//  Person.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import UIKit

class Person: SearchableObject, Codable {
    
    //Instance Properties
    let name: String
    let height: String
    let mass: String
    let birthYear: String
    
    init(name: String, height: String, mass: String, birthYear: String) {
        self.name = name
        self.height = height
        self.mass = mass
        self.birthYear = birthYear
    }
    
    enum PersonCodingKeys: String, CodingKey {
        case name = "name"
        case height = "height"
        case mass = "mass"
        case birthYear = "birth_year"
    }
}

struct TopLevelDict<T: SearchableObject>: Codable {
    let results: [T]
}
