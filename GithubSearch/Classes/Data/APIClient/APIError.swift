//
//  APIError.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/18.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import APIKit

struct APIError: Error {
    typealias Response = [String: Any]
    
    let statusCode: Int
    let message: String
    
    init(object: Any) {
        let dictionary = object as? Response
        statusCode = dictionary?["status"] as? Int ?? 999
        message = dictionary?["message"] as? String ?? "Unknown Error occured."
    }
}
