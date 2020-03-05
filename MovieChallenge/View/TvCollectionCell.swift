//
//  TvCollectionCell.swift
//  MovieChallenge
//
//  Created by Beyza Paksin on 5.03.2020.
//  Copyright © 2020 Beyza Paksin. All rights reserved.
//

import UIKit

class TvCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var showTitle: UILabel!
    
    
    var show : Show? {
        
        didSet {
            
            if let  show = show {
                
                showTitle.text = show.name
                
            }
        }}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
     
        
        
}
}
