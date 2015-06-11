//
//  ImageDetailCell.swift
//  FindAMovie
//
//  Created by Paul on 11/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import UIKit
import Haneke

class ImageDetailCell: UICollectionViewCell {
    
    @IBOutlet var imageDetail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(image: Image){
        
        if let path = image.getImageURL() {
            
            self.imageDetail.hnk_setImageFromURL(path) {
                (let fetchImage) in
                
                self.imageDetail.image = fetchImage
            }
        }
        
    }
    
}
