//
//  Vehicle.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import UIKit

class Vehicle: SearchableObject, Codable {
    
    let name: String
    let model: String?
    let vehicleClass: String?
    
    init(name: String, model: String, vehicleClass: String) {
        self.name = name
        self.model = model
        self.vehicleClass = vehicleClass
    }
    
    enum VehicleCodingKeys: String, CodingKey {
        case name = "name"
        case model = "model"
        case vehicleClass = "vehicle_class"
    }
}

//struct VehicleTopLevelDict: Codable {
//    let results: [Vehicle]
//}
