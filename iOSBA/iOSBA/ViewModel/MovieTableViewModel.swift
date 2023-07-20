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
    
    // MARK: -VARIABLES
    
    var tvShows: Observable<[tvshow]> = Observable([])
    
    var delegate: alertProtocol?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
}


// MARK: -REQUESTS

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

// MARK: -COREDATA

extension MovieTableViewModel{
    
    func addCoreData (dataFav:tvshow) -> Bool{
        
        do {
        
           let newFavShow = Tvshow(context: self.context)
            
            newFavShow.id = Int64(dataFav.show.id)
            
            newFavShow.name = dataFav.show.name
            
            newFavShow.score = dataFav.score ?? 0.0
            
            newFavShow.favorite = true
            
            newFavShow.url = dataFav.show.url
            
            newFavShow.type = dataFav.show.type
            
            newFavShow.language = dataFav.show.language
            
            newFavShow.status = dataFav.show.status
            
            newFavShow.summary = dataFav.show.summary
            
            newFavShow.imageMedium = dataFav.show.image?.medium
            
            newFavShow.imageOriginal = dataFav.show.image?.original
            
            newFavShow.imdb = dataFav.show.externals?.imdb
            
            try self.context.save()
            
            return true
            
        } catch {

            DispatchQueue.main.async {
                self.delegate?.alertMsg("Hubo un problema al guardar este show de TV.", "¿Quieres intentar nuevamente?")
            }
            
            return false
            
        }
        
    }
    
    func validateCoredata(_ datafav:tvshow) -> Bool {
        /*
        do {
            
            if let compareShow = datafav {
                
                self.context.delete(deleteShow)
                
                try context.save()
                
                return true
                
            }else{
                
                return false
                
            }
            
        } catch {
            
            return false
            
        }
         */
        
        return true
        
    }
    
    func deleteCoredata(_ datafav:Tvshow?) -> Bool {
        
        do {
            
            if let deleteShow = datafav {
                
                self.context.delete(deleteShow)
                
                try context.save()
                
                return true
                
            }else{
                
                return false
                
            }
            
        } catch {
            
            return false
            
        }
        
    }
    
}

