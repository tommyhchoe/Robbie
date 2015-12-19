//
//  DetailViewController.swift
//  Robbie
//
//  Created by Tommy Choe on 12/11/15.
//  Copyright © 2015 Tommy Choe. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate{
    func detailView()
}

class DetailViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var descriptionToDisplay = ""
    
    var delegate: DetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionLabel.text = descriptionToDisplay
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.delegate?.detailView()
    }
}
