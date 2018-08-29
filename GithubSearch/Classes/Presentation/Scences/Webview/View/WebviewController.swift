//
//  WebviewController.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/29.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class WebviewController: UIViewController {
    
    private let subview: WebviewSubview = WebviewSubview()
    
    var disposeBag: DisposeBag = DisposeBag()
    
    var viewControllerDelegate: ViewControllerProtocol?
    
    private var router: WebviewRouter?
    
}

// MARK: - LIFECYCLE
extension WebviewController {
    
    override func viewDidLoad() {
        self.router = WebviewRouter(viewController: self)
        self.view.addSubview(self.subview.header)
        self.subview.header.addSubview(self.subview.dismissBtn)
        self.view.addSubview(self.subview.webview)
        
        self.reactor = WebViewReactor(router: self.router!)
    }
    
    override func viewDidLayoutSubviews() {
        self.subview.updateSubviewConstraint(viewController: self)
    }
    
}

// MARK: - Reactor
extension WebviewController: StoryboardView {
    
    func bind(reactor: WebViewReactor) {
        
        self.subview.dismissBtn.rx.tap
            .map { Reactor.Action.didDismiss }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
    }
    
}

// MARK: - Delegate
extension WebviewController: ViewControllerProtocol {
    
    func passRepoURL(url: String) {
        let url = URL(string: url)
        let urlRequest: URLRequest = URLRequest(url: url!)
        self.subview.webview.loadRequest(urlRequest)
    }
    
}
