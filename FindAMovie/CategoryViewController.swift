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
    
    var selectedRow: [Bool] = [Bool]()
    
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
                
                for(var i = 0; i < categories.list.count; i++) {
                    self.selectedRow.append(false)
                }
                
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
        return categoriesList.count
    }
    
    /**
    Generate and set the content of each cell in the table view
    
    - parameter tableView: UITableView
    - parameter indexPath: NSIndexPath
    
    - returns: UITableViewCell
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCellWithIdentifier(categoryCell, forIndexPath: indexPath) as! CategoryCell
        let row = indexPath.row
        
        if(selectedRow.count == categoriesList.count && selectedRow[row]){
            cell.setCell(categoriesList[row].name, categoryStatus: true)
        } else {
            cell.setCell(categoriesList[row].name, categoryStatus: false)
        }
        
        return cell
    }
    
    
    /**
    Set category when user touch a cell
    
    - parameter tableView: UITableView
    - parameter indexPath: NSIndexPath
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)! as! CategoryCell
        
        // if categories fetch from api
        if let cat = categories {
            
            if !cat.currentList.contains(categoriesList[row].id) {
                cat.currentList.append(categoriesList[row].id)
                selectedRow[row] = true
                cell.switchCategoryState(true)
                
            } else {
                if let index = cat.currentList.indexOf(categoriesList[row].id) {
                    cat.currentList.removeAtIndex(index)
                    selectedRow[row] = false
                    cell.switchCategoryState(false)
                }
            }
            
        }
        
    }
    
    /**
    Send categories to the Movie View Controller
    
    - parameter segue:  UIStoryboardSegue
    - parameter sender: AnyObject
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "displayMovie" {
            let movieViewController = segue.destinationViewController as! MovieViewController
            movieViewController.categories = self.categories
        }
        
    }
    
}
