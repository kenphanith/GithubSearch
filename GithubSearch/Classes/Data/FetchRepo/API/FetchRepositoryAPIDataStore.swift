//
//  FetchRepositoryAPIDataStore.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/21.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import RxSwift

final class FetchRepositoryAPIDataStore {}

extension FetchRepositoryAPIDataStore {
    
    func fetchRepository(query: String) -> Observable<APIClient.Fetch.ResponseFetchRepositoryDecode> {
        return APIClient.Fetch.get(query: query)
    }
    
}
