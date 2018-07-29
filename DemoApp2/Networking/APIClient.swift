//
//  APIClient.swift
//  DemoApp2
//
//  Created by Varsha Singh on 5/25/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
/**
 Network layer - to trigger the actual API
 */
typealias ContentJSON = [String: Any]

struct APIClient {
    
    /**
     Trigger API
     Does:
     1. URL by using myjson to create the dynamic JSON
     2. session to maintain task
     3. maintain data, response and error
     4. JSONSerialization to get JSON object
     */
    
    static func getContentAPI(completion: @escaping (ContentJSON?) -> Void) {
        
        let url = URL(string: kAPI_URL)
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error while unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedData = data else { print("Error while unwrapping data"); return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? ContentJSON
                completion(responseJSON)
            } catch {
                print("Could not get API response. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
