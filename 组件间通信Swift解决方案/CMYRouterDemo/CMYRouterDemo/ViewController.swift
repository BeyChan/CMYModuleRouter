//
//  ViewController.swift
//  CMYRouterDemo
//
//  Created by  MarvinChan on 2019/3/29.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .custom)
        button.frame = CGRect.init(x: 100, y: 200, width: 250, height: 150)
        button.backgroundColor = .orange
        button.setTitle("Go A", for: .normal)
        view.addSubview(button)
        button.add(for: .touchUpInside) {[weak self] in
            let controller = TestAModuleAPI.shared.aController
            self?.navigationController?.show(controller, sender: nil)
        }
    }


}

