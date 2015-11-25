//
//  ImageDetailCell.swift
//  FindAMovie
//
//  Created by Paul on 11/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import UIKit
import Haneke

/**
*  Custom Image Detail Cell
*/
class ImageDetailCell: UICollectionViewCell {
    
    static let identifier = "image_detail_cell"
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /**
    Set the content of a specific cell
    
    - parameter image: Image
    */
    func setCell(image: Image){
    
        if let path = image.getImageURL(size: "w342") {
            
            self.imageDetail.hnk_setImageFromURL(path) {
                (let fetchImage) in
                
                self.imageDetail.image = fetchImage
            }
        }
        
    }
    
}
