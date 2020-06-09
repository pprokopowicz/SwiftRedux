//
//  StoreSubscriber.swift
//  
//
//  Created by Piotr Prokopowicz on 09/06/2020.
//

public protocol StoreSubscriber {
    
    func new(state: State)
    
}
