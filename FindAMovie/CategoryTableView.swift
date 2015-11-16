//
//  CategoryTableList.swift
//  FindAMovie
//
//  Created by Paul on 04/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import UIKit
import Foundation

class CategoryTableView: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var categories: [Category]
    var cellIdentifier: String
    
    /**
    Initialize a new category table view
    
    - parameter categories: Category
    - parameter cellIdentifier: String
    */
    init(categories: [Category], cellIdentifier: String) {
        self.categories = categories
        self.cellIdentifier = cellIdentifier
    }
    
    /**
    Set the default number of sections in the table view
    
    - parameter tableView: UITableView
    
    - returns: Int
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /**
    Return the number of elements in the table view
    
    - parameter tableView: UITableView
    - parameter section: Int
    
    - returns: Int
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    /**
    Generate and set the content of each cell in the table view
    
    - parameter tableView: UITableView
    - parameter indexPath: NSIndexPath
    
    - returns: UITableViewCell
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) 
        let row = indexPath.row
        cell.textLabel?.text = categories[row].name
        
        return cell
    }
    
}
