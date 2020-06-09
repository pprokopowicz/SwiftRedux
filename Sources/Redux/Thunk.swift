//
//  Thunk.swift
//  
//
//  Created by Piotr Prokopowicz on 09/06/2020.
//

public struct Thunk<S: State>: Action {
    
    let body: (_ dispatch: @escaping DispatchFunction, _ getState: @escaping () -> S?) -> Void
    
    public init(body: @escaping (_ dispatch: @escaping DispatchFunction, _ getState: @escaping () -> S?) -> Void) {
        self.body = body
    }
    
}
