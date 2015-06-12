//
//  CategoryCellTableViewCell.swift
//  FindAMovie
//
//  Created by Paul on 10/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet var categoryTitle: UILabel!
    
    @IBOutlet var status: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /**
    Initialize custom cell
    
    :param: categoryTitle: String
    :param: categoryStatus: Bool
    */
    func setCell(categoryTitle: String, categoryStatus: Bool) {
        
        self.categoryTitle.text = categoryTitle
        self.status.hidden = true
        
    }
    
    /**
    Switch category status UISwitch
    
    :param: state: Bool
    */
    func switchCategoryState(state: Bool) {
        self.status.hidden = !state
    }

}
