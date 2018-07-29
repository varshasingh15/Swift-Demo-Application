//
//  CollectionViewCell.swift
//  DemoApp2
//
//  Created by Varsha Singh on 5/25/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
/*
 CollectionViewCell used to create information of book
 */
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var bookImage: UIImageView! //bookImage IBOutlet : used for adding it through storyboard
    @IBOutlet var bookName: UILabel! //bookName IBOutlet : used for adding it through storyboard
    
    /**
     Initialization method for CollectionViewCell
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /**
     Used to display information
     - parameters:
         - image: available book image
         - title: available book name
     */
    func displayContent(image: UIImage?, name: String?) {
        if let selectedImage = image {
            bookImage.image = selectedImage
        }
        bookName.text = name ?? ""
    }
    
}
