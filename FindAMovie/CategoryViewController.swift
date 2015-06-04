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
    
    let categories = ["Action", "Comedie", "Drame", "Policier", "Romance", "Western"]
    
    let textCellIdentifier = "TextCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        MovieDbService().getCategories {
            (let Categories) in
            
            println("Controller")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = categories[row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        println(categories[row])
    }
    
    @IBAction func validateCategory(sender: AnyObject) {
        
    }
    
    
}
