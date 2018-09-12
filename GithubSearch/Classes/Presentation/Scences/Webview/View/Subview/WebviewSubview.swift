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
import Then

final class WebviewSubview {
    
    /// webview UI Component
    let webview = UIWebView()
    
    /// header field UI Component
    let header = UIView().then {
        $0.backgroundColor = UIColor.lightGray
    }
    
    /// dismiss button
    let dismissBtn = UIButton().then {
        $0.setTitle("Dismiss", for: .normal)
        $0.setTitleColor(UIColor.blue, for: .normal)
    }
    
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
