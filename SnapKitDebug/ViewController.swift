//
//  ViewController.swift
//  SnapKitDebug
//
//  Created by Yuki Nagai on 8/26/16.
//  Copyright © 2016 Yuki Nagai, Ltd. All rights reserved.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    let usingSnapKit = true
    var buttonTopSnapKitConstraint: SnapKit.Constraint!
    var buttonTopConstraint: LayoutConstraint!
    let candidates = [100, 200, 300] as [CGFloat]
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        self.view.addSubview(button)
        if self.usingSnapKit {
            button.snp.makeConstraints { make in
                make.centerX.equalTo(self.view)
                self.buttonTopSnapKitConstraint = make.top.equalTo(self.view).offset(10).constraint
            }
            print(self.buttonTopSnapKitConstraint.layoutConstraints)
        } else {
            button.translatesAutoresizingMaskIntoConstraints = false
            let centerXConstraint = LayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
            let topConstraint = LayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 10)
            self.buttonTopConstraint = topConstraint
            LayoutConstraint.activate([centerXConstraint,topConstraint])
        }
        button.setTitle("BUTTON", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapButton() {
        let offset = self.candidates[self.count]
        
        if self.usingSnapKit {
            print(self.buttonTopSnapKitConstraint.layoutConstraints)
            self.buttonTopSnapKitConstraint.update(offset: offset)
        } else {
            self.buttonTopConstraint.constant = offset
        }
        
        self.count = (self.count + 1) % self.candidates.count
    }
}

