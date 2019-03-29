//
//  ViewController.swift
//  CMYKitDemo
//
//  Created by  MarvinChan on 2019/3/27.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y: 300, width: 200, height: 60)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        view.addSubview(button)
        
        self.perform(#selector(performAction(_:)), with: ["name": "Hello"])
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func clickAction() {
        if let controller = CMYRouter.shared.CMYRouter_viewControllerForTestA("0x218212") {
            self.navigationController?.show(controller, sender: nil)
        }
    }
    
    @objc func performAction(_ params: [String: AnyObject]?) {
     
        let target_A = Target_A()
        MethodTool.printMethodList(withObj: target_A)

        let selector = NSSelectorFromString("Action_nativeFetchTestAViewController:")
        if target_A.responds(to: selector) {
            print("111")
        }
        
        let selector2 = NSSelectorFromString("Action_Test")
        if target_A.responds(to: selector2) {
            print("2222222")
        }
        
        let sel3 = NSSelectorFromString("Action_Test:")
        if target_A.responds(to: sel3) {
            print("33333333333")
        }
        
        let sel4 = NSSelectorFromString("Action_Test:age:")
        if target_A.responds(to: sel4) {
            print("4444444")
        }
        
        
    }


}

