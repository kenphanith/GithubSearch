//
//  WebviewSubview.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/29.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class WebviewSubview {
    
    /// webview UI Component
    lazy var webview: UIWebView = {
        let webview = UIWebView()
        return webview
    }()
    
    /// header field UI Component
    lazy var header: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    /// dismiss button
    lazy var dismissBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    /// Update All subview SnapKit Constraints
    ///
    /// - Parameter viewController: WebviewController
    func updateSubviewConstraint(viewController: WebviewController) {
        
        self.header.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10)
            make.top.equalToSuperview()
        }
        
        self.dismissBtn.snp.makeConstraints { (make) in
            make.width.equalToSuperview().dividedBy(4)
            make.height.equalToSuperview().dividedBy(2)
            make.centerY.equalToSuperview()
        }
        
        self.webview.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().offset(self.header.bounds.size.height)
            make.top.equalTo(self.header.snp.bottom)
        }
        
    }
    
}
