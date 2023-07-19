//
//  Observable.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import Foundation

final class Observable<T>{
    
    ///Value es el que tiene el valor y listener es el que consultas para dar ese valor y al que le vuelves asignar el valor
    ///Es algo extraño porque tienes que recordar que la instancia mantiene su valor en memoria
    ///La clave esta en el init y listener, el listener es privado porque solo lo ocupamos literal para que te notifique que se cambio un valor
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T?){
        self.value = value
    }
    
    private var listener:((T?) -> ())?
    
    ///Esto simplemente da el pitaso de que listener ya tiene un nuevo valor , y te va contestar a quien debe de hacer un reload donde necesitas
    func bind(_ listener: @escaping (T?) -> ()) {
        
        listener(value)
        
        self.listener = listener
        
    }
    
}
