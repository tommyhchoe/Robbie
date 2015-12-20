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

    @IBAction func submitItem(sender: AnyObject) {
        if let name = nameTextField.text,
                category = categoryTextField.text,
                description = descriptionTextView.text{
                    
            //TODO: Add another button action in successAlert to add more food items before dismissing the ViewController.
            let errorAlert: UIAlertController = UIAlertController(title: "Error!", message: "You missed a field", preferredStyle: .Alert)
            let successAlert: UIAlertController = UIAlertController(title: "Nice!", message: "You've added \(name) to the list", preferredStyle: .Alert)
            let defaultErrorAction: UIAlertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            let defaultSuccessAction: UIAlertAction = UIAlertAction(title: "Done", style: .Default)
                {[unowned self] action in self.dismissViewControllerAnimated(true){
                    self.delegate?.modalView(name, category: category, description: description)
                }}
            let addMoreSuccessAction: UIAlertAction = UIAlertAction(title: "Add More", style: .Cancel)
                {[unowned self] action in
                    self.delegate?.modalView(name, category: category, description: description)
                    self.nameTextField.text = ""
                    self.categoryTextField.text = ""
                    self.descriptionTextView.text = ""
                }
            errorAlert.addAction(defaultErrorAction)
            successAlert.addAction(defaultSuccessAction)
            successAlert.addAction(addMoreSuccessAction)
            
            if name != "" && category != "" && description != ""{
                self.presentViewController(successAlert, animated: false, completion: nil)
            }else{
                self.presentViewController(errorAlert, animated: false, completion: nil)
            }
        }
    }
}
