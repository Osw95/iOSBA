//
//  MovieTableViewModel.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import UIKit

protocol alertProtocol {
    
    func alertMsg(_ title:String, _ msg:String)
    
}


final class MovieTableViewModel{
    
    var tvShows: Observable<[tvshow]> = Observable([])
    
    var delegate: alertProtocol?
    
}

extension MovieTableViewModel{
    
    func getMovies(){
        
        let consumedApi = "search/shows?q=war"
        
        ApiManager().load(resource: consumedApi) { (result: APIResult<[tvshow]>) in
    
            switch result {
                
                case .success(let dataConsulted):
                
                print("Nombre: \(dataConsulted[0].show.name), Score: \(String(describing: dataConsulted[0].score))")
                
                self.tvShows.value = dataConsulted
              
                
                case .failure(let error):
                
                DispatchQueue.main.async {
                    self.delegate?.alertMsg("Ocurrió un error al consultar el servicio.", "¿Quieres intentar nuevamente?")
                }
                
                print("Error al obtener los datos: \(error)")
                
            }
            
        }
        
    }
    
}

