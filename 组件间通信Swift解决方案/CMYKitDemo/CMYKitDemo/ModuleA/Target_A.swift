//
//  Target_A.swift
//  CMYKitDemo
//
//  Created by  MarvinChan on 2019/3/28.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

/// 模拟ModuleA
    class Target_A: NSObject {
        @objc
        func Action_nativeFetchTestAViewController(_ params: [String: AnyObject]?) -> UIViewController? {
            let controller = TestAViewController()
            
            if let colorStr = params?["color"] {
                controller.view.backgroundColor = UIColor(hexString: colorStr as! String)
            }
            
            return controller
        }
        @objc
        func Action_Test() {
            print("hahaha...")
        }
        
        @objc
        func Action_Test(_ name: String) {
            print("hello \(name)")
        }
        
        @objc
        func Action_Test(_ name: String,age: Int) {
            print("hello \(name),age = \(age)")
        }
    }


