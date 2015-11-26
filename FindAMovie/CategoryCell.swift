//
//  CategoryCellTableViewCell.swift
//  FindAMovie
//
//  Created by Paul on 10/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import UIKit

/**
*  Custom Category Cell
*/
class CategoryCell: UITableViewCell {
    
    @IBOutlet var categoryTitle: UILabel!
    @IBOutlet weak var imageOverlay: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet var status: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        status.hidden = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    /**
    Initialize custom cell
    
    - parameter categoryTitle:: String
    - parameter categoryStatus:: Bool
    */
    func setCell(title categoryTitle: String, status categoryStatus: Bool) {
        
        self.categoryTitle.text = categoryTitle
        status.hidden = !categoryStatus
        
        if let imageKey = Categories.images[categoryTitle.lowercaseString] {
            backgroundImage.image = UIImage(named: imageKey)
        }
    }
    
    /**
    Switch category status UISwitch
    
    - parameter state:: Bool
    */
    func switchCategoryState(state: Bool) {
        status.hidden = !state
        
        let alpha: CGFloat = (state) ? 0.2 : 0.5
        imageOverlay.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(alpha)
    }

}
