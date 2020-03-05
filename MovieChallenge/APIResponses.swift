//
//  APIResponses.swift
//  MovieChallenge
//
//  Created by Beyza Paksin on 4.03.2020.
//  Copyright © 2020 Beyza Paksin. All rights reserved.
//

import Foundation

struct MoviePool : Codable {
    
    let page: Int
    
    let results: [Movie]?
    
}

struct Movie : Codable{
    
    let id: Int
    let title: String
    let overview: String
    let release_date: String
    let vote_average: Double
    let vote_count: Int
    let adult: Bool
    let poster_path: String
    let backdrop_path: String
    
    
    
}



struct ShowPool : Codable {
    
    let page: Int
    
    let results: [Show]?
    
}

struct Show : Codable{
    
    let id: Int
    let name: String
    let overview: String
    let first_air_date: String
    let vote_average: Double
    let vote_count: Int
    let poster_path: String
    let backdrop_path: String
    
    
    
}




