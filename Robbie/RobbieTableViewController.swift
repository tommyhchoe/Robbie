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
        
        //setup ResultSearchController
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        self.resultSearchController.searchBar.placeholder = "Search for Food"
        let defaultColor = UIColor.init(red: 255/255, green: 153/255, blue: 51/255, alpha: 1)
        self.resultSearchController.searchBar.barTintColor = UIColor.lightGrayColor()
        let whiteColor = UIColor.whiteColor()
        self.resultSearchController.searchBar.tintColor = whiteColor
        
        //setup UINavigationController
        self.navigationController!.navigationBar.barTintColor = defaultColor
        self.navigationController!.navigationBar.tintColor = whiteColor
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: whiteColor]
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("addNewFoodItem"))
        self.navigationItem.rightBarButtonItem = rightBarButton
        //TODO: Set the rightBarButtonItem title
        
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
        
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if self.resultSearchController.active{
            let content: Food = self.foodList!.filteredContents[indexPath.row] as Food
            cell!.textLabel?.text = content.name
            cell!.detailTextLabel?.text = content.description
        }else {
            let content: Food = self.foodList!.foodList[indexPath.row] as Food
            cell!.textLabel?.text = content.name
        }
        return cell!
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        self.index = indexPath.row
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.resultSearchController.active = false
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            foodList!.foodList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    // MARK: - SearchResultsControllers
    
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
    
    //MARK: - Action methods
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailSegue" {
            if let dvc = segue.destinationViewController as? DetailViewController{
                dvc.title = sender!.textLabel!!.text
                if self.resultSearchController.active{
                    dvc.descriptionToDisplay = (self.foodList!.filteredContents[index!] as Food).description
                } else{
                    dvc.descriptionToDisplay = (self.foodList!.foodList[index!] as Food).description
                }
            }
        }
    }
    
    func addNewFoodItem(){
        print("Adding new food item")
        let food = Food(category: "something", name: "new", description: "blah blah")
        foodList!.foodList.append(food)
        self.tableView.reloadData()
    }
}



















