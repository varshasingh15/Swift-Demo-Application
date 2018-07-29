//
//  DataStore.swift
//  DemoApp2
//
//  Created by Varsha Singh on 5/25/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import UIKit
/**
 Model class - entering point to hit the API
 */
class DataStore {
    
    static let sharedInstance = DataStore() // DataStore : shared instance with that there can be only 1 instance of DataStore Model
    fileprivate init() {}
    
    var contentArray: [ContentModel] = [] // contentArray : to store all data
    var images: [UIImage] = [] // imageArray : download all images and use array all over the app
    
    /**
     Fetch data from API
     Does:
     1. hit API to get all content
     2. get data into JSON format
     3. add actual data to array
     4. completion handler to maintain block for data fetching
     */
    func getContentInfo(completion: @escaping () -> Void) {
        
        APIClient.getContentAPI { (json) in
            if let results = json?[ResponseMappingKeys.result] as? [ContentJSON] {
                for dict in results {
                    let contentDict = ContentModel(dictionary: dict)
                    self.contentArray.append(contentDict)
                }
                completion()
            }
        }
    }
    
    /**
     Fetch image from contentArray
     Does:
     1. convert image data into required image format and store it to array
     2. operationQueue to manage and handle completion of image retrieval
     */
    func getContentImages(completion: @escaping () -> Void) {
        getContentInfo {
            for imageArray in self.contentArray {
                let url = URL(string: imageArray.image)
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    self.images.append(image!)
                }
            }
            OperationQueue.main.addOperation {
                completion()
            }
        }
    }
}
