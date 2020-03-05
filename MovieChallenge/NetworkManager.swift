//
//  NetworkManager.swift
//  MovieChallenge
//
//  Created by Beyza Paksin on 4.03.2020.
//  Copyright © 2020 Beyza Paksin. All rights reserved.
//

import Foundation

class NetworkManager {
    
   
    
    public enum APIServiceError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
    }
    
    public static let sharedManager = NetworkManager()
    private init() {}
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "https://api.themoviedb.org/3")!
    
    let imageURLString = "https://image.tmdb.org/t/p/w200/"
    

    
    private let topRatedMovieURL = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=f2968aa878963619a7a4baaf5d1d5870&language=en-US&page=1")!
    
    
    private let nowPlayingMovieURL = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=f2968aa878963619a7a4baaf5d1d5870&language=en-US&page=1")!
    
    private let popularMovieURL = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=f2968aa878963619a7a4baaf5d1d5870&language=en-US&page=1")!
    
    
    private let topRatedTvURL = URL(string: "https://api.themoviedb.org/3/tv/top_rated?api_key=f2968aa878963619a7a4baaf5d1d5870&language=en-US&page=1")!
    
    
    
    private let popularTvURL = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=f2968aa878963619a7a4baaf5d1d5870&language=en-US&page=1")!
    private let apiKey = "f2968aa878963619a7a4baaf5d1d5870"
    
    
    
    
 
    
    
    func fetchMovies(url:URL,completionHandler: @escaping ([Movie]) -> Void) {
        
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("Error with fetching movies: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(response)")
                    return
            }
            
            let decoder = JSONDecoder()
            
            if let data = data,
                let movies = try? decoder.decode(MoviePool.self, from:data){
                completionHandler(movies.results ?? [])
                
                
            }

        })
        
        task.resume()
    }
    
    
    func fetchShows(url:URL,completionHandler: @escaping ([Show]) -> Void) {
        
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("Error with fetching movies: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(response)")
                    return
            }
            
            let decoder = JSONDecoder()
            
            if let data = data,
                let shows = try? decoder.decode(ShowPool.self, from:data){
                completionHandler(shows.results ?? [])
                
                
            }
            
            
            
        })
        
        task.resume()
    }
    
    func fetchTopRatedMovies (controller: MovieController) {
        
        
        fetchMovies(url:topRatedMovieURL) {
            [weak controller] (objects) in
            controller?.topRatedMovies = objects
            
            DispatchQueue.main.async {
                controller?.movieTable.reloadData()
            }
            
        }
    }
    
    func fetchNowPlayingMovies (controller: MovieController) {
        
        
        fetchMovies(url:nowPlayingMovieURL) {
            [weak controller] (objects) in
            controller?.nowPlayingMovies = objects
            
            DispatchQueue.main.async {
                controller?.movieTable.reloadData()
            }
            
        }
    }
    
    
    func fetchPopularMovies (controller: MovieController) {
        
        
        fetchMovies(url:popularMovieURL) {
            [weak controller] (objects) in
            controller?.popularMovies = objects
            
            DispatchQueue.main.async {
                controller?.movieTable.reloadData()
            }
            
        }
    }
    
    
    
    func fetchPopularShows (controller: TvShowController) {
        
        
        fetchShows(url:popularTvURL) {
            [weak controller] (objects) in
            controller?.popularShows = objects
            
            DispatchQueue.main.async {
                controller?.tvTable.reloadData()
            }
            
        }
    }
    
    func fetchTopRatedShows (controller: TvShowController) {
        
        
        fetchShows(url:topRatedTvURL) {
            [weak controller] (objects) in
            controller?.topRatedShows = objects
            
            DispatchQueue.main.async {
                controller?.tvTable.reloadData()
            }
            
        }
    }
    
}


