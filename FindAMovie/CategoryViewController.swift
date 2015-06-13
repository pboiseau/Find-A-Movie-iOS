//
//  CategoryViewController.swift
//  FindAMovie
//
//  Created by Paul on 02/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import UIKit
import Alamofire

/**
*  Category View Controller
*/
class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var categoryTableView: UITableView!
    
    let api = MovieDbService()
    let categoryCell = "categoryCell"
    
    var categoriesList: [Category] = [Category]()
    var categories: Categories?
    
    /**
    Retrieve categories from Movie Db Service after loading the view
    */
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
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    /**
    Set the default number of sections in the table view
    
    :param: tableView UITableView
    
    :returns: Int
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /**
    Return the number of elements in the table view
    
    :param: tableView UITableView
    :param: section Int
    
    :returns: Int
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    /**
    Generate and set the content of each cell in the table view
    
    :param: tableView UITableView
    :param: indexPath NSIndexPath
    
    :returns: UITableViewCell
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(categoryCell, forIndexPath: indexPath) as! CategoryCell
        let row = indexPath.row
        
        cell.setCell(categoriesList[row].name, categoryStatus: false)
        
        return cell
    }
    
    /**
    Set category when user touch a cell
    
    :param: tableView UITableView
    :param: indexPath NSIndexPath
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)! as! CategoryCell
        
        // if categories fetch from api
        if let cat = categories {
            
            if !contains(cat.currentList, categoriesList[row].id) {
                cat.currentList.append(categoriesList[row].id)
                
                cell.switchCategoryState(true)
                
            } else {
                if let index = find(cat.currentList, categoriesList[row].id) {
                    cat.currentList.removeAtIndex(index)
                    
                    cell.switchCategoryState(false)
                }
            }
            
        }
        
    }
    
    /**
    Send categories to the Movie View Controller
    
    :param: segue  UIStoryboardSegue
    :param: sender AnyObject
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "displayMovie" {
            let movieViewController = segue.destinationViewController as! MovieViewController
            movieViewController.categories = self.categories
        }
        
    }
    
}
