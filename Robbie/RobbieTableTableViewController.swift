//
//  RobbieTableTableViewController.swift
//  Robbie
//
//  Created by Tommy Choe on 12/10/15.
//  Copyright © 2015 Tommy Choe. All rights reserved.
//

import UIKit

class RobbieTableTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var foodList = [Food]()
    var filteredContents = [Food]()
    var resultSearchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        
        self.tableView.reloadData()

        self.foodList = [Food(category:"Chocolate", name:"chocolate Bar"),
                    Food(category:"Chocolate", name:"chocolate Chip"),
                    Food(category:"Chocolate", name:"dark chocolate"),
                    Food(category:"Hard", name:"lollipop"),
                    Food(category:"Hard", name:"candy cane"),
                    Food(category:"Hard", name:"jaw breaker"),
                    Food(category:"Other", name:"caramel"),
                    Food(category:"Other", name:"sour chew"),
                    Food(category:"Other", name:"gummi bear")]
        
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
            return self.filteredContents.count
        } else{
            return self.foodList.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell?
        
        if self.resultSearchController.active{
            let content: Food = self.filteredContents[indexPath.row] as Food
            cell!.textLabel?.text = content.name
        }else {
            let content: Food = self.foodList[indexPath.row] as Food
            cell!.textLabel?.text = content.name
        }
        return cell!
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredContents = self.foodList.filter{
            (food) in
            if food.name.lowercaseString.containsString(searchController.searchBar.text!.lowercaseString){
                return true
            } else{
                return false
            }
        }
        print(self.filteredContents)
        self.tableView.reloadData()
    }
}



















