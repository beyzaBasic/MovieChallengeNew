//
//  TvTableViewCell.swift
//  MovieChallenge
//
//  Created by Beyza Paksin on 5.03.2020.
//  Copyright © 2020 Beyza Paksin. All rights reserved.
//

import UIKit




class TvTableCell: UITableViewCell , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var tvCollection: UICollectionView!
    
    var shows: [Show]?
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        self.tvCollection.delegate = self
        self.tvCollection.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return  10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TvCollectionCell", for: indexPath) as? TvCollectionCell
            
        {
            
            
            if let shows = shows {
                cell.show = shows[indexPath.row]
                
                
            }
            
            return cell
        }
        
            return UICollectionViewCell()

    

}

}
