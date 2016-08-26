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
    var buttonTopConstraint: SnapKit.Constraint!
    let candidates = [100, 200, 300] as [CGFloat]
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            self.buttonTopConstraint = make.top.equalTo(self.view).offset(10).constraint
        }
        button.setTitle("BUTTON", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapButton() {
        let offset = self.candidates[self.count]
        
        self.buttonTopConstraint.update(offset: offset)
        
        self.count = (self.count + 1) % self.candidates.count
    }
}

