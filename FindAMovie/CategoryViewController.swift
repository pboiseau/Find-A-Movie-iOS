//
//  CategoryViewController.swift
//  FindAMovie
//
//  Created by Paul on 02/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import UIKit
import Alamofire

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var categoryTableView: UITableView!
    
    let api = MovieDbService()
    let categoryCell = "categoryCell"
    
    var categoriesList: [Category] = [Category]()
    var categories: Categories?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        MovieDbService().getCategories {
            (let categoriesObject) in
            
            if let categories = categoriesObject {
                
                self.categories = categories
                self.categoriesList = categories.list
                self.categoryTableView.reloadData()
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(categoryCell, forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = categoriesList[row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        
        // if categories fetch from api
        if let cat = categories {
            
            if !contains(cat.currentList, categoriesList[row].id) {
                cat.currentList.append(categoriesList[row].id)
            } else {
                if let index = find(cat.currentList, categoriesList[row].id) {
                    cat.currentList.removeAtIndex(index)
                }
            }
            
            println(cat.currentList)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "displayMovie" {
            let movieViewController = segue.destinationViewController as! MovieViewController
            movieViewController.categories = self.categories
        }
        
    }
    
    
}
