//
//  FetchRepositoryAPIRepository.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/21.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import RxSwift

final class FetchRepositoryAPIRepository {
    private let dataStore: FetchRepositoryAPIDataStore = FetchRepositoryAPIDataStore()
}


extension FetchRepositoryAPIRepository {
    
    func fetchRepository(query: String) -> Observable<[GithubRepositoryModel]> {
        return self.dataStore.fetchRepository(query: query)
            .map { GithubRepositoryTranslator().translate(input: $0) }
    }
    
}
