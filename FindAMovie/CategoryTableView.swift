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
    
    init(categories: [Category], cellIdentifier: String) {
        self.categories = categories
        self.cellIdentifier = cellIdentifier
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = categories[row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        
        println(categories[row].id)
        println(categories[row].name)
    }
}
