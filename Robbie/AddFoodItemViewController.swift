//
//  AddFoodItemViewController.swift
//  Robbie
//
//  Created by Tommy Choe on 12/16/15.
//  Copyright © 2015 Tommy Choe. All rights reserved.
//

import UIKit

protocol ModalViewControllerDelegate{
    func modalView(name: String, category: String, description: String)
}

class AddFoodItemViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: FoodDescriptionTextView!
    
    var delegate: ModalViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 232/255, green: 232/255, blue: 238/255, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitItem(sender: AnyObject) {
        print("Adding item...")
        if let name = nameTextField.text,
                category = categoryTextField.text,
                description = descriptionTextView.text{
            
                    self.dismissViewControllerAnimated(true){
                        self.delegate?.modalView(name, category: category, description: description)
                    }
        } else{
            print("You missed something!")
        }
    }

}
