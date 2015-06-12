//
//  DetailMovieViewController.swift
//  FindAMovie
//
//  Created by Paul on 09/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet var imageCollection: UICollectionView!
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var overview: UITextView!
    @IBOutlet var poster: UIImageView!
    
    let api = MovieDbService()
    let movieDetailCell: String = "detailCell"
    
    var movie: Movie?
    var imageList: [Image] = [Image]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBlur()
        self.overview.editable = false
        
        if let movieDetail = self.movie {
            
            self.navigationItem.title = movieDetail.title
            self.overview.text = movieDetail.overview
            self.releaseDate.text = "Sortie le \(movieDetail.releaseDate!)"
            
            // Using image cache
            if let poster = movieDetail.getImageURL() {
                
                self.poster.hnk_setImageFromURL(poster) {
                    (let image) in
                    
                    self.poster.image = image
                }
                
            }
            
            api.getMovieImages(movieDetail.id) {
                (let images) in
                
                if let list = images?.list {
                    self.imageList = list
                    self.imageCollection.reloadData()
                }
                
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.imageList.count > 4) ? 4 : self.imageList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.movieDetailCell, forIndexPath: indexPath) as! ImageDetailCell
        let row = indexPath.row
    
        cell.setCell(imageList[row])
        
        return cell
    }
    
    func setBlur() {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = self.poster.frame
        self.poster.addSubview(blurView)
        
    }
}
