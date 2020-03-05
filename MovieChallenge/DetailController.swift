//
//  DetailController.swift
//  MovieChallenge
//
//  Created by Beyza Paksin on 5.03.2020.
//  Copyright © 2020 Beyza Paksin. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    var movie : Movie?
    var show: Show?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let movie = movie {
            
            name.text = movie.title
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
