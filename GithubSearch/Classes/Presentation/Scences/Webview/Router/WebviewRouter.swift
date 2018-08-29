//
//  WebviewRouter.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/29.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation

final class WebviewRouter {
    
    /// refered to viewController type of this router class
    weak var viewController: WebviewController?
    
    /// init func
    ///
    /// - Parameter viewController: WebviewController
    init(viewController: WebviewController) {
        self.viewController = viewController
    }
    
}


// MARK: - I/F
extension WebviewRouter {
    
    func dismiss() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
    
}
