//
//  ViewControllerNav.swift
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

final class ViewControllerNav: UIViewController {
    
    /// create subview instances
    private let subviews: ViewControllerSubview = ViewControllerSubview()
    
    /// Dispose
    var disposeBag: DisposeBag = DisposeBag()
    
    /// Usecase
    private let usecase: ViewControllerUsecase = ViewControllerUsecase()
    
    /// Router
    private var router: ViewControllerRouter?
    
    /// Presenter
    private var presenter: ViewControllerPresenter?
    
    // Delegator
    var viewControllerDelegate: ViewControllerProtocol?
    
}

// MARK: - LIFECYCLE
extension ViewControllerNav {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.router = ViewControllerRouter(viewController: self)
        self.presenter = ViewControllerPresenter(usecase: self.usecase, router: self.router!)
        
        self.view.addSubview(self.subviews.header)
        self.subviews.header.addSubview(self.subviews.appTitle)
        self.view.addSubview(self.subviews.searchBar)
        self.view.addSubview(self.subviews.searchResult)
        
        self.reactor = ViewControllerReactor(router: self.router!, viewController: self)
        self.reactor?.presenter = self.presenter
        
        self.subviews.searchResult.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLayoutSubviews() {
        self.subviews.updateSubviewConstraints(viewController: self)
    }
    
}


// MARK: - Reactor
extension ViewControllerNav: StoryboardView {
    
    func bind(reactor: ViewControllerReactor) {
        
        self.subviews.searchBar.rx.text
            .filter { $0!.count > 3 }
            .map { Reactor.Action.didQuery( $0! ) }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.subviews.searchResult.rx.itemSelected
            .map { Reactor.Action.didItemSelect($0) }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.reactor?.state
            .map { $0.repos }
            .bind(to: self.subviews.searchResult.rx.items(cellIdentifier: "cell")) { indexPath, repo, cell in
                cell.textLabel?.text = repo.fullName
            }
            .disposed(by: self.disposeBag)
        
    }
    
}
