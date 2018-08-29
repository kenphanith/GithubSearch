//
//  GithubRepositoryTranslator.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/21.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation

struct GithubRepositoryTranslator {
    
    typealias input = APIClient.Fetch.ResponseFetchRepositoryDecode
    typealias output = [GithubRepositoryModel]
    
    func translate(input: APIClient.Fetch.ResponseFetchRepositoryDecode) -> [GithubRepositoryModel] {
        var repositories: [GithubRepositoryModel] = []
        input.items.forEach { (repo) in
            let item = GithubRepositoryModel(
                id: repo.id,
                name: repo.name,
                fullName: repo.fullName,
                htmlUrl: repo.htmlUrl
            )
            repositories.append(item)
        }
        return repositories
    }
    
}
