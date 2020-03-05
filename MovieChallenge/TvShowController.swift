//
//  TvShowViewController.swift
//  MovieChallenge
//
//  Created by Beyza Paksin on 5.03.2020.
//  Copyright © 2020 Beyza Paksin. All rights reserved.
//

import UIKit

class TvShowController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tvTable: UITableView!
   
        
        var topRatedShows: [Show]?
        var popularShows: [Show]?
        var nowPlayingShows : [Show]?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            
            NetworkManager.sharedManager.fetchTopRatedShows(controller: self)
          
            NetworkManager.sharedManager.fetchPopularShows(controller: self)
            
        }
        
        
        
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 4
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "tvTableCell", for: indexPath) as? TvTableCell {
                if let top = topRatedShows, let popular = popularShows  {
                    
                    
                    switch indexPath.row {
                        
                    case 0:
                        cell.shows = top
                        cell.tvTitle.text = "Top Rated TV Shows"
                    case 1:
                        cell.shows = popular
                        cell.tvTitle.text = "Popular TV Shows"
              
                    default:
                        break
                    }
                    
                    
                    
                    
                }
                
                return cell
                
                
                
            }
            return UITableViewCell()
            
        }
        
        
}
