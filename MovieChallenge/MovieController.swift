//
//  ViewController.swift
//  MovieChallenge
//
//  Created by Beyza Paksin on 4.03.2020.
//  Copyright © 2020 Beyza Paksin. All rights reserved.
//

import UIKit

class MovieController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 

    @IBOutlet weak var movieTable: UITableView!


    
    var topRatedMovies: [Movie]?
    var popularMovies: [Movie]?
    var nowPlayingMovies : [Movie]?
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
  
        
        NetworkManager.sharedManager.fetchTopRatedMovies(controller: self)
        NetworkManager.sharedManager.fetchNowPlayingMovies(controller: self)
        NetworkManager.sharedManager.fetchPopularMovies(controller: self)
        
        
        
          
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "movieSegue" {
            
            if let destination = segue.destination as? DetailController{
                
                if let cell = sender as? MovieCollectionCell, let top = topRatedMovies, let popular = popularMovies, let now = nowPlayingMovies{
                    
                   
  
                       let num = movieTable.indexPathForSelectedRow?.row
                    switch num {

                    case 0:
                          destination.movie = top[cell.tag]

                    case 1:
                         destination.movie = popular[cell.tag]
                    case 2:
                        destination.movie = now[cell.tag]
                    default:
                        break
                    }

          
                    
                    }}
            }
        }
    
    
      
    

    

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 3
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "tbCell", for: indexPath) as? MovieTableCell {
                if let top = topRatedMovies, let popular = popularMovies , let nowPlaying = nowPlayingMovies  {
                    
                      cell.tag = indexPath.row
                    switch indexPath.row {
                        
                    case 0:
                       
                        cell.movies = top
                        cell.title.text = "Top Rated Movies"
                    case 1:
                        
                      cell.movies = popular
                       cell.title.text = "Popular Movies"
                    case 2:
                       
                       cell.movies = nowPlaying
                        cell.title.text = "Now Playing Movies"
                    default:
                        break
                    }
  
                
                }
           
                return cell
                
                
              
        }
      return UITableViewCell()
  
}

   
 

}
