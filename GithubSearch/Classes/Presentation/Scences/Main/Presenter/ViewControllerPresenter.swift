//
//  ViewControllerPresenter.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/20.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


final class ViewControllerPresenter {
    
    private let disposeBag: DisposeBag = DisposeBag()
    private let usecase: ViewControllerUsecase
    private let router: ViewControllerRouter
    
    init(usecase: ViewControllerUsecase, router: ViewControllerRouter) {
        self.usecase = usecase
        self.router = router
    }
    
}

// MARK: - Presenter func
extension ViewControllerPresenter {
    
    func fetchRepository(query: String) -> Observable<[GithubRepositoryModel]> {
        return self.usecase.fetchRepository(query: query)
    }
    
}
