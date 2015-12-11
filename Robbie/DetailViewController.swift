//
//  DetailViewController.swift
//  Robbie
//
//  Created by Tommy Choe on 12/11/15.
//  Copyright © 2015 Tommy Choe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleToDisplay = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = titleToDisplay
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
