//
//  PlanetController.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation

class PlanetController: Codable {
    
    static let shared = PlanetController()
    private init() {}
    
    func searchPlanets(with searchTerm: String, completion: @escaping ([Planet]) -> Void) {
        //Define the url.
        guard var url = Constants.baseURL else {completion([]); return}
        url.appendPathComponent("planets")
        //now turn it into components and get the query items.
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let planetQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [planetQueryItem]
        //Got the query components, now turn it into a url.
        guard let requestURL = urlComponents?.url else {completion([]); return}
        let request = URLRequest(url: requestURL)
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            do {
                if let error = error {
                    print("\(error.localizedDescription) \(error) in function: \(#function)")
                    completion([])
                    return
                }
                guard let planetData = data else {completion([]); return}
                let topLevelDict = try JSONDecoder().decode(PlanetTopLevelDict.self, from: planetData)
                completion(topLevelDict.results)
            } catch {
                print("There was an error in \(#function): \(error) \(error.localizedDescription)")
            }
        }
        .resume()
    }
}
