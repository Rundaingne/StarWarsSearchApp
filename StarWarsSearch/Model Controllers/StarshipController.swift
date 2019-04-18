//
//  StarshipController.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation

class StarshipController: Codable {
    
    static let shared = StarshipController()
    private init() {}
    
    func searchStarships(with searchTerm: String, completion: @escaping ([Starship]) -> Void) {
        guard var url = Constants.baseURL else {completion([]); return}
        url.appendPathComponent("starships")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let starshipQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [starshipQueryItem]
        //Got the query items, now we need to make a request.
        guard let requestURL = urlComponents?.url else {completion([]); return}
        let request = URLRequest(url: requestURL)
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            do {
                if let error = error {
                    print("\(error.localizedDescription) \(error) in function: \(#function)")
                    completion([])
                    return
                }
                guard let peopleData = data else {completion([]); return}
                let topLevelDict = try JSONDecoder().decode(StarShipTopLevelDict.self, from: peopleData)
                let people = topLevelDict.results
                completion(people)
            } catch {
                print("There was an error in \(#function): \(error) \(error.localizedDescription)")
            }
        }
        .resume()
    }
}
