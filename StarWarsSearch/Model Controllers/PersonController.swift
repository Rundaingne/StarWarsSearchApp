//
//  PersonController.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation

class PersonController: Codable {
    
    static let shared = PersonController()
    private init() {}
    
    func searchPeople(with searchTerm: String, completion: @escaping ([Person]) -> Void) {
        guard var url = Constants.baseURL else {return}
        url.appendPathComponent("people")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        //Got my components, let's get the query items.
        let personQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [personQueryItem]
        //Gotta make a URL Request for this API.
        guard let requestURL = urlComponents?.url else {completion([]); return}
        let request = URLRequest(url: requestURL)
        
        //Now call the data task.
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            do {
                if let error = error {
                    print("\(error.localizedDescription) \(error) in function: \(#function)")
                    completion([])
                    return
                }
                guard let peopleData = data else {completion([]); return}
                let topLevelDict = try JSONDecoder().decode(PersonTopLevelDict.self, from: peopleData)
                completion(topLevelDict.results)
            } catch {
                completion([])
            }
        }
        .resume()
    }
    
}
