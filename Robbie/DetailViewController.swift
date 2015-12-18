//
//  DetailViewController.swift
//  Robbie
//
//  Created by Tommy Choe on 12/11/15.
//  Copyright © 2015 Tommy Choe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var descriptionToDisplay = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.descriptionLabel.text = descriptionToDisplay
        
        // Do any additional setup after loading the view.
    }
}
