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

    @IBOutlet var categoryStatus: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(categoryTitle: String, categoryStatus: Bool) {
        
        self.categoryTitle.text = categoryTitle
        self.categoryStatus.setOn(categoryStatus, animated: true)
        self.categoryStatus.hidden = true
        
    }
    
    func switchCategoryState(state: Bool) {
        self.categoryStatus.hidden = !state
        self.categoryStatus.setOn(state, animated: true)
    }

}
