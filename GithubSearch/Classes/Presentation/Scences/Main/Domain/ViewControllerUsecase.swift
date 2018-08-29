//
//  ViewControllerUsecase.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/20.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import RxSwift

final class ViewControllerUsecase {
    private let api: FetchRepositoryAPIRepository = FetchRepositoryAPIRepository()
}


// MARK: - I/F
extension ViewControllerUsecase {
    
    func fetchRepository(query: String) -> Observable<[GithubRepositoryModel]> {
        return self.api.fetchRepository(query: query)
    }
    
}
