//
//  TestAViewController.swift
//  CMYKitDemo
//
//  Created by  MarvinChan on 2019/3/28.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

class TestAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y: 100, width: 100, height: 60)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func clickAction() {
        if let controller = CMYRouter.shared.CMYRouter_viewControllerForTestB("测试B") {
            self.navigationController?.show(controller, sender: nil)
        }
    }


}
