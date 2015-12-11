//
//  RobbieTableTableViewController.swift
//  Robbie
//
//  Created by Tommy Choe on 12/10/15.
//  Copyright © 2015 Tommy Choe. All rights reserved.
//

import UIKit

class RobbieTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var foodList: FoodList?
    var resultSearchController = UISearchController()
    var index: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.foodList = FoodList()
        
        self.tableView.reloadData()
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.resultSearchController.active{
            return self.foodList!.filteredContents.count
        } else{
            return self.foodList!.foodList.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell?
        
        if self.resultSearchController.active{
            let content: Food = self.foodList!.filteredContents[indexPath.row] as Food
            cell!.textLabel?.text = content.name
        }else {
            let content: Food = self.foodList!.foodList[indexPath.row] as Food
            cell!.textLabel?.text = content.name
        }
        return cell!
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.foodList!.filteredContents = self.foodList!.foodList.filter{
            (food) in
            let userSearch = searchController.searchBar.text!.lowercaseString
            if food.category.lowercaseString.containsString(userSearch){
                return true
            }else if food.name.lowercaseString.containsString(userSearch){
                return true
            } else{
                return false
            }
        }
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        self.index = indexPath.row
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailSegue" {
            if let dvc = segue.destinationViewController as? DetailViewController{
                dvc.title = sender!.textLabel!!.text
                // TODO: index does not work when searching for an item.
                dvc.descriptionToDisplay = (self.foodList!.foodList[index!] as Food).description
            }
        }
    }
}



















