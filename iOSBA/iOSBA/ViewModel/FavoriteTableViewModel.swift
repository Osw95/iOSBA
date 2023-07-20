//
//  FavoriteTableViewModel.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import UIKit

final class FavoriteTableViewModel {
    
    // MARK: -VARIABLES
    
    var tvShowFavorites: Observable<[Tvshow]> = Observable([])
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var myFavoritesShows: [Tvshow]?
    
}

// MARK: -COREDATA

extension FavoriteTableViewModel {
    
    func getDataCoreData () {
        
        do{
            
            self.myFavoritesShows = try context.fetch(Tvshow.fetchRequest())
            
            tvShowFavorites.value = myFavoritesShows
            
        }
        catch{
            
            print("Ocurrio un error al recuperar los datos")
            
        }
        
    }
    
    
    
}
