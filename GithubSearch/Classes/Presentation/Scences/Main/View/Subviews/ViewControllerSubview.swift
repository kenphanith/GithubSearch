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
import Then

final class ViewControllerSubview {
    
    typealias viewController = ViewController
    
    /// gray header
    let header = UIView().then {
        $0.backgroundColor = UIColor.lightGray
    }
    
    
    /// app label title
    let appTitle = UILabel().then {
        $0.text = "Github Search"
    }
    
    /// search bar
    let searchBar = UISearchBar().then {
        $0.placeholder = "Search for github repository..."
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.gray.cgColor
    }
    
    // search result tableview
    let searchResult = UITableView()
    
    
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
