//
//  ContentModel.swift
//  DemoApp2
//
//  Created by Varsha Singh on 5/27/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
/**
 Model class - maintain model objects
 */
struct ContentModel {
    let name: String
    let detail: String
    let image: String
    
    /**
     Maintain data objects
     Does:
     1. save name, image and description and model objects
     */
    init(dictionary: ContentJSON) {
        self.name = dictionary[ResponseMappingKeys.name] as! String
        self.image = dictionary[ResponseMappingKeys.image] as! String
        self.detail = dictionary[ResponseMappingKeys.detail] as! String
    }
    
}

