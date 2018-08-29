//
//  ViewControllerReactor.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/20.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ReactorKit

final class ViewControllerReactor: Reactor {
    
    enum Action {
        case didQuery(String)
    }
    
    enum Mutation {
        case setQuery(String)
    }
    
    struct State {
        var query: String
    }
    
    let initialState: ViewControllerReactor.State
    
    weak var presenter: ViewControllerPresenter?
    
    init() {
        self.initialState = State(
            query: ""
        )
    }
}

// MARK: - Stream
extension ViewControllerReactor {
    
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
            
        case .didQuery(let query):
//            self.presenter?.fetchRepository(query: query)
//                .catchError({ (error) -> Observable<[GithubRepositoryModel]> in Observable.just([]) })
//                .flatMap { repoModel -> Observable<[GithubRepositoryModel]> in
//                    Observable.just(Mutation.setQueryData(repoModel))
            return Observable.just(Mutation.setQuery(query))
            
        }
    }
    
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        var newState = state
        switch mutation {
            
        case .setQuery(let query):
            newState.query = query
            
        }
        return newState
    }
}
