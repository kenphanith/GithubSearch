//
//  ViewControllerSubview.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/20.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class ViewControllerSubview {
    
    typealias viewController = ViewController
    
    
    /// gray header
    lazy var header: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    
    /// app label title
    lazy var appTitle: UILabel = {
        let label = UILabel()
        label.text = "Github Search"
        return label
    }()
    
    
    /// search bar
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for github repository..."
        searchBar.layer.borderWidth = 0.5
        searchBar.layer.borderColor = UIColor.gray.cgColor
        return searchBar
    }()
    
    lazy var searchResult: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    
    /// call this func to update subview constraints
    ///
    /// - Parameter viewController: ViewController
    func updateSubviewConstraints(viewController: ViewController) {
        
        self.appTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(20)
            make.center.equalToSuperview()
        }
        
        self.header.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.top.equalToSuperview()
        }
        
        self.searchBar.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(self.header.snp.bottom)
        }
        
        self.searchResult.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().offset(self.header.bounds.size.height + self.searchBar.bounds.size.height)
            make.top.equalTo(self.searchBar.snp.bottom)
        }
        
    }
    
}
