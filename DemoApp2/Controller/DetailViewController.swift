//
//  DetailViewController.swift
//  DemoApp2
//
//  Created by Varsha Singh on 5/26/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
/**
 UIViewController used for displaying detailed information of book.
 */
class DetailViewController: UIViewController {
    
    @IBOutlet var bookImage: UIImageView! //bookImage IBOutlet : used for adding it through storyboard
    @IBOutlet var bookName: UILabel! //bookName IBOutlet : used for adding it through storyboard
    @IBOutlet var bookDescription: UILabel! //bookDescription IBOutlet : used for adding it through storyboard
    
    var selectedImage: UIImage? = nil //selectedImage : used to fetch selected book image from listing page
    var selectedName: String? = "" //selectedName : used to fetch selected book name from listing page
    var selectedInfo: String? = "" //selectedInfo : used to fetch selected book description from listing page
    
    // MARK: View Controller Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        setUpDetailInfo()
    }
    
    /**
     Method used to setup initial info for detail page
     Does:
     1. fetch image, name, info from listing page
     2. display all available data on UI
     */
    func setUpDetailInfo()  {
        if let image = selectedImage, let name = selectedName, let info = selectedInfo {
            bookImage.image = image
            bookName.text = name
            bookDescription.text = info
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
