//
//  SearchableObjectController.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation

class SearchableObjectController {
    static let shared = SearchableObjectController()
    private init() {}
    
    func searchObject<T: SearchableObject>(with searchCategory: SearchCategory, returnType: T.Type, searchTerm: String, completion: @escaping ([SearchableObject]?) -> Void) {
        guard var url = Constants.baseURL else {completion(nil); return}
        url.appendPathComponent(searchCategory.rawValue)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let personQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [personQueryItem]
        guard let requestURL = urlComponents?.url else {completion(nil); return}
        let request = URLRequest(url: requestURL)
        print(request.url?.absoluteString ?? "NOPE")
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            do {
                if let error = error {
                    print("\(error.localizedDescription) \(error) in function: \(#function)")
                    completion(nil)
                    return
                }
                guard let data = data else {completion(nil); return}
                let topLevelDictionary = try JSONDecoder().decode(TopLevelDict<T>.self, from: data)
                completion(topLevelDictionary.results)
            } catch {
                print("There was an error in \(#function): \(error) \(error.localizedDescription)")
            }
        }
            .resume()
    }
}
