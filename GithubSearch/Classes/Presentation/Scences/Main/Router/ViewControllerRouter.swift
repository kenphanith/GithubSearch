//
//  ViewControllerRouter.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/20.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import UIKit

final class ViewControllerRouter {
    
    weak var viewController: ViewController?
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
}

// MARK: - I/F
extension ViewControllerRouter {
    
    /// navigate to webview with url
    ///
    /// - Parameter url: String
    func navigateToWebview(url: String) {
        let vc = WebviewController()
        self.viewController?.viewControllerDelegate = vc
        self.viewController?.viewControllerDelegate?.passRepoURL(url: url)
        self.viewController?.present(vc, animated: true, completion: nil)
    }
    
    
    /// show error alert dialog
    ///
    /// - Parameters:
    ///   - title: String
    ///   - message: String
    func showErrorAlert(title: String, message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel",
                                                        style: UIAlertActionStyle.default,
                                                        handler:{ (action: UIAlertAction!) -> Void in
        })
        vc.addAction(cancelAction)
        self.viewController?.present(vc, animated: true, completion: nil)
    }
    
}
