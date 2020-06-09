//
//  Reducer.swift
//  
//
//  Created by Piotr Prokopowicz on 09/06/2020.
//

public typealias Reducer<ReducerState: State> = (_ action: Action, _ state: ReducerState?) -> ReducerState
