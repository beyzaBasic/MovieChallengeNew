//
//  MovieCollectionViewCell.swift
//  MovieChallenge
//
//  Created by Beyza Paksin on 4.03.2020.
//  Copyright © 2020 Beyza Paksin. All rights reserved.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    

    
    @IBOutlet weak var movieImage: UIImageView!
    
    
    @IBOutlet weak var movieTitle: UILabel!
    
    
    
    var movie : Movie? {
        
        didSet {
        
            if let  movie = movie {

                movieTitle.text = movie.title
                movieImage.load(url:URL(string: NetworkManager.sharedManager.imageURLString + movie.poster_path)!)
                
               
   
            }
        }}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
        
        
    }
    
    
    
    
}
