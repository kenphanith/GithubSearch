//
//  MainConfigurator.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/20.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation

final class ViewControllerConfigurator {
    
    typealias ViewControllerType = ViewController
    
    func configure(viewController: ViewController) {
        let usecase = ViewControllerUsecase()
        let router = ViewControllerRouter()
        let presenter = ViewControllerPresenter(usecase: usecase, router: router)
        viewController.presenter = presenter
    }
    
}
