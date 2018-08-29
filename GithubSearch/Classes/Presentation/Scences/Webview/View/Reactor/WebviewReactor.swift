//
//  WebviewReactor.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/29.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ReactorKit

final class WebViewReactor: Reactor {
    
    enum Action {
        case didDismiss
    }
    
    enum Mutation {
        
    }
    
    struct State {
        
    }
    
    var initialState: WebViewReactor.State
    
    var router: WebviewRouter
    
    init(router: WebviewRouter) {
        self.router = router
        self.initialState = State()
    }
    
    func mutate(action: WebViewReactor.Action) -> Observable<WebViewReactor.Mutation> {
        switch action {
            
        case .didDismiss:
            self.router.dismiss()
            return Observable.empty()
            
        }
    }

}
