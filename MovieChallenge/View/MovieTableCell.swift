//
//  MovieTableViewCell.swift
//  MovieChallenge
//
//  Created by Beyza Paksin on 4.03.2020.
//  Copyright © 2020 Beyza Paksin. All rights reserved.
//

import UIKit

class MovieTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource{
   
    @IBOutlet weak var title: UILabel!
  
    
    
    var movies: [Movie]?

    @IBOutlet weak var movieCollection: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.movieCollection.delegate = self
        self.movieCollection.dataSource = self
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCollectionCell
            
        {
            cell.tag = indexPath.row
            
            if let movies = movies {
                cell.movie = movies[indexPath.row]
                
                
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    
 
  
  
  
 
    

}

