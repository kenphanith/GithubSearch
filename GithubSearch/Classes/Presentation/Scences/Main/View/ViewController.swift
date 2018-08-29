//
//  ViewController.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/18.
//  Copyright © 2018 Quad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit

final class ViewController: UIViewController {
    
    /// create subview instances
    private let subviews: ViewControllerSubview = ViewControllerSubview()
    
    /// Dispose
    var disposeBag: DisposeBag = DisposeBag()
    
    /// Usecase
    private let usecase: ViewControllerUsecase = ViewControllerUsecase()
    
    /// Router
    private let router: ViewControllerRouter = ViewControllerRouter()
    
    /// Presenter
    private var presenter: ViewControllerPresenter?
    
}


// MARK: - LIFECYCLE
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = ViewControllerPresenter(usecase: self.usecase, router: self.router)
        
        self.view.addSubview(self.subviews.header)
        self.subviews.header.addSubview(self.subviews.appTitle)
        self.view.addSubview(self.subviews.searchBar)
        self.view.addSubview(self.subviews.searchResult)
        
        self.reactor = ViewControllerReactor()
        self.reactor?.presenter = self.presenter
        
        self.subviews.searchResult.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.subviews.searchResult.delegate = self
        self.subviews.searchResult.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        self.subviews.updateSubviewConstraints(viewController: self)
    }
    
}


// MARK: - Reactor
extension ViewController: StoryboardView {
    
    func bind(reactor: ViewControllerReactor) {
        
        self.subviews.searchBar.rx.text
            .filter { $0!.count > 3 }
            .map { Reactor.Action.didQuery( $0! ) }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
    }
    
}

// MARK: - Tableview Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
}

