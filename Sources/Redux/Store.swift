//
//  Store.swift
//  
//
//  Created by Piotr Prokopowicz on 09/06/2020.
//

public class Store<StoreState: State> {
    
    private let reducer: Reducer<StoreState>
    private var state: StoreState
    private var subscribers: [StoreSubscriber] = []
    
    init(state: StoreState, reducer: @escaping Reducer<StoreState>) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        if let thunk = action as? Thunk<StoreState> {
            thunk.body(dispatch, getState)
        }
        
        state = reducer(action, state)
        
        subscribers.forEach { $0.new(state: state) }
    }
    
    func subscribe(_ newSubscriber: StoreSubscriber) {
        subscribers.append(newSubscriber)
    }
    
    func getState() -> StoreState {
        state
    }

    func unsubscribe(_ storeSubscriber: StoreSubscriber) {
        guard let index = subscribers.firstIndex(where: { $0 as AnyObject === storeSubscriber as AnyObject }) else { return }
        
        subscribers.remove(at: index)
    }
    
}
