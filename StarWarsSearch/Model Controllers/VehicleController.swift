//
//  VehicleController.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation

class VehicleController: Codable {
    
    static let shared = VehicleController()
    private init() {}
    
    func searchVehicles(with searchTerm: String, completion: @escaping ([Vehicle]) -> Void) {
        guard var url = Constants.baseURL else {completion([]); return}
        url.appendPathComponent("vehicles")
        //Need to turn this into components.
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        //Now query items.
        let vehicleQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [vehicleQueryItem]
        //Make a url from my components now.
        guard let requestURL = urlComponents?.url else {completion([]); return}
        let request = URLRequest(url: requestURL)
      
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            do {
                if let error = error {
                    print("\(error.localizedDescription) \(error) in function: \(#function)")
                    completion([])
                    return
                }
                guard let vehicleData = data else {completion([]); return}
                let topLevelDict = try JSONDecoder().decode(VehicleTopLevelDict.self, from: vehicleData)
                completion(topLevelDict.results)
            } catch {
                print("There was an error in \(#function): \(error) \(error.localizedDescription)")
            }
        }
        .resume()
    }
}
