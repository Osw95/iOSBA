//
//  MovieTableViewModel.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import UIKit

final class MovieTableViewModel{
    
    var tvShows: Observable<[tvshow]> = Observable([])
    
    
    func getMovies(){
        
        
        let consumedApi = "search/shows?q=a"
        
        //var dataConsulted:[tvshow]?
        
        ApiManager().load(resource: consumedApi) { (result: APIResult<[tvshow]>) in
    
        switch result {
            
            case .success(let show):
            print("Nombre: \(show[0].show.name), Score: \(String(describing: show[0].score))")
            
            case .failure(let error):
                print("Error al obtener los datos: \(error)")
            
        }
            
        }
        
    }
    

}
